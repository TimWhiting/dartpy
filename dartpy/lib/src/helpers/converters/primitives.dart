import 'dart:ffi';

import 'package:dartpy/src/ffi/gen.dart';
import 'package:ffi/ffi.dart';
import '../../dartpy_base.dart';

extension PyInt on int {
  /// Converts an int to a python int
  Pointer<PyObject> get asPyInt => dartpyc.PyLong_FromLong(this);
}

extension PyFloat on double {
  /// Converts a double to a python float
  Pointer<PyObject> get asPyFloat => dartpyc.PyFloat_FromDouble(this);
}

extension PyNum on num {
  /// Converts a num to a python int or double
  Pointer<PyObject> get asPyNum {
    if (this is int) {
      return (this as int).asPyInt;
    } else {
      return (this as double).asPyFloat;
    }
  }
}

extension PyString on String {
  /// Converts a String to a python bytes object
  PythonString asPyBytes() {
    final allocated = toNativeUtf8();
    return PythonString(
        dartpyc.PyBytes_FromString(allocated.cast<Int8>()), allocated);
  }
}

class PythonString extends PyObjAllocated<Utf8> {
  PythonString(Pointer<PyObject> pyObj, Pointer<Utf8> allocated)
      : super(pyObj, allocated);
}

/// Manages a PyObject pointer with associated dart ffi allocation
class PyObjAllocated<T extends NativeType> {
  final Pointer<PyObject> pyObj;
  final Pointer<T>? allocated;
  bool freed = false;
  PyObjAllocated(this.pyObj, this.allocated);
  PyObjAllocated.noAllocation(this.pyObj) : allocated = null;

  void dispose() {
    dartpyc.Py_DecRef(pyObj);
    if (allocated != null && !freed) {
      malloc.free(allocated!);
      freed = true;
    }
  }

  void dealloc() {
    if (allocated != null && !freed) {
      malloc.free(allocated!);
      freed = true;
    }
  }
}

extension PrimitivesConversion on Pointer<PyObject> {
  /// Converts a python int to a dart int
  int get asInt {
    final res = dartpyc.PyLong_AsLong(this);
    if (!pyErrOccurred()) {
      dartpyc.Py_DecRef(this);
      return res;
    }
    throw DartPyException('Error in converting to an dart int');
  }

  /// Converts a python double to a dart double
  double get asDouble {
    final res = dartpyc.PyFloat_AsDouble(this);
    if (!pyErrOccurred()) {
      dartpyc.Py_DecRef(this);
      return res;
    }
    throw DartPyException('Error in converting to a dart double');
  }

  /// Converts a python int or double to a dart number
  num get asNum {
    try {
      dartpyc.Py_IncRef(this);
      final d = asDouble;
      final i = asInt;
      if (d != i) {
        return d;
      } else {
        return i;
      }
    } on DartPyException catch (_) {
      throw DartPyException('Error in converting to a dart num');
    }
  }

  String get asString {
    final res = dartpyc.PyBytes_AsString(this);
    if (!pyErrOccurred()) {
      dartpyc.Py_DecRef(this);
      final str = res.cast<Utf8>().toDartString();
      return str;
    }
    throw DartPyException('Error in converting to a dart String');
  }
}
