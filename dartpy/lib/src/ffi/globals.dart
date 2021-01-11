part of 'ffi.dart';

/// C global `PyExc_BaseException`.
final ffi.Pointer<PyObject> PyExc_BaseException = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_BaseException',
    )
    .value;

/// C global `PyExc_Exception`.
final ffi.Pointer<PyObject> PyExc_Exception = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_Exception',
    )
    .value;

/// C global `PyExc_ArithmeticError`.
final ffi.Pointer<PyObject> PyExc_ArithmeticError = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_ArithmeticError',
    )
    .value;

/// C global `PyExc_AssertionError`.
final ffi.Pointer<PyObject> PyExc_AssertionError = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_AssertionError',
    )
    .value;

/// C global `PyExc_AttributeError`.
final ffi.Pointer<PyObject> PyExc_AttributeError = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_AttributeError',
    )
    .value;

/// C global `PyExc_BlockingIOError`.
final ffi.Pointer<PyObject> PyExc_BlockingIOError = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_BlockingIOError',
    )
    .value;

/// C global `PyExc_BrokenPipeError`.
final ffi.Pointer<PyObject> PyExc_BrokenPipeError = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_BrokenPipeError',
    )
    .value;

/// C global `PyExc_Floatingffi.PointError`.
final ffi.Pointer<PyObject> PyExc_FloatingPointError = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_Floatingffi.PointError',
    )
    .value;

/// C global `PyExc_OverflowError`.
final ffi.Pointer<PyObject> PyExc_OverflowError = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_OverflowError',
    )
    .value;

/// C global `PyExc_ZeroDivisionError`.
final ffi.Pointer<PyObject> PyExc_ZeroDivisionError = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_ZeroDivisionError',
    )
    .value;

/// C global `PyExc_OSError`.
final ffi.Pointer<PyObject> PyExc_OSError = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_OSError',
    )
    .value;

/// C global `PyExc_IOError`.
final ffi.Pointer<PyObject> PyExc_IOError = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_IOError',
    )
    .value;

/// C global `PyExc_ValueError`.
final ffi.Pointer<PyObject> PyExc_ValueError = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_ValueError',
    )
    .value;

/// C global `PyExc_EOFError`.
final ffi.Pointer<PyObject> PyExc_EOFError = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_EOFError',
    )
    .value;

/// C global `PyExc_MemoryError`.
final ffi.Pointer<PyObject> PyExc_MemoryError = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_MemoryError',
    )
    .value;

/// C global `PyExc_IndexError`.
final ffi.Pointer<PyObject> PyExc_IndexError = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_IndexError',
    )
    .value;

/// C global `PyExc_KeyError`.
final ffi.Pointer<PyObject> PyExc_KeyError = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_KeyError',
    )
    .value;

/// C global `PyExc_TypeError`.
final ffi.Pointer<PyObject> PyExc_TypeError = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_TypeError',
    )
    .value;

/// The NotImplemented singleton, used to signal that an operation is not implemented for the given type combination.
/// Increment the reference count before returning it.
final ffi.Pointer<PyObject> Py_NotImplemented = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      'Py_NotImplemented',
    )
    .value;

/// The C structure of the objects used to describe built-in types.
final ffi.Pointer<PyObject> PyType_Type = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      'PyType_Type',
    )
    .value;

/// The Python None object, denoting lack of value. This object has no methods. It needs to be treated just like any other object with respect to reference counts.
final ffi.Pointer<PyObject> Py_None = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      '_Py_NoneStruct',
    )
    .value;

/// The Python False object. This object has no methods. It needs to be treated just like any other object with respect to reference counts.
final ffi.Pointer<PyObject> Py_False = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      '_Py_FalseStruct',
    )
    .value;

/// The Python True object. This object has no methods. It needs to be treated just like any other object with respect to reference counts.
final ffi.Pointer<PyObject> Py_True = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      '_Py_TrueStruct',
    )
    .value;
