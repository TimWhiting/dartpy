import 'dart:ffi';

import 'package:dartpy/src/ffi/gen.dart';

import '../../dartpy_base.dart';

/// Converts an int to a python int
Pointer<PyObject> pyConvertInt(int o) {
  return dartpyc.PyLong_FromLong(o);
}

/// Converts a python int to a dart int
int pyConvertBackInt(Pointer<PyObject> o) {
  final res = dartpyc.PyLong_AsLong(o);
  if (!pyErrOccurred()) {
    dartpyc.Py_DecRef(o);
    return res;
  }
  throw DartPyException('Error in converting back to an int');
}

/// Converts a double to a python double
Pointer<PyObject> pyConvertDouble(double o) {
  return dartpyc.PyFloat_FromDouble(o);
}

/// Converts a python double to a dart double
double pyConvertBackDouble(Pointer<PyObject> o) {
  final res = dartpyc.PyFloat_AsDouble(o);
  if (!pyErrOccurred()) {
    dartpyc.Py_DecRef(o);
    return res;
  }
  throw DartPyException('Error in converting back to an double');
}

/// Converts a num to a python int or double
Pointer<PyObject> pyConvertNum(num o) {
  if (o is int) {
    return pyConvertInt(o);
  } else {
    return pyConvertDouble(o as double);
  }
}

/// Converts a python int or double to a dart number
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
