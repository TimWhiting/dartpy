import 'dart:ffi';

import 'package:dartpy/src/ffi/gen.dart';

import '../dartpy_base.dart';

/// Checks whether [object] is callable
bool pyIsCallable(Pointer<PyObject> object) {
  return dartpyc.PyCallable_Check(object) != 0;
}

/// Checks whether [object] is a boolean
bool pyIsBool(Pointer<PyObject> object) {
  return object == dartpyc.Py_True || object == dartpyc.Py_False;
}

// bool pyIsInt(Pointer<PyObject> object) {
//   return PyLong_Check(object) != 0;
// }

/// Checks whether an exception occured in python
bool pyErrOccurred() {
  return dartpyc.PyErr_Occurred() != nullptr;
}

/// Checks whether the python runtime was initialized
bool get pyInitialized {
  final inited = dartpyc.Py_IsInitialized();
  return inited != 0;
}
