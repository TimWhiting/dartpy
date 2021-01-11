part of 'ffi.dart';

extension PyExceptionTypes on DartPyC {
  /// C global `PyExc_BaseException`.
  ffi.Pointer<PyObject> get PyExc_BaseException => _PyExc_BaseException;

  /// C global `PyExc_Exception`.
  ffi.Pointer<PyObject> get PyExc_Exception => _PyExc_Exception;

  /// C global `PyExc_ArithmeticError`.
  ffi.Pointer<PyObject> get PyExc_ArithmeticError => _PyExc_ArithmeticError;

  /// C global `PyExc_AssertionError`.
  ffi.Pointer<PyObject> get PyExc_AssertionError => _PyExc_AssertionError;

  /// C global `PyExc_AttributeError`.
  ffi.Pointer<PyObject> get PyExc_AttributeError => _PyExc_AttributeError;

  /// C global `PyExc_BlockingIOError`.
  ffi.Pointer<PyObject> get PyExc_BlockingIOError => _PyExc_BlockingIOError;

  /// C global `PyExc_BrokenPipeError`.
  ffi.Pointer<PyObject> get PyExc_BrokenPipeError => _PyExc_BrokenPipeError;

  /// C global `PyExc_Floatingffi.PointError`.
  ffi.Pointer<PyObject> get PyExc_FloatingPointError =>
      _PyExc_FloatingPointError;

  /// C global `PyExc_OverflowError`.
  ffi.Pointer<PyObject> get PyExc_OverflowError => _PyExc_OverflowError;

  /// C global `PyExc_ZeroDivisionError`.
  ffi.Pointer<PyObject> get PyExc_ZeroDivisionError => _PyExc_ZeroDivisionError;

  /// C global `PyExc_OSError`.
  ffi.Pointer<PyObject> get PyExc_OSError => _PyExc_OSError;

  /// C global `PyExc_IOError`.
  ffi.Pointer<PyObject> get PyExc_IOError => _PyExc_IOError;

  /// C global `PyExc_ValueError`.
  ffi.Pointer<PyObject> get PyExc_ValueError => _PyExc_ValueError;

  /// C global `PyExc_EOFError`.
  ffi.Pointer<PyObject> get PyExc_EOFError => _PyExc_EOFError;

  /// C global `PyExc_MemoryError`.
  ffi.Pointer<PyObject> get PyExc_MemoryError => _PyExc_MemoryError;

  /// C global `PyExc_IndexError`.
  ffi.Pointer<PyObject> get PyExc_IndexError => _PyExc_IndexError;

  /// C global `PyExc_KeyError`.
  ffi.Pointer<PyObject> get PyExc_KeyError => _PyExc_KeyError;

  /// C global `PyExc_TypeError`.
  ffi.Pointer<PyObject> get PyExc_TypeError => _PyExc_TypeError;
}

extension PyGlobals on DartPyC {
  /// The NotImplemented singleton, used to signal that an operation is not implemented for the given type combination.
  /// Increment the reference count before returning it.
  ffi.Pointer<PyObject> get Py_NotImplemented => _Py_NotImplemented;

  /// The C structure of the objects used to describe built-in types.
  ffi.Pointer<PyObject> get PyType_Type => _PyType_Type;

  /// The Python None object, denoting lack of value. This object has no methods. It needs to be treated just like any other object with respect to reference counts.
  ffi.Pointer<PyObject> get Py_None => _Py_None;

  /// The Python False object. This object has no methods. It needs to be treated just like any other object with respect to reference counts.
  ffi.Pointer<PyObject> get Py_False => _Py_False;

  /// The Python True object. This object has no methods. It needs to be treated just like any other object with respect to reference counts.
  ffi.Pointer<PyObject> get Py_True => _Py_True;
}

/// C global `PyExc_BaseException`.
final ffi.Pointer<PyObject> _PyExc_BaseException = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_BaseException',
    )
    .value;

/// C global `PyExc_Exception`.
final ffi.Pointer<PyObject> _PyExc_Exception = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_Exception',
    )
    .value;

/// C global `PyExc_ArithmeticError`.
final ffi.Pointer<PyObject> _PyExc_ArithmeticError = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_ArithmeticError',
    )
    .value;

/// C global `PyExc_AssertionError`.
final ffi.Pointer<PyObject> _PyExc_AssertionError = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_AssertionError',
    )
    .value;

/// C global `PyExc_AttributeError`.
final ffi.Pointer<PyObject> _PyExc_AttributeError = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_AttributeError',
    )
    .value;

/// C global `PyExc_BlockingIOError`.
final ffi.Pointer<PyObject> _PyExc_BlockingIOError = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_BlockingIOError',
    )
    .value;

/// C global `PyExc_BrokenPipeError`.
final ffi.Pointer<PyObject> _PyExc_BrokenPipeError = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_BrokenPipeError',
    )
    .value;

/// C global `PyExc_Floatingffi.PointError`.
final ffi.Pointer<PyObject> _PyExc_FloatingPointError = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_Floatingffi.PointError',
    )
    .value;

/// C global `PyExc_OverflowError`.
final ffi.Pointer<PyObject> _PyExc_OverflowError = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_OverflowError',
    )
    .value;

/// C global `PyExc_ZeroDivisionError`.
final ffi.Pointer<PyObject> _PyExc_ZeroDivisionError = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_ZeroDivisionError',
    )
    .value;

/// C global `PyExc_OSError`.
final ffi.Pointer<PyObject> _PyExc_OSError = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_OSError',
    )
    .value;

/// C global `PyExc_IOError`.
final ffi.Pointer<PyObject> _PyExc_IOError = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_IOError',
    )
    .value;

/// C global `PyExc_ValueError`.
final ffi.Pointer<PyObject> _PyExc_ValueError = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_ValueError',
    )
    .value;

/// C global `PyExc_EOFError`.
final ffi.Pointer<PyObject> _PyExc_EOFError = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_EOFError',
    )
    .value;

/// C global `PyExc_MemoryError`.
final ffi.Pointer<PyObject> _PyExc_MemoryError = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_MemoryError',
    )
    .value;

/// C global `PyExc_IndexError`.
final ffi.Pointer<PyObject> _PyExc_IndexError = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_IndexError',
    )
    .value;

/// C global `PyExc_KeyError`.
final ffi.Pointer<PyObject> _PyExc_KeyError = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_KeyError',
    )
    .value;

/// C global `PyExc_TypeError`.
final ffi.Pointer<PyObject> _PyExc_TypeError = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_TypeError',
    )
    .value;

/// The NotImplemented singleton, used to signal that an operation is not implemented for the given type combination.
/// Increment the reference count before returning it.
final ffi.Pointer<PyObject> _Py_NotImplemented = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      'Py_NotImplemented',
    )
    .value;

/// The C structure of the objects used to describe built-in types.
final ffi.Pointer<PyObject> _PyType_Type = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      'PyType_Type',
    )
    .value;

/// The Python None object, denoting lack of value. This object has no methods. It needs to be treated just like any other object with respect to reference counts.
final ffi.Pointer<PyObject> _Py_None = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      '_Py_NoneStruct',
    )
    .value;

/// The Python False object. This object has no methods. It needs to be treated just like any other object with respect to reference counts.
final ffi.Pointer<PyObject> _Py_False = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      '_Py_FalseStruct',
    )
    .value;

/// The Python True object. This object has no methods. It needs to be treated just like any other object with respect to reference counts.
final ffi.Pointer<PyObject> _Py_True = _pyLib
    .lookup<ffi.Pointer<PyObject>>(
      '_Py_TrueStruct',
    )
    .value;
