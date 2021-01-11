export 'primitives.dart';
export 'collections.dart';

import 'dart:ffi';

import '../../dartpy_base.dart';
import '../bool_functions.dart';

/// Converts a Dart object to the python equivalent
///
/// The caller of this function takes ownership of the python object
/// and must call Py_DecRef after they are done with it.
Pointer<PyObject> pyConvertDynamic(Object? o) {
  if (o == null) {
    return dartpyc.Py_None;
  } else if (o is bool) {
    if (o) {
      return dartpyc.Py_True;
    } else {
      return dartpyc.Py_False;
    }
  } else if (o is int) {
    return pyConvertInt(o);
  } else if (o is double) {
    return pyConvertDouble(o);
  } else if (o is String) {
    throw UnimplementedError();
  } else if (o is List) {
    throw UnimplementedError();
  } else if (o is Map) {
    throw UnimplementedError();
  }
  throw UnimplementedError();
}

Object? pyConvertBackDynamic(Pointer<PyObject> result) {
  if (result == nullptr) {
    if (pyErrOccurred()) {
      throw UnimplementedError('Python error occurred');
    }
    return null;
  }

  if (result == dartpyc.Py_None) {
    dartpyc.Py_DecRef(result);
    return null;
  } else if (pyIsBool(result)) {
    if (result == dartpyc.Py_True) {
      dartpyc.Py_DecRef(result);
      return true;
    }
    dartpyc.Py_DecRef(result);
    return false;
  } else {
    final res = dartpyc.PyLong_AsLong(result);
    if (!pyErrOccurred()) {
      dartpyc.Py_DecRef(result);
      return res;
    }
  }
  throw UnimplementedError();
}
