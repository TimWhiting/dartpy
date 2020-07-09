import 'dart:ffi';

import '../../dartpy_base.dart';

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
