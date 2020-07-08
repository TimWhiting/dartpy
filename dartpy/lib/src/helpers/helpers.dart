import 'dart:ffi';
import 'package:basics/basics.dart';
import 'package:ffi/ffi.dart';

import '../dartpy_base.dart';

bool get pyInitialized {
  final inited = Py_IsInitialized();
  return inited != 0;
}

void _ensureInitialized() {
  if (!pyInitialized) {
    Py_Initialize();
  }
}

bool pyIsCallable(Pointer<PyObject> object) {
  return PyCallable_Check(object) != 0;
}

PyModule pyimport(String module) {
  _ensureInitialized();
  final mstring = Utf8.toUtf8(module);
  final pyString = PyUnicode_DecodeFSDefault(mstring.cast<Uint8>());
  free(mstring);
  final pyImport = PyImport_Import(pyString);
  Py_DecRef(pyString);
  if (pyImport != nullptr) {
    return PyModule(module, pyImport);
  } else {
    throw DartPyException('PyImport_Import failed, module $module not found');
  }
}

class PyModule {
  PyModule(this.moduleName, this._moduleRef);
  final String moduleName;
  final Pointer<PyObject> _moduleRef;
  final Map<String, PyFunction> _functions = {};
  PyFunction getFunction(String name) {
    if (_functions.containsKey(name)) {
      return _functions[name];
    }
    final funcName = Utf8.toUtf8(name);
    final pFunc = PyObject_GetAttrString(_moduleRef, funcName.cast<Uint8>());
    free(funcName);
    if (pFunc != nullptr) {
      if (pyIsCallable(pFunc)) {
        _functions[name] = PyFunction(pFunc);
        return _functions[name];
      } else {
        Py_DecRef(pFunc);
        throw DartPyException('$name is not callable');
      }
    } else {
      throw DartPyException('Function $name not found in module $moduleName');
    }
  }

  void dispose() {
    for (final func in _functions.entries) {
      func.value.dispose();
    }
    _functions.clear();
    Py_DecRef(_moduleRef);
  }
}

class PyFunction {
  final Pointer<PyObject> _function;
  final List<Pointer<PyObject>> _argumentAllocations = [];
  PyFunction(this._function);
  void dispose() {
    disposeArguments();
    Py_DecRef(_function);
  }

  void disposeArguments() {
    for (final arg in _argumentAllocations) {
      Py_DecRef(arg);
    }
    _argumentAllocations.clear();
  }
}

class DartPyException implements Exception {
  String message;
  DartPyException(this.message);
}

extension CallablePyObjectList on PyFunction {
  Pointer<PyObject> call(List<Object> args) {
    final pArgs = PyTuple_New(args.length);
    if (pArgs == nullptr) {
      throw DartPyException('Creating argument tuple failed');
    }
    for (final i in args.length.range) {
      Pointer<PyObject> arg;
      try {
        arg = convertArg(args[i]);
        PyTuple_SetItem(pArgs, i, arg);
      } on DartPyException catch (e) {
        Py_DecRef(arg);
        Py_DecRef(pArgs);
        throw DartPyException(
            'Failed while converting argument ${args[i]} with error $e');
      }
    }
    final result = PyObject_CallObject(_function, pArgs);
    Py_DecRef(pArgs);
    return result;
  }

  /// Converts a Dart object to the python equivalent
  ///
  /// The caller of this function takes ownership of the python object
  /// and must call Py_DecRef after they are done with it.
  Pointer<PyObject> convertArg(Object o) {
    if (o == null) {
      return Py_None;
    } else if (o is bool) {
      if (o) {
        return Py_True;
      } else {
        return Py_False;
      }
    } else if (o is int) {
      return PyLong_FromLong(o);
    } else if (o is double) {
      return PyFloat_FromDouble(o);
    } else if (o is String) {
      throw UnimplementedError();
    } else if (o is List) {
      throw UnimplementedError();
    } else if (o is Map) {
      throw UnimplementedError();
    }
    throw UnimplementedError();
  }
}
