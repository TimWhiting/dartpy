import 'dart:ffi' as ffi;

import 'generated.dart';

typedef allocfunc = ffi.Pointer<PyObject> Function(
    ffi.Pointer<PyTypeObject>, int);

typedef destructor = void Function(ffi.Pointer<void>);
typedef freefunc = void Function(ffi.Pointer<void>);
typedef traverseproc = int Function(
    ffi.Pointer<void>, visitproc, ffi.Pointer<void>);
typedef newfunc = ffi.Pointer<PyObject> Function(
    ffi.Pointer<PyObject>, ffi.Pointer<PyObject>, ffi.Pointer<PyObject>);
typedef initproc = int Function(
    ffi.Pointer<PyObject>, ffi.Pointer<PyObject>, ffi.Pointer<PyObject>);
typedef reprfunc = ffi.Pointer<PyObject> Function(ffi.Pointer<PyObject>);
typedef getattrfunc = ffi.Pointer<PyObject> Function(
    ffi.Pointer<PyObject>, ffi.Pointer<ffi.Uint8>);
typedef setattrfunc = int Function(
    ffi.Pointer<PyObject>, ffi.Pointer<ffi.Uint8>, ffi.Pointer<PyObject>);
typedef getattrofunc = ffi.Pointer<PyObject> Function(
    ffi.Pointer<PyObject>, ffi.Pointer<PyObject>);
typedef setattrofunc = int Function(
    ffi.Pointer<PyObject>, ffi.Pointer<PyObject>, ffi.Pointer<PyObject>);
typedef descrget = ffi.Pointer<PyObject> Function(
    ffi.Pointer<PyObject>, ffi.Pointer<PyObject>, ffi.Pointer<PyObject>);
typedef descrset = int Function(
    ffi.Pointer<PyObject>, ffi.Pointer<PyObject>, ffi.Pointer<PyObject>);
typedef hashfunc = int Function(ffi.Pointer<PyObject>);

typedef visitproc = int Function(ffi.Pointer<PyObject>, ffi.Pointer<void>);
