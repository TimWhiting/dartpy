part of 'ffi.dart';

extension PyGlobals on DartPyC {
  /// The NotImplemented singleton, used to signal that an operation is not implemented for the given type combination.
  /// Increment the reference count before returning it.
  PyObject get Py_NotImplemented => Py_NotImplementedStruct;

  /// The Python None object, denoting lack of value. This object has no methods. It needs to be treated just like any other object with respect to reference counts.
  ffi.Pointer<PyObject> get Py_None => _Py_None;

  /// The Python False object. This object has no methods. It needs to be treated just like any other object with respect to reference counts.
  ffi.Pointer<PyObject> get Py_False => _Py_False;

  /// The Python True object. This object has no methods. It needs to be treated just like any other object with respect to reference counts.
  ffi.Pointer<PyObject> get Py_True => _Py_True;
}

final _Py_None = _pyLib.lookup<PyObject>('_Py_NoneStruct');

/// The Python False object. This object has no methods. It needs to be treated just like any other object with respect to reference counts.
final _Py_False = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      '_Py_FalseStruct',
    )
    .value;

/// The Python True object. This object has no methods. It needs to be treated just like any other object with respect to reference counts.
final _Py_True = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      '_Py_TrueStruct',
    )
    .value;
