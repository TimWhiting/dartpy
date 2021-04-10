import 'dart:ffi';

import 'package:dartpy/src/ffi/gen.dart';

import '../dartpy_base.dart';

extension IsType on Pointer<PyObject> {
  /// Checks whether [object] is a boolean
  bool get isBool => this == dartpyc.Py_True || this == dartpyc.Py_False;

  /// Checks whether [object] is callable
  bool get isCallable => dartpyc.PyCallable_Check(this) != 0;
}

// bool pyIsInt(Pointer<PyObject> object) {
//   return PyLong_Check(object) != 0;
// }

/// Checks whether an exception occured in python
bool pyErrOccurred() => dartpyc.PyErr_Occurred() != nullptr;

/// Checks whether the python runtime was initialized
bool get pyInitialized => dartpyc.Py_IsInitialized() != 0;
