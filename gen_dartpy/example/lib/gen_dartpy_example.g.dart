// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gen_dartpy_example.dart';

// **************************************************************************
// DartpyFunctionGenerator
// **************************************************************************

/// Calls the python function multiply
int pymultiply(int a, int b) {
  final pyModule = pyimport('multiply');
  final pFunc = pyModule.getFunction('multiply');
  final pArgs = PyTuple_New(2);
  if (pArgs == nullptr) {
    throw DartPyException('Creating argument tuple failed');
  }
  Pointer<PyObject> arg;
  try {
    arg = pyConvertInt(a);
    PyTuple_SetItem(pArgs, 0, arg);
  } on DartPyException catch (e) {
    Py_DecRef(arg);
    Py_DecRef(pArgs);
    throw DartPyException(
        'Failed while converting argument ${arg} with error $e');
  }
  try {
    arg = pyConvertInt(b);
    PyTuple_SetItem(pArgs, 1, arg);
  } on DartPyException catch (e) {
    Py_DecRef(arg);
    Py_DecRef(pArgs);
    throw DartPyException(
        'Failed while converting argument ${arg} with error $e');
  }
  final result = PyObject_CallObject(pFunc.pyFunctionObject, pArgs);
  Py_DecRef(pArgs);
  return pyConvertBackInt(result);
}

/// Calls the python function multiply
double pymultiplydouble(double a, double b) {
  final pyModule = pyimport('multiply');
  final pFunc = pyModule.getFunction('multiply');
  final pArgs = PyTuple_New(2);
  if (pArgs == nullptr) {
    throw DartPyException('Creating argument tuple failed');
  }
  Pointer<PyObject> arg;
  try {
    arg = pyConvertDouble(a);
    PyTuple_SetItem(pArgs, 0, arg);
  } on DartPyException catch (e) {
    Py_DecRef(arg);
    Py_DecRef(pArgs);
    throw DartPyException(
        'Failed while converting argument ${arg} with error $e');
  }
  try {
    arg = pyConvertDouble(b);
    PyTuple_SetItem(pArgs, 1, arg);
  } on DartPyException catch (e) {
    Py_DecRef(arg);
    Py_DecRef(pArgs);
    throw DartPyException(
        'Failed while converting argument ${arg} with error $e');
  }
  final result = PyObject_CallObject(pFunc.pyFunctionObject, pArgs);
  Py_DecRef(pArgs);
  return pyConvertBackDouble(result);
}

/// Calls the python function multiply
num pymultiplynum(num a, num b) {
  final pyModule = pyimport('multiply');
  final pFunc = pyModule.getFunction('multiply');
  final pArgs = PyTuple_New(2);
  if (pArgs == nullptr) {
    throw DartPyException('Creating argument tuple failed');
  }
  Pointer<PyObject> arg;
  try {
    arg = pyConvertNum(a);
    PyTuple_SetItem(pArgs, 0, arg);
  } on DartPyException catch (e) {
    Py_DecRef(arg);
    Py_DecRef(pArgs);
    throw DartPyException(
        'Failed while converting argument ${arg} with error $e');
  }
  try {
    arg = pyConvertNum(b);
    PyTuple_SetItem(pArgs, 1, arg);
  } on DartPyException catch (e) {
    Py_DecRef(arg);
    Py_DecRef(pArgs);
    throw DartPyException(
        'Failed while converting argument ${arg} with error $e');
  }
  final result = PyObject_CallObject(pFunc.pyFunctionObject, pArgs);
  Py_DecRef(pArgs);
  return pyConvertBackNum(result);
}
