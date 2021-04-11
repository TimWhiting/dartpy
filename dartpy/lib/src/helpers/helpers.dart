import 'dart:ffi';
import 'dart:io';
import 'package:dartpy/src/ffi/gen.dart';
import 'package:ffi/ffi.dart';
import '../dartpy_base.dart';
import 'bool_functions.dart';
export 'bool_functions.dart';
export 'converters/converters.dart';
import 'error.dart';
export 'error.dart';

late Pointer<Utf16> _pprogramLoc, _pathString;

/// Initializes the python runtime
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

/// Cleans up the memory of the loaded modules
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

/// Loads a python module
DartPyModule pyImport(String module) {
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

/// A dart representation for the python module
class DartPyModule {
  DartPyModule(this.moduleName, this._moduleRef);
  final String moduleName;
  final Pointer<PyObject> _moduleRef;
  final Map<String, DartPyFunction> _functions = {};

  /// Gets a function from the module
  DartPyFunction getFunction(String name) {
    if (_functions.containsKey(name)) {
      return _functions[name]!;
    }
    final funcName = name.toNativeUtf8();
    final pFunc =
        dartpyc.PyObject_GetAttrString(_moduleRef, funcName.cast<Int8>());
    malloc.free(funcName);
    if (pFunc != nullptr) {
      if (pFunc.isCallable) {
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

  /// Disposes the python module
  void dispose() {
    _moduleMap.remove(moduleName);
    for (final func in _functions.entries) {
      func.value.dispose();
    }
    _functions.clear();
    dartpyc.Py_DecRef(_moduleRef);
  }
}

/// A dart representation of a python function
class DartPyFunction {
  final Pointer<PyObject> _function;
  final List<Pointer<PyObject>> _argumentAllocations = [];
  Pointer<PyObject> get pyFunctionObject => _function;
  DartPyFunction(this._function);

  /// Disposes of the function
  void dispose() {
    disposeArguments();
    dartpyc.Py_DecRef(_function);
  }

  /// Disposes of the arguments to the function
  void disposeArguments() {
    for (final arg in _argumentAllocations) {
      dartpyc.Py_DecRef(arg);
    }
    _argumentAllocations.clear();
  }
}

extension CallablePyObjectList on DartPyFunction {
  /// Calls the python function with dart args marshalled back and forth
  Object call(List<Object> args) {
    final pArgs = dartpyc.PyTuple_New(args.length);
    if (pArgs == nullptr) {
      throw DartPyException('Creating argument tuple failed');
    }
    final pyObjs = <PyObjAllocated>[];
    for (var i = 0; i < args.length; i++) {
      PyObjAllocated? arg;
      try {
        arg = pyConvertDynamic(args[i]);
        dartpyc.PyTuple_SetItem(pArgs, i, arg.pyObj);
      } on DartPyException catch (e) {
        if (arg != null) {
          dartpyc.Py_DecRef(arg.pyObj);
        }
        dartpyc.Py_DecRef(pArgs);
        throw DartPyException(
            'Failed while converting argument ${args[i]} with error $e');
      }
    }
    final result = dartpyc.PyObject_CallObject(_function, pArgs);
    pyObjs.forEach((p) => p.dealloc());
    dartpyc.Py_DecRef(pArgs);
    return pyConvertBackDynamic(result)!;
  }
}
