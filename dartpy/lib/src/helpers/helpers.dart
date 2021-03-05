import 'dart:ffi';
import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:dartpy/src/ffi/gen.dart';
import 'package:ffi/ffi.dart';
import '../dartpy_base.dart';
import 'bool_functions.dart';
export 'bool_functions.dart';
export 'converters/converters.dart';
import 'error.dart';
export 'error.dart';

int strlen(Pointer<Utf16> string) {
  final array = string.cast<Uint16>();
  final nativeString = array.asTypedList(1000000);
  return nativeString.indexWhere((char) => char == 0);
}

String fromUtf16(Pointer<Utf16> string) {
  final length = strlen(string);
  return utf8.decode(Uint16List.view(
      string.cast<Uint16>().asTypedList(length).buffer, 0, length));
}

late Pointer<Utf16> _pprogramLoc, _pathString;
void pyStart() {
  _pprogramLoc = 'python3'.toNativeUtf16();
  dartpyc.Py_SetProgramName(_pprogramLoc.cast<Int32>());
  dartpyc.Py_Initialize();
  final pathString =
      '${Platform.environment["PYTHONPATH"]}:${Directory.current.absolute.path}';
  _pathString = pathString.toNativeUtf16();
  dartpyc.Py_SetPath(_pathString.cast<Int32>());
  if (pyErrOccurred()) {
    print('Error during initialization');
  }
  _ensureInitialized();
}

void _ensureInitialized() {
  if (!pyInitialized) {
    dartpyc.Py_Initialize();
  }
}

void pyCleanup() {
  if (pyErrOccurred()) {
    print('Exited with python error:');
    dartpyc.PyErr_Print();
  }
  for (final mod in List.of(_moduleMap.values)) {
    mod.dispose();
  }
  dartpyc.Py_FinalizeEx();
  if (_pprogramLoc == nullptr) {
    malloc.free(_pprogramLoc);
  }
  if (_pathString == nullptr) {
    malloc.free(_pathString);
  }
}

final _moduleMap = <String, DartPyModule>{};

DartPyModule pyimport(String module) {
  _ensureInitialized();
  if (_moduleMap.containsKey(module)) {
    return _moduleMap[module]!;
  }
  final mstring = module.toNativeUtf8();
  final pyString = dartpyc.PyUnicode_DecodeFSDefault(mstring.cast<Int8>());
  malloc.free(mstring);
  final pyImport = dartpyc.PyImport_Import(pyString);
  dartpyc.Py_DecRef(pyString);
  if (pyImport != nullptr) {
    final _mod = DartPyModule(module, pyImport);
    _moduleMap[module] = _mod;
    return _mod;
  } else {
    throw DartPyException(
        'Importing python module $module failed, make sure the $module is on your PYTHONPATH\n eg. export PYTHONPATH=\$PYTHONPATH:/path/to/$module');
  }
}

class DartPyModule {
  DartPyModule(this.moduleName, this._moduleRef);
  final String moduleName;
  final Pointer<PyObject> _moduleRef;
  final Map<String, DartPyFunction> _functions = {};
  DartPyFunction getFunction(String name) {
    if (_functions.containsKey(name)) {
      return _functions[name]!;
    }
    final funcName = name.toNativeUtf8();
    final pFunc =
        dartpyc.PyObject_GetAttrString(_moduleRef, funcName.cast<Int8>());
    malloc.free(funcName);
    if (pFunc != nullptr) {
      if (pyIsCallable(pFunc)) {
        _functions[name] = DartPyFunction(pFunc);
        return _functions[name]!;
      } else {
        dartpyc.Py_DecRef(pFunc);
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
    dartpyc.Py_DecRef(_moduleRef);
  }
}

class DartPyFunction {
  final Pointer<PyObject> _function;
  final List<Pointer<PyObject>> _argumentAllocations = [];
  Pointer<PyObject> get pyFunctionObject => _function;
  DartPyFunction(this._function);
  void dispose() {
    disposeArguments();
    dartpyc.Py_DecRef(_function);
  }

  void disposeArguments() {
    for (final arg in _argumentAllocations) {
      dartpyc.Py_DecRef(arg);
    }
    _argumentAllocations.clear();
  }
}

extension CallablePyObjectList on DartPyFunction {
  Object call(List<Object> args) {
    final pArgs = dartpyc.PyTuple_New(args.length);
    if (pArgs == nullptr) {
      throw DartPyException('Creating argument tuple failed');
    }
    for (var i = 0; i < args.length; i++) {
      Pointer<PyObject>? arg;
      try {
        arg = pyConvertDynamic(args[i]);
        dartpyc.PyTuple_SetItem(pArgs, i, arg);
      } on DartPyException catch (e) {
        if (arg != null) {
          dartpyc.Py_DecRef(arg);
        }
        dartpyc.Py_DecRef(pArgs);
        throw DartPyException(
            'Failed while converting argument ${args[i]} with error $e');
      }
    }
    final result = dartpyc.PyObject_CallObject(_function, pArgs);
    dartpyc.Py_DecRef(pArgs);
    return pyConvertBackDynamic(result)!;
  }
}
