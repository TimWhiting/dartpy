import 'dart:ffi';

import 'package:dartpy/src/ffi/gen.dart';

import '../../dartpy_base.dart';

Pointer<PyObject> pyConvertInt(int o) {
  return dartpyc.PyLong_FromLong(o);
}

int pyConvertBackInt(Pointer<PyObject> o) {
  final res = dartpyc.PyLong_AsLong(o);
  if (!pyErrOccurred()) {
    dartpyc.Py_DecRef(o);
    return res;
  }
  throw DartPyException('Error in converting back to an int');
}

Pointer<PyObject> pyConvertDouble(double o) {
  return dartpyc.PyFloat_FromDouble(o);
}

double pyConvertBackDouble(Pointer<PyObject> o) {
  final res = dartpyc.PyFloat_AsDouble(o);
  if (!pyErrOccurred()) {
    dartpyc.Py_DecRef(o);
    return res;
  }
  throw DartPyException('Error in converting back to an double');
}

Pointer<PyObject> pyConvertNum(num o) {
  if (o is int) {
    return pyConvertInt(o);
  } else {
    return pyConvertDouble(o as double);
  }
}

num pyConvertBackNum(Pointer<PyObject> o) {
  try {
    dartpyc.Py_IncRef(o);
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
