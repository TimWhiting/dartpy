import 'dart:ffi';
import 'dart:io';
import 'package:basics/basics.dart';
import 'package:ffi/ffi.dart';
import 'package:path/path.dart' as path;
import '../dartpy_base.dart';
import 'bool_functions.dart';
export 'bool_functions.dart';
export 'converters/converters.dart';
import 'error.dart';
export 'error.dart';

Pointer<Utf16> _pprogramLoc = null;
void pyStart(String fileName) {
  final programLoc = path.join(Directory.current.absolute.path, fileName);
  print(programLoc);
  _pprogramLoc = Utf16.toUtf16(programLoc);
  Py_SetProgramName(_pprogramLoc.cast<Uint16>());
  _ensureInitialized();
}

void _ensureInitialized() {
  if (!pyInitialized) {
    Py_Initialize();
  }
}

void pyCleanup() {
  for (final mod in List.of(_moduleMap.values)) {
    mod.dispose();
  }
  Py_FinalizeEx();
  if (_pprogramLoc == nullptr) {
    free(_pprogramLoc);
  }
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

extension CallablePyObjectList on DartPyFunction {
  Object call(List<Object> args) {
    final pArgs = PyTuple_New(args.length);
    if (pArgs == nullptr) {
      throw DartPyException('Creating argument tuple failed');
    }
    for (final i in args.length.range) {
      Pointer<PyObject> arg;
      try {
        arg = pyConvertDynamic(args[i]);
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
    return pyConvertBackDynamic(result);
  }
}
