// AUTOMATICALLY GENERATED. DO NOT EDIT.

import 'dart:ffi' as ffi;
import 'dart:io' as io show Platform;
import 'package:ffi/ffi.dart' as ffi;

/// Dynamic library
final ffi.DynamicLibrary _dynamicLibrary = _open();
ffi.DynamicLibrary _open() {
  if (io.Platform.isMacOS)
    return ffi.DynamicLibrary.open(
        '/usr/local/Frameworks/Python.framework/Versions/3.7/lib/libpython3.7m.dylib');
  throw UnsupportedError('This platform is not supported.');
}

/// PPyObject
class PyObject extends ffi.Struct {
  static ffi.Pointer<PyObject> allocate() {
    return ffi.allocate<PyObject>();
  }
}

///
class Py_ssize_t extends ffi.Struct {
  static ffi.Pointer<Py_ssize_t> allocate() {
    return ffi.allocate<Py_ssize_t>();
  }
}

///
class PyMethodDef extends ffi.Struct {
  static ffi.Pointer<PyMethodDef> allocate() {
    return ffi.allocate<PyMethodDef>();
  }
}

/// C function `Py_Initialize`.
int Py_Initialize() {
  return _Py_Initialize();
}

final _Py_Initialize_Dart _Py_Initialize =
    _dynamicLibrary.lookupFunction<_Py_Initialize_C, _Py_Initialize_Dart>(
  'Py_Initialize',
);
typedef _Py_Initialize_C = ffi.Uint32 Function();
typedef _Py_Initialize_Dart = int Function();

/// C function `PyRun_SimpleString`.
int PyRun_SimpleString(
  ffi.Pointer<ffi.Uint8> arg0,
) {
  return _PyRun_SimpleString(arg0);
}

final _PyRun_SimpleString_Dart _PyRun_SimpleString = _dynamicLibrary
    .lookupFunction<_PyRun_SimpleString_C, _PyRun_SimpleString_Dart>(
  'PyRun_SimpleString',
);
typedef _PyRun_SimpleString_C = ffi.Uint32 Function(
  ffi.Pointer<ffi.Uint8> arg0,
);
typedef _PyRun_SimpleString_Dart = int Function(
  ffi.Pointer<ffi.Uint8> arg0,
);

/// C function `Py_FinalizeEx`.
int Py_FinalizeEx() {
  return _Py_FinalizeEx();
}

final _Py_FinalizeEx_Dart _Py_FinalizeEx =
    _dynamicLibrary.lookupFunction<_Py_FinalizeEx_C, _Py_FinalizeEx_Dart>(
  'Py_FinalizeEx',
);
typedef _Py_FinalizeEx_C = ffi.Uint32 Function();
typedef _Py_FinalizeEx_Dart = int Function();

/// C function `PyImport_Import`.
ffi.Pointer PyImport_Import(
  ffi.Pointer<ffi.Uint8> arg0,
) {
  return _PyImport_Import(arg0);
}

final _PyImport_Import_Dart _PyImport_Import =
    _dynamicLibrary.lookupFunction<_PyImport_Import_C, _PyImport_Import_Dart>(
  'PyImport_Import',
);
typedef _PyImport_Import_C = ffi.Pointer Function(
  ffi.Pointer<ffi.Uint8> arg0,
);
typedef _PyImport_Import_Dart = ffi.Pointer Function(
  ffi.Pointer<ffi.Uint8> arg0,
);

/// C function `PyUnicode_DecodeFSDefault`.
ffi.Pointer PyUnicode_DecodeFSDefault(
  ffi.Pointer<ffi.Uint8> arg0,
) {
  return _PyUnicode_DecodeFSDefault(arg0);
}

final _PyUnicode_DecodeFSDefault_Dart _PyUnicode_DecodeFSDefault =
    _dynamicLibrary.lookupFunction<_PyUnicode_DecodeFSDefault_C,
        _PyUnicode_DecodeFSDefault_Dart>(
  'PyUnicode_DecodeFSDefault',
);
typedef _PyUnicode_DecodeFSDefault_C = ffi.Pointer Function(
  ffi.Pointer<ffi.Uint8> arg0,
);
typedef _PyUnicode_DecodeFSDefault_Dart = ffi.Pointer Function(
  ffi.Pointer<ffi.Uint8> arg0,
);

/// C function `PyObject_GetAttrString`.
ffi.Pointer PyObject_GetAttrString(
  ffi.Pointer arg0,
  ffi.Pointer<ffi.Uint8> arg1,
) {
  return _PyObject_GetAttrString(arg0, arg1);
}

final _PyObject_GetAttrString_Dart _PyObject_GetAttrString = _dynamicLibrary
    .lookupFunction<_PyObject_GetAttrString_C, _PyObject_GetAttrString_Dart>(
  'PyObject_GetAttrString',
);
typedef _PyObject_GetAttrString_C = ffi.Pointer Function(
  ffi.Pointer arg0,
  ffi.Pointer<ffi.Uint8> arg1,
);
typedef _PyObject_GetAttrString_Dart = ffi.Pointer Function(
  ffi.Pointer arg0,
  ffi.Pointer<ffi.Uint8> arg1,
);

/// C function `PyCallable_Check`.
int PyCallable_Check(
  ffi.Pointer arg0,
) {
  return _PyCallable_Check(arg0);
}

final _PyCallable_Check_Dart _PyCallable_Check =
    _dynamicLibrary.lookupFunction<_PyCallable_Check_C, _PyCallable_Check_Dart>(
  'PyCallable_Check',
);
typedef _PyCallable_Check_C = ffi.Uint32 Function(
  ffi.Pointer arg0,
);
typedef _PyCallable_Check_Dart = int Function(
  ffi.Pointer arg0,
);

/// C function `PyTuple_New`.
ffi.Pointer PyTuple_New(
  int arg0,
) {
  return _PyTuple_New(arg0);
}

final _PyTuple_New_Dart _PyTuple_New =
    _dynamicLibrary.lookupFunction<_PyTuple_New_C, _PyTuple_New_Dart>(
  'PyTuple_New',
);
typedef _PyTuple_New_C = ffi.Pointer Function(
  ffi.Uint32 arg0,
);
typedef _PyTuple_New_Dart = ffi.Pointer Function(
  int arg0,
);

/// C function `PyLong_FromLong`.
ffi.Pointer PyLong_FromLong(
  int arg0,
) {
  return _PyLong_FromLong(arg0);
}

final _PyLong_FromLong_Dart _PyLong_FromLong =
    _dynamicLibrary.lookupFunction<_PyLong_FromLong_C, _PyLong_FromLong_Dart>(
  'PyLong_FromLong',
);
typedef _PyLong_FromLong_C = ffi.Pointer Function(
  ffi.Uint64 arg0,
);
typedef _PyLong_FromLong_Dart = ffi.Pointer Function(
  int arg0,
);

/// C function `PyLong_AsLong`.
int PyLong_AsLong(
  ffi.Pointer arg0,
) {
  return _PyLong_AsLong(arg0);
}

final _PyLong_AsLong_Dart _PyLong_AsLong =
    _dynamicLibrary.lookupFunction<_PyLong_AsLong_C, _PyLong_AsLong_Dart>(
  'PyLong_AsLong',
);
typedef _PyLong_AsLong_C = ffi.Uint64 Function(
  ffi.Pointer arg0,
);
typedef _PyLong_AsLong_Dart = int Function(
  ffi.Pointer arg0,
);

/// C function `PyTuple_SetItem`.
int PyTuple_SetItem(
  ffi.Pointer arg0,
  int arg1,
  ffi.Pointer arg2,
) {
  return _PyTuple_SetItem(arg0, arg1, arg2);
}

final _PyTuple_SetItem_Dart _PyTuple_SetItem =
    _dynamicLibrary.lookupFunction<_PyTuple_SetItem_C, _PyTuple_SetItem_Dart>(
  'PyTuple_SetItem',
);
typedef _PyTuple_SetItem_C = ffi.Uint32 Function(
  ffi.Pointer arg0,
  ffi.Uint32 arg1,
  ffi.Pointer arg2,
);
typedef _PyTuple_SetItem_Dart = int Function(
  ffi.Pointer arg0,
  int arg1,
  ffi.Pointer arg2,
);

/// C function `PyObject_CallObject`.
ffi.Pointer PyObject_CallObject(
  ffi.Pointer arg0,
  ffi.Pointer arg1,
) {
  return _PyObject_CallObject(arg0, arg1);
}

final _PyObject_CallObject_Dart _PyObject_CallObject = _dynamicLibrary
    .lookupFunction<_PyObject_CallObject_C, _PyObject_CallObject_Dart>(
  'PyObject_CallObject',
);
typedef _PyObject_CallObject_C = ffi.Pointer Function(
  ffi.Pointer arg0,
  ffi.Pointer arg1,
);
typedef _PyObject_CallObject_Dart = ffi.Pointer Function(
  ffi.Pointer arg0,
  ffi.Pointer arg1,
);

/// C function `PyErr_Print`.
int PyErr_Print() {
  return _PyErr_Print();
}

final _PyErr_Print_Dart _PyErr_Print =
    _dynamicLibrary.lookupFunction<_PyErr_Print_C, _PyErr_Print_Dart>(
  'PyErr_Print',
);
typedef _PyErr_Print_C = ffi.Uint32 Function();
typedef _PyErr_Print_Dart = int Function();
