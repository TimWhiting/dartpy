import 'dart:io';
import 'dart:ffi';
import 'package:ffi/ffi.dart';

import 'package:dartpy/dartpy.dart';

late Pointer<PyModuleDef> module;
void main(List<String> args) {
  // initializes the python runtime
  pyLibLocation =
      '/usr/local/Frameworks/Python.framework/Versions/3.9/lib/libpython3.9.dylib';

  try {
    final moduleName = 'dartmod'.toNativeUtf8().cast<Int8>();
    final methodName = 'calledFromPython'.toNativeUtf8().cast<Int8>();
    final docString = 'Doc'.toNativeUtf8().cast<Int8>();
    final moduleMethods =
        calloc.allocate<PyMethodDef>(sizeOf<PyMethodDef>() * 2);
    moduleMethods.ref.ml_name = methodName;
    moduleMethods.ref.ml_flags = METH_VARARGS;
    moduleMethods.ref.ml_doc = docString;
    moduleMethods.ref.ml_meth = Pointer.fromFunction(calledFromPython);
    module = calloc.allocate<PyModuleDef>(sizeOf<PyModuleDef>());
    final base = calloc.allocate<PyModuleDef_Base>(sizeOf<PyModuleDef_Base>());
    module.ref.m_base = base.ref;
    module.ref.m_name = moduleName;
    module.ref.m_size = -1;
    module.ref.m_methods = moduleMethods;

    dartpyc.PyImport_AppendInittab(moduleName, Pointer.fromFunction(initFunc));
    pyStart();
    // imports a python module
    final pyModule = pyimport('custom');
    // gets a function within that module
    final pFunc = pyModule.getFunction('multiply');
    // calls the function and gets the result
    final result = pFunc([1, 2]);

    print(result);
  } on DartPyException catch (e) {
    print(e);
    // Cleans up memory
    pyCleanup();
    exit(1);
  }
  // Cleans up memory
  pyCleanup();
  exit(0);
}

Pointer<PyObject> initFunc() {
  return dartpyc.PyModule_CreateInitialized(module, 1013);
}

Pointer<PyObject> calledFromPython(
    Pointer<PyObject> self, Pointer<PyObject> args) {
  print('Called from Python');
  return self;
}
