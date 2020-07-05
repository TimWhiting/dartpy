import 'dart:ffi' as ffi;

import 'generated.dart';

typedef DeallocFunc = int Function(ffi.Pointer<PyObject>);

void xincRef(ffi.Pointer<PyObject> p) {
  if (p.address == 0) {
    return;
  }
  Py_IncRef(p);
}

void xdecRef(ffi.Pointer<PyObject> p) {
  if (p.address == 0 || p.cast<PyObjectObj>().ref.ob_refcnt == 0) {
    return;
  }
  Py_DecRef(p);
}
