import 'dart:ffi';

import '../dartpy_base.dart';

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

bool get pyInitialized {
  final inited = Py_IsInitialized();
  return inited != 0;
}
