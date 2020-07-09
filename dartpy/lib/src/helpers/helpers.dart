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

bool pyIsBool(Pointer<PyObject> object) {
  return object == Py_True || object == Py_False;
}

bool pyIsInt(Pointer<PyObject> object) {
  return PyLong_Check(object) != 0;
}

bool pyErrOccurred() {
  return PyErr_Occurred() != nullptr;
}

void pyCleanup() {
  for (final mod in _moduleMap.values) {
    mod.dispose();
  }
  Py_FinalizeEx();
}

final _moduleMap = <String, DartPyModule>{};

DartPyModule pyimport(String module) {
  _ensureInitialized();
  if (_moduleMap.containsKey(module)) {
    return _moduleMap[module];
  }
  final mstring = Utf8.toUtf8(module);
  final pyString = PyUnicode_DecodeFSDefault(mstring.cast<Uint8>());
  free(mstring);
  final pyImport = PyImport_Import(pyString);
  Py_DecRef(pyString);
  if (pyImport != nullptr) {
    final _mod = DartPyModule(module, pyImport);
    _moduleMap[module] = _mod;
    return _mod;
  } else {
    throw DartPyException('PyImport_Import failed, module $module not found');
  }
}

class DartPyModule {
  DartPyModule(this.moduleName, this._moduleRef);
  final String moduleName;
  final Pointer<PyObject> _moduleRef;
  final Map<String, DartPyFunction> _functions = {};
  DartPyFunction getFunction(String name) {
    if (_functions.containsKey(name)) {
      return _functions[name];
    }
    final funcName = Utf8.toUtf8(name);
    final pFunc = PyObject_GetAttrString(_moduleRef, funcName.cast<Uint8>());
    free(funcName);
    if (pFunc != nullptr) {
      if (pyIsCallable(pFunc)) {
        _functions[name] = DartPyFunction(pFunc);
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
    _moduleMap.remove(moduleName);
    for (final func in _functions.entries) {
      func.value.dispose();
    }
    _functions.clear();
    Py_DecRef(_moduleRef);
  }
}

class DartPyFunction {
  final Pointer<PyObject> _function;
  final List<Pointer<PyObject>> _argumentAllocations = [];
  Pointer<PyObject> get pyFunctionObject => _function;
  DartPyFunction(this._function);
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

Pointer<PyObject> pyConvertInt(int o) {
  return PyLong_FromLong(o);
}

int pyConvertBackInt(Pointer<PyObject> o) {
  final res = PyLong_AsLong(o);
  if (!pyErrOccurred()) {
    Py_DecRef(o);
    return res;
  }
  throw DartPyException('Error in converting back to an int');
}

Pointer<PyObject> pyConvertDouble(double o) {
  return PyFloat_FromDouble(o);
}

double pyConvertBackDouble(Pointer<PyObject> o) {
  final res = PyFloat_AsDouble(o);
  if (!pyErrOccurred()) {
    Py_DecRef(o);
    return res;
  }
  throw DartPyException('Error in converting back to an double');
}

Pointer<PyObject> pyConvertNum(num o) {
  if (o is int) {
    return pyConvertInt(o);
  } else {
    return pyConvertDouble(o);
  }
}

num pyConvertBackNum(Pointer<PyObject> o) {
  try {
    Py_IncRef(o);
    final d = pyConvertBackDouble(o);
    final i = pyConvertBackInt(o);
    if (d != i) {
      return d;
    } else {
      return i;
    }
  } on DartPyException catch (_) {
    throw DartPyException('Error in converting back to a num');
  }
}

extension CallablePyObjectList on DartPyFunction {
  Object call(List<Object> args) {
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
    return convertResult(result);
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
      return pyConvertInt(o);
    } else if (o is double) {
      return pyConvertDouble(o);
    } else if (o is String) {
      throw UnimplementedError();
    } else if (o is List) {
      throw UnimplementedError();
    } else if (o is Map) {
      throw UnimplementedError();
    }
    throw UnimplementedError();
  }

  Object convertResult(Pointer<PyObject> result) {
    if (result == nullptr) {
      if (pyErrOccurred()) {
        throw UnimplementedError('Python error occurred');
      }
      return null;
    }

    if (result == Py_None) {
      Py_DecRef(result);
      return null;
    } else if (pyIsBool(result)) {
      if (result == Py_True) {
        Py_DecRef(result);
        return true;
      }
      Py_DecRef(result);
      return false;
    } else {
      final res = PyLong_AsLong(result);
      if (!pyErrOccurred()) {
        Py_DecRef(result);
        return res;
      }
    }
    throw UnimplementedError();
  }
}
