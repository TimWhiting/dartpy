// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'gen_dartpy_example.dart';

// **************************************************************************
// DartpyFunctionGenerator
// **************************************************************************

/// Calls the python function multiply
int pymultiply(int a, int b) {
  final pyModule = pyImport('multiply');
  final pFunc = pyModule.getFunction('multiply');
  final pArgs = dartpyc.PyTuple_New(2);
  if (pArgs == nullptr) {
    throw DartPyException('Creating argument tuple failed');
  }
  Pointer<PyObject>? arg;
  arg = null;
  try {
    arg = a.asPyInt;
    dartpyc.PyTuple_SetItem(pArgs, 0, arg);
  } on DartPyException catch (e) {
    if (arg != null) {
      dartpyc.Py_DecRef(arg);
    }
    dartpyc.Py_DecRef(pArgs);
    throw DartPyException(
        'Failed while converting argument $arg with error $e');
  }
  arg = null;
  try {
    arg = b.asPyInt;
    dartpyc.PyTuple_SetItem(pArgs, 1, arg);
  } on DartPyException catch (e) {
    if (arg != null) {
      dartpyc.Py_DecRef(arg);
    }
    dartpyc.Py_DecRef(pArgs);
    throw DartPyException(
        'Failed while converting argument $arg with error $e');
  }
  final result = dartpyc.PyObject_CallObject(pFunc.pyFunctionObject, pArgs);
  dartpyc.Py_DecRef(pArgs);
  return result.asInt;
}

/// Calls the python function multiply
double pymultiplydouble(double a, double b) {
  final pyModule = pyImport('multiply');
  final pFunc = pyModule.getFunction('multiply');
  final pArgs = dartpyc.PyTuple_New(2);
  if (pArgs == nullptr) {
    throw DartPyException('Creating argument tuple failed');
  }
  Pointer<PyObject>? arg;
  arg = null;
  try {
    arg = a.asPyFloat;
    dartpyc.PyTuple_SetItem(pArgs, 0, arg);
  } on DartPyException catch (e) {
    if (arg != null) {
      dartpyc.Py_DecRef(arg);
    }
    dartpyc.Py_DecRef(pArgs);
    throw DartPyException(
        'Failed while converting argument $arg with error $e');
  }
  arg = null;
  try {
    arg = b.asPyFloat;
    dartpyc.PyTuple_SetItem(pArgs, 1, arg);
  } on DartPyException catch (e) {
    if (arg != null) {
      dartpyc.Py_DecRef(arg);
    }
    dartpyc.Py_DecRef(pArgs);
    throw DartPyException(
        'Failed while converting argument $arg with error $e');
  }
  final result = dartpyc.PyObject_CallObject(pFunc.pyFunctionObject, pArgs);
  dartpyc.Py_DecRef(pArgs);
  return result.asDouble;
}

/// Calls the python function multiply
num pymultiplynum(num a, num b) {
  final pyModule = pyImport('multiply');
  final pFunc = pyModule.getFunction('multiply');
  final pArgs = dartpyc.PyTuple_New(2);
  if (pArgs == nullptr) {
    throw DartPyException('Creating argument tuple failed');
  }
  Pointer<PyObject>? arg;
  arg = null;
  try {
    arg = a.asPyNum;
    dartpyc.PyTuple_SetItem(pArgs, 0, arg);
  } on DartPyException catch (e) {
    if (arg != null) {
      dartpyc.Py_DecRef(arg);
    }
    dartpyc.Py_DecRef(pArgs);
    throw DartPyException(
        'Failed while converting argument $arg with error $e');
  }
  arg = null;
  try {
    arg = b.asPyNum;
    dartpyc.PyTuple_SetItem(pArgs, 1, arg);
  } on DartPyException catch (e) {
    if (arg != null) {
      dartpyc.Py_DecRef(arg);
    }
    dartpyc.Py_DecRef(pArgs);
    throw DartPyException(
        'Failed while converting argument $arg with error $e');
  }
  final result = dartpyc.PyObject_CallObject(pFunc.pyFunctionObject, pArgs);
  dartpyc.Py_DecRef(pArgs);
  return result.asNum;
}
