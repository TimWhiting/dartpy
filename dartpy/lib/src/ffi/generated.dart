// AUTOMATICALLY GENERATED. DO NOT EDIT.

import 'dart:ffi' as ffi;
import 'dart:io' as io show Platform;
import 'package:ffi/ffi.dart' as ffi;
import 'typedefs.dart';

/// Dynamic library
final ffi.DynamicLibrary _dynamicLibrary = _open();
ffi.DynamicLibrary _open() {
  if (io.Platform.isLinux)
    return ffi.DynamicLibrary.open(
        '/usr/lib/x86_64-linux-gnu/libpython3.7m.so');
  if (io.Platform.isMacOS)
    return ffi.DynamicLibrary.open(
        '/usr/local/Frameworks/Python.framework/Versions/3.7/lib/libpython3.7m.dylib');
  throw UnsupportedError('This platform is not supported.');
}

/// This is the structure used to hold compiler flags. In cases where code is only being compiled, it is passed as int flags, and in cases where code is being executed, it is passed as PyCompilerFlags *flags. In this case, from __future__ import can modify flags.
/// Whenever PyCompilerFlags *flags is NULL, cf_flags is treated as equal to 0, and any modification due to from __future__ import is discarded.
class PyCompilerFlags extends ffi.Struct {
  @ffi.Int32()
  int cf_flags;

  @ffi.Int32()
  int cf_feature_version;

  static ffi.Pointer<PyCompilerFlags> allocate() {
    return ffi.allocate<PyCompilerFlags>();
  }
}

/// C struct `PyMethodDef`.
class PyMethodDef extends ffi.Struct {
  
  ffi.Pointer<ffi.Uint8> ml_name;

  ffi.Pointer ml_meth;

  @ffi.Int32()
  int ml_flags;

  
  ffi.Pointer<ffi.Uint8> ml_doc;

  static ffi.Pointer<PyMethodDef> allocate() {
    return ffi.allocate<PyMethodDef>();
  }
}

/// C struct `PyMemberDef`.
class PyMemberDef extends ffi.Struct {
  
  ffi.Pointer<ffi.Uint8> name;

  @ffi.Int32()
  int type;

  @ffi.Uint32()
  int offset;

  @ffi.Int32()
  int flags;

  
  ffi.Pointer<ffi.Uint8> doc;

  static ffi.Pointer<PyMemberDef> allocate() {
    return ffi.allocate<PyMemberDef>();
  }
}

/// C struct `PyModuleDef_Slot`.
class PyModuleDef_Slot extends ffi.Struct {
  @ffi.Int32()
  int slot;

  
  ffi.Pointer value;

  static ffi.Pointer<PyModuleDef_Slot> allocate() {
    return ffi.allocate<PyModuleDef_Slot>();
  }
}

/// C struct `PyObject_HEAD_EXTRA`.
class PyObject_HEAD_EXTRA extends ffi.Struct {
  
  ffi.Pointer ob_next;

  
  ffi.Pointer ob_prev;

  static ffi.Pointer<PyObject_HEAD_EXTRA> allocate() {
    return ffi.allocate<PyObject_HEAD_EXTRA>();
  }
}

/// C struct `PyObject`.
class PyObject extends ffi.Struct {
  @ffi.Uint32()
  int ob_refcnt;

  
  ffi.Pointer ob_type;

  static ffi.Pointer<PyObject> allocate() {
    return ffi.allocate<PyObject>();
  }
}

/// C struct `PyObjectVarHeadObj`.
class PyObjectVarHeadObj extends ffi.Struct {
  @ffi.Uint32()
  int ob_refcnt;

  
  ffi.Pointer ob_type;

  @ffi.Uint32()
  int ob_size;

  static ffi.Pointer<PyObjectVarHeadObj> allocate() {
    return ffi.allocate<PyObjectVarHeadObj>();
  }
}

/// C struct `PyModuleDef_Base`.
class PyModuleDef_Base extends ffi.Struct {
  ffi.Pointer<PyObject> ob_base;

  ffi.Pointer<PyObject> m_init;

  @ffi.Uint32()
  int m_index;

  ffi.Pointer<PyObject> m_copy;

  static ffi.Pointer<PyModuleDef_Base> allocate() {
    return ffi.allocate<PyModuleDef_Base>();
  }
}

/// C struct `PyModuleDef`.
class PyModuleDef extends ffi.Struct {
  ffi.Pointer<PyModuleDef_Base> m_base;

  
  ffi.Pointer<ffi.Uint8> m_name;

  
  ffi.Pointer<ffi.Uint8> m_doc;

  @ffi.Uint32()
  int m_size;

  ffi.Pointer<ffi.Pointer<PyModuleDef>> m_methods;

  ffi.Pointer m_slots;

  
  ffi.Pointer m_traverse;

  
  ffi.Pointer m_clear;

  
  ffi.Pointer m_free;

  static ffi.Pointer<PyModuleDef> allocate() {
    return ffi.allocate<PyModuleDef>();
  }
}

/// C struct `PyTypeObject`.
class PyTypeObject extends ffi.Struct {
  @ffi.Uint32()
  int ob_refcnt;

  
  ffi.Pointer ob_type;

  @ffi.Uint32()
  int ob_size;

  
  ffi.Pointer<ffi.Uint8> tp_name;

  @ffi.Uint32()
  int tp_basicsize;

  @ffi.Uint32()
  int tp_itemsize;

  ffi.Pointer<ffi.NativeFunction<ffi.Uint32 Function(ffi.Pointer<PyObject>)>>
      tp_dealloc;

  
  ffi.Pointer tp_print;

  
  ffi.Pointer tp_getattr;

  
  ffi.Pointer tp_setattr;

  
  ffi.Pointer tp_as_async;

  
  ffi.Pointer tp_repr;

  
  ffi.Pointer tp_as_number;

  
  ffi.Pointer tp_as_sequence;

  
  ffi.Pointer tp_as_mapping;

  
  ffi.Pointer tp_hash;

  
  ffi.Pointer tp_call;

  
  ffi.Pointer tp_str;

  
  ffi.Pointer tp_getattro;

  
  ffi.Pointer tp_setattro;

  
  ffi.Pointer tp_as_buffer;

  @ffi.Uint32()
  int tp_flags;

  
  ffi.Pointer<ffi.Uint8> tp_doc;

  
  ffi.Pointer tp_clear;

  
  ffi.Pointer tp_richcompare;

  @ffi.Uint32()
  int tp_weaklistoffset;

  
  ffi.Pointer tp_iter;

  
  ffi.Pointer tp_iternext;

  
  ffi.Pointer tp_methods;

  
  ffi.Pointer tp_members;

  
  ffi.Pointer tp_getset;

  ffi.Pointer<PyTypeObject> tp_vase;

  ffi.Pointer<PyObject> tp_dict;

  
  ffi.Pointer tp_descr_get;

  
  ffi.Pointer tp_descr_set;

  @ffi.Uint32()
  int tp_dictoffset;

  
  ffi.Pointer tp_init;

  
  ffi.Pointer tp_alloc;

  
  ffi.Pointer tp_new;

  
  ffi.Pointer tp_free;

  
  ffi.Pointer tp_is_gc;

  ffi.Pointer<PyObject> tp_bases;

  ffi.Pointer<PyObject> tp_mro;

  ffi.Pointer<PyObject> tp_cache;

  ffi.Pointer<PyObject> tp_subclasses;

  ffi.Pointer<PyObject> tp_weaklist;

  
  ffi.Pointer tp_del;

  @ffi.Uint32()
  int tp_version_tag;

  
  ffi.Pointer tp_finalize;

  static ffi.Pointer<PyTypeObject> allocate() {
    return ffi.allocate<PyTypeObject>();
  }
}

/// The main program for the standard interpreter. This is made available for programs which embed Python. The argc and argv parameters should be prepared exactly as those which are passed to a C program’s main() function (converted to wchar_t according to the user’s locale). It is important to note that the argument list may be modified (but the contents of the strings pointed to by the argument list are not). The return value will be 0 if the interpreter exits normally (i.e., without an exception), 1 if the interpreter exits due to an exception, or 2 if the parameter list does not represent a valid Python command line.
/// Note that if an otherwise unhandled SystemExit is raised, this function will not return 1, but exit the process, as long as Py_InspectFlag is not set.
int Py_Main(
  int arg0,
  ffi.Pointer<ffi.Uint16> arg1,
) {
  return _Py_Main(arg0, arg1);
}

final _Py_Main_Dart _Py_Main =
    _dynamicLibrary.lookupFunction<_Py_Main_C, _Py_Main_Dart>(
  'Py_Main',
);
typedef _Py_Main_C = ffi.Int32 Function(
  ffi.Int32 arg0,
  ffi.Pointer<ffi.Uint16> arg1,
);
typedef _Py_Main_Dart = int Function(
  int arg0,
  ffi.Pointer<ffi.Uint16> arg1,
);

/// Similar to [Py_Main] but argv is an array of bytes strings.
/// New in version 3.8
int Py_BytesMain(
  int arg0,
  ffi.Pointer<ffi.Uint8> arg1,
) {
  return _Py_BytesMain(arg0, arg1);
}

final _Py_BytesMain_Dart _Py_BytesMain =
    _dynamicLibrary.lookupFunction<_Py_BytesMain_C, _Py_BytesMain_Dart>(
  'Py_BytesMain',
);
typedef _Py_BytesMain_C = ffi.Int32 Function(
  ffi.Int32 arg0,
  ffi.Pointer<ffi.Uint8> arg1,
);
typedef _Py_BytesMain_Dart = int Function(
  int arg0,
  ffi.Pointer<ffi.Uint8> arg1,
);

/// This is a simplified interface to [PyRun_SimpleStringFlags] below, leaving the PyCompilerFlags* argument set to NULL.
int PyRun_SimpleString(
  ffi.Pointer<ffi.Uint8> arg0,
) {
  return _PyRun_SimpleString(arg0);
}

final _PyRun_SimpleString_Dart _PyRun_SimpleString = _dynamicLibrary
    .lookupFunction<_PyRun_SimpleString_C, _PyRun_SimpleString_Dart>(
  'PyRun_SimpleString',
);
typedef _PyRun_SimpleString_C = ffi.Int32 Function(
  ffi.Pointer<ffi.Uint8> arg0,
);
typedef _PyRun_SimpleString_Dart = int Function(
  ffi.Pointer<ffi.Uint8> arg0,
);

/// Executes the Python source code from command in the __main__ module according to the flags argument. If __main__ does not already exist, it is created. Returns 0 on success or -1 if an exception was raised. If there was an error, there is no way to get the exception information. For the meaning of flags, see below.
/// Note that if an otherwise unhandled SystemExit is raised, this function will not return -1, but exit the process, as long as Py_InspectFlag is not set.
int PyRun_SimpleStringFlags(
  ffi.Pointer<ffi.Uint8> arg0,
  ffi.Pointer<PyCompilerFlags> arg1,
) {
  return _PyRun_SimpleStringFlags(arg0, arg1);
}

final _PyRun_SimpleStringFlags_Dart _PyRun_SimpleStringFlags = _dynamicLibrary
    .lookupFunction<_PyRun_SimpleStringFlags_C, _PyRun_SimpleStringFlags_Dart>(
  'PyRun_SimpleStringFlags',
);
typedef _PyRun_SimpleStringFlags_C = ffi.Int32 Function(
  ffi.Pointer<ffi.Uint8> arg0,
  ffi.Pointer<PyCompilerFlags> arg1,
);
typedef _PyRun_SimpleStringFlags_Dart = int Function(
  ffi.Pointer<ffi.Uint8> arg0,
  ffi.Pointer<PyCompilerFlags> arg1,
);

/// Increment the reference count for object o. The object may be NULL, in which case the function has no effect.
void Py_IncRef(
  ffi.Pointer<PyObject> arg0,
) {
  _Py_IncRef(arg0);
}

final _Py_IncRef_Dart _Py_IncRef =
    _dynamicLibrary.lookupFunction<_Py_IncRef_C, _Py_IncRef_Dart>(
  'Py_IncRef',
);
typedef _Py_IncRef_C = ffi.Void Function(
  ffi.Pointer<PyObject> arg0,
);
typedef _Py_IncRef_Dart = void Function(
  ffi.Pointer<PyObject> arg0,
);

/// Decrement the reference count for object o. The object may be NULL, in which case the function has no effect.
/// If the reference count reaches zero, the object’s type’s deallocation function (which must not be NULL) is invoked.
/// Warning The deallocation function can cause arbitrary Python code to be invoked (e.g. when a class instance with a __del__() method is deallocated). While exceptions in such code are not propagated, the executed code has free access to all Python global variables. This means that any object that is reachable from a global variable should be in a consistent state before Py_DECREF() is invoked. For example, code to delete an object from a list should copy a reference to the deleted object in a temporary variable, update the list data structure, and then call Py_DECREF() for the temporary variable.
void Py_DecRef(
  ffi.Pointer<PyObject> arg0,
) {
  _Py_DecRef(arg0);
}

final _Py_DecRef_Dart _Py_DecRef =
    _dynamicLibrary.lookupFunction<_Py_DecRef_C, _Py_DecRef_Dart>(
  'Py_DecRef',
);
typedef _Py_DecRef_C = ffi.Void Function(
  ffi.Pointer<PyObject> arg0,
);
typedef _Py_DecRef_Dart = void Function(
  ffi.Pointer<PyObject> arg0,
);

/// Clear the error indicator. If the error indicator is not set, there is no effect.
void PyErr_Clear() {
  _PyErr_Clear();
}

final _PyErr_Clear_Dart _PyErr_Clear =
    _dynamicLibrary.lookupFunction<_PyErr_Clear_C, _PyErr_Clear_Dart>(
  'PyErr_Clear',
);
typedef _PyErr_Clear_C = ffi.Void Function();
typedef _PyErr_Clear_Dart = void Function();

/// Print a standard traceback to sys.stderr and clear the error indicator. Unless the error is a SystemExit, in that case no traceback is printed and the Python process will exit with the error code specified by the SystemExit instance.
/// Call this function only when the error indicator is set. Otherwise it will cause a fatal error!
/// If set_sys_last_vars is nonzero, the variables sys.last_type, sys.last_value and sys.last_traceback will be set to the type, value and traceback of the printed exception, respectively.
void PyErr_PrintEx(
  int arg0,
) {
  _PyErr_PrintEx(arg0);
}

final _PyErr_PrintEx_Dart _PyErr_PrintEx =
    _dynamicLibrary.lookupFunction<_PyErr_PrintEx_C, _PyErr_PrintEx_Dart>(
  'PyErr_PrintEx',
);
typedef _PyErr_PrintEx_C = ffi.Void Function(
  ffi.Int32 arg0,
);
typedef _PyErr_PrintEx_Dart = void Function(
  int arg0,
);

/// Alias for [PyErr_PrintEx(1)].
void PyErr_Print() {
  _PyErr_Print();
}

final _PyErr_Print_Dart _PyErr_Print =
    _dynamicLibrary.lookupFunction<_PyErr_Print_C, _PyErr_Print_Dart>(
  'PyErr_Print',
);
typedef _PyErr_Print_C = ffi.Void Function();
typedef _PyErr_Print_Dart = void Function();

/// This is the most common way to set the error indicator. The first argument specifies the exception type; it is normally one of the standard exceptions, e.g. PyExc_RuntimeError. You need not increment its reference count. The second argument is an error message; it is decoded from 'utf-8’.
void PyErr_SetString(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<ffi.Uint8> arg1,
) {
  _PyErr_SetString(arg0, arg1);
}

final _PyErr_SetString_Dart _PyErr_SetString =
    _dynamicLibrary.lookupFunction<_PyErr_SetString_C, _PyErr_SetString_Dart>(
  'PyErr_SetString',
);
typedef _PyErr_SetString_C = ffi.Void Function(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<ffi.Uint8> arg1,
);
typedef _PyErr_SetString_Dart = void Function(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<ffi.Uint8> arg1,
);

/// This is a shorthand for PyErr_SetObject(type, Py_None).
void PyErr_SetNone(
  ffi.Pointer<PyObject> arg0,
) {
  _PyErr_SetNone(arg0);
}

final _PyErr_SetNone_Dart _PyErr_SetNone =
    _dynamicLibrary.lookupFunction<_PyErr_SetNone_C, _PyErr_SetNone_Dart>(
  'PyErr_SetNone',
);
typedef _PyErr_SetNone_C = ffi.Void Function(
  ffi.Pointer<PyObject> arg0,
);
typedef _PyErr_SetNone_Dart = void Function(
  ffi.Pointer<PyObject> arg0,
);

/// Return value: Borrowed reference.
/// Test whether the error indicator is set. If set, return the exception type (the first argument to the last call to one of the PyErr_Set*() functions or to PyErr_Restore()). If not set, return NULL. You do not own a reference to the return value, so you do not need to Py_DECREF() it.
/// Note Do not compare the return value to a specific exception; use PyErr_ExceptionMatches() instead, shown below. (The comparison could easily fail since the exception may be an instance instead of a class, in the case of a class exception, or it may be a subclass of the expected exception.)
ffi.Pointer<PyObject> PyErr_Occurred() {
  return _PyErr_Occurred();
}

final _PyErr_Occurred_Dart _PyErr_Occurred =
    _dynamicLibrary.lookupFunction<_PyErr_Occurred_C, _PyErr_Occurred_Dart>(
  'PyErr_Occurred',
);
typedef _PyErr_Occurred_C = ffi.Pointer<PyObject> Function();
typedef _PyErr_Occurred_Dart = ffi.Pointer<PyObject> Function();

/// Return value: New reference.
/// This utility function creates and returns a new exception class. The name argument must be the name of the new exception, a C string of the form module.classname. The base and dict arguments are normally NULL. This creates a class object derived from Exception (accessible in C as PyExc_Exception).
/// The __module__ attribute of the new class is set to the first part (up to the last dot) of the name argument, and the class name is set to the last part (after the last dot). The base argument can be used to specify alternate base classes; it can either be only one class or a tuple of classes. The dict argument can be used to specify a dictionary of class variables and methods.
ffi.Pointer<PyObject> PyErr_NewException(
  ffi.Pointer<ffi.Uint8> arg0,
  ffi.Pointer<PyObject> arg1,
  ffi.Pointer<PyObject> arg2,
) {
  return _PyErr_NewException(arg0, arg1, arg2);
}

final _PyErr_NewException_Dart _PyErr_NewException = _dynamicLibrary
    .lookupFunction<_PyErr_NewException_C, _PyErr_NewException_Dart>(
  'PyErr_NewException',
);
typedef _PyErr_NewException_C = ffi.Pointer<PyObject> Function(
  ffi.Pointer<ffi.Uint8> arg0,
  ffi.Pointer<PyObject> arg1,
  ffi.Pointer<PyObject> arg2,
);
typedef _PyErr_NewException_Dart = ffi.Pointer<PyObject> Function(
  ffi.Pointer<ffi.Uint8> arg0,
  ffi.Pointer<PyObject> arg1,
  ffi.Pointer<PyObject> arg2,
);

/// Return value: New reference.
/// This is a simplified interface to PyImport_ImportModuleEx() below, leaving the globals and locals arguments set to NULL and level set to 0. When the name argument contains a dot (when it specifies a submodule of a package), the fromlist argument is set to the list ['*'] so that the return value is the named module rather than the top-level package containing it as would otherwise be the case. (Unfortunately, this has an additional side effect when name in fact specifies a subpackage instead of a submodule: the submodules specified in the package’s __all__ variable are loaded.) Return a new reference to the imported module, or NULL with an exception set on failure. A failing import of a module doesn’t leave the module in sys.modules.
/// This function always uses absolute imports.
ffi.Pointer<PyObject> PyImport_ImportModule(
  ffi.Pointer<ffi.Uint8> arg0,
) {
  return _PyImport_ImportModule(arg0);
}

final _PyImport_ImportModule_Dart _PyImport_ImportModule = _dynamicLibrary
    .lookupFunction<_PyImport_ImportModule_C, _PyImport_ImportModule_Dart>(
  'PyImport_ImportModule',
);
typedef _PyImport_ImportModule_C = ffi.Pointer<PyObject> Function(
  ffi.Pointer<ffi.Uint8> arg0,
);
typedef _PyImport_ImportModule_Dart = ffi.Pointer<PyObject> Function(
  ffi.Pointer<ffi.Uint8> arg0,
);

/// Return value: New reference.
/// This is a higher-level interface that calls the current “import hook function” (with an explicit level of 0, meaning absolute import). It invokes the __import__() function from the __builtins__ of the current globals. This means that the import is done using whatever import hooks are installed in the current environment.
/// This function always uses absolute imports.
ffi.Pointer<PyObject> PyImport_Import(
  ffi.Pointer<PyObject> arg0,
) {
  return _PyImport_Import(arg0);
}

final _PyImport_Import_Dart _PyImport_Import =
    _dynamicLibrary.lookupFunction<_PyImport_Import_C, _PyImport_Import_Dart>(
  'PyImport_Import',
);
typedef _PyImport_Import_C = ffi.Pointer<PyObject> Function(
  ffi.Pointer<PyObject> arg0,
);
typedef _PyImport_Import_Dart = ffi.Pointer<PyObject> Function(
  ffi.Pointer<PyObject> arg0,
);

/// Return value: Borrowed reference.
/// Return a dictionary of the builtins in the current execution frame, or the interpreter of the thread state if no frame is currently executing.
ffi.Pointer<PyObject> PyEval_GetBuiltins() {
  return _PyEval_GetBuiltins();
}

final _PyEval_GetBuiltins_Dart _PyEval_GetBuiltins = _dynamicLibrary
    .lookupFunction<_PyEval_GetBuiltins_C, _PyEval_GetBuiltins_Dart>(
  'PyEval_GetBuiltins',
);
typedef _PyEval_GetBuiltins_C = ffi.Pointer<PyObject> Function();
typedef _PyEval_GetBuiltins_Dart = ffi.Pointer<PyObject> Function();

/// Return value: Borrowed reference.
/// Return a dictionary of the local variables in the current execution frame, or NULL if no frame is currently executing.
ffi.Pointer<PyObject> PyEval_GetLocals() {
  return _PyEval_GetLocals();
}

final _PyEval_GetLocals_Dart _PyEval_GetLocals =
    _dynamicLibrary.lookupFunction<_PyEval_GetLocals_C, _PyEval_GetLocals_Dart>(
  'PyEval_GetLocals',
);
typedef _PyEval_GetLocals_C = ffi.Pointer<PyObject> Function();
typedef _PyEval_GetLocals_Dart = ffi.Pointer<PyObject> Function();

/// Return value: Borrowed reference.
/// Return a dictionary of the global variables in the current execution frame, or NULL if no frame is currently executing.
ffi.Pointer<PyObject> PyEval_GetGlobals() {
  return _PyEval_GetGlobals();
}

final _PyEval_GetGlobals_Dart _PyEval_GetGlobals = _dynamicLibrary
    .lookupFunction<_PyEval_GetGlobals_C, _PyEval_GetGlobals_Dart>(
  'PyEval_GetGlobals',
);
typedef _PyEval_GetGlobals_C = ffi.Pointer<PyObject> Function();
typedef _PyEval_GetGlobals_Dart = ffi.Pointer<PyObject> Function();

/// Return value: New reference.
/// Retrieve an attribute named attr_name from object o. Returns the attribute value on success, or NULL on failure. This is the equivalent of the Python expression o.attr_name.
ffi.Pointer<PyObject> PyObject_GetAttrString(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<ffi.Uint8> arg1,
) {
  return _PyObject_GetAttrString(arg0, arg1);
}

final _PyObject_GetAttrString_Dart _PyObject_GetAttrString = _dynamicLibrary
    .lookupFunction<_PyObject_GetAttrString_C, _PyObject_GetAttrString_Dart>(
  'PyObject_GetAttrString',
);
typedef _PyObject_GetAttrString_C = ffi.Pointer<PyObject> Function(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<ffi.Uint8> arg1,
);
typedef _PyObject_GetAttrString_Dart = ffi.Pointer<PyObject> Function(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<ffi.Uint8> arg1,
);

/// Set the value of the attribute named attr_name, for object o, to the value v. Raise an exception and return -1 on failure; return 0 on success. This is the equivalent of the Python statement o.attr_name = v.
/// If v is NULL, the attribute is deleted, however this feature is deprecated in favour of using PyObject_DelAttrString().
int PyObject_SetAttrString(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<ffi.Uint8> arg1,
  ffi.Pointer<PyObject> arg2,
) {
  return _PyObject_SetAttrString(arg0, arg1, arg2);
}

final _PyObject_SetAttrString_Dart _PyObject_SetAttrString = _dynamicLibrary
    .lookupFunction<_PyObject_SetAttrString_C, _PyObject_SetAttrString_Dart>(
  'PyObject_SetAttrString',
);
typedef _PyObject_SetAttrString_C = ffi.Int32 Function(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<ffi.Uint8> arg1,
  ffi.Pointer<PyObject> arg2,
);
typedef _PyObject_SetAttrString_Dart = int Function(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<ffi.Uint8> arg1,
  ffi.Pointer<PyObject> arg2,
);

/// Compare the values of o1 and o2 using the operation specified by opid, which must be one of Py_LT, Py_LE, Py_EQ, Py_NE, Py_GT, or Py_GE, corresponding to <, <=, ==, !=, >, or >= respectively. Returns -1 on error, 0 if the result is false, 1 otherwise. This is the equivalent of the Python expression o1 op o2, where op is the operator corresponding to opid.
/// Note If o1 and o2 are the same object, PyObject_RichCompareBool() will always return 1 for Py_EQ and 0 for Py_NE.
int PyObject_RichCompareBool(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<PyObject> arg1,
  int arg2,
) {
  return _PyObject_RichCompareBool(arg0, arg1, arg2);
}

final _PyObject_RichCompareBool_Dart _PyObject_RichCompareBool =
    _dynamicLibrary.lookupFunction<_PyObject_RichCompareBool_C,
        _PyObject_RichCompareBool_Dart>(
  'PyObject_RichCompareBool',
);
typedef _PyObject_RichCompareBool_C = ffi.Int32 Function(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<PyObject> arg1,
  ffi.Int32 arg2,
);
typedef _PyObject_RichCompareBool_Dart = int Function(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<PyObject> arg1,
  int arg2,
);

/// Return value: New reference.
/// Compute a string representation of object o. Returns the string representation on success, NULL on failure. This is the equivalent of the Python expression str(o). Called by the str() built-in function and, therefore, by the print() function.
/// Changed in version 3.4: This function now includes a debug assertion to help ensure that it does not silently discard an active exception.
ffi.Pointer<PyObject> PyObject_Str(
  ffi.Pointer<PyObject> arg0,
) {
  return _PyObject_Str(arg0);
}

final _PyObject_Str_Dart _PyObject_Str =
    _dynamicLibrary.lookupFunction<_PyObject_Str_C, _PyObject_Str_Dart>(
  'PyObject_Str',
);
typedef _PyObject_Str_C = ffi.Pointer<PyObject> Function(
  ffi.Pointer<PyObject> arg0,
);
typedef _PyObject_Str_Dart = ffi.Pointer<PyObject> Function(
  ffi.Pointer<PyObject> arg0,
);

/// Determine if the object o is callable. Return 1 if the object is callable and 0 otherwise. This function always succeeds.
int PyCallable_Check(
  ffi.Pointer<PyObject> arg0,
) {
  return _PyCallable_Check(arg0);
}

final _PyCallable_Check_Dart _PyCallable_Check =
    _dynamicLibrary.lookupFunction<_PyCallable_Check_C, _PyCallable_Check_Dart>(
  'PyCallable_Check',
);
typedef _PyCallable_Check_C = ffi.Int32 Function(
  ffi.Pointer<PyObject> arg0,
);
typedef _PyCallable_Check_Dart = int Function(
  ffi.Pointer<PyObject> arg0,
);

/// Return value: New reference.
/// Call a callable Python object callable, with arguments given by the tuple args, and named arguments given by the dictionary kwargs.
/// args must not be NULL, use an empty tuple if no arguments are needed. If no named arguments are needed, kwargs can be NULL.
/// Return the result of the call on success, or raise an exception and return NULL on failure.
/// This is the equivalent of the Python expression: callable(*args, **kwargs).
ffi.Pointer<PyObject> PyObject_Call(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<PyObject> arg1,
  ffi.Pointer<PyObject> arg2,
) {
  return _PyObject_Call(arg0, arg1, arg2);
}

final _PyObject_Call_Dart _PyObject_Call =
    _dynamicLibrary.lookupFunction<_PyObject_Call_C, _PyObject_Call_Dart>(
  'PyObject_Call',
);
typedef _PyObject_Call_C = ffi.Pointer<PyObject> Function(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<PyObject> arg1,
  ffi.Pointer<PyObject> arg2,
);
typedef _PyObject_Call_Dart = ffi.Pointer<PyObject> Function(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<PyObject> arg1,
  ffi.Pointer<PyObject> arg2,
);

/// Return value: New reference.
/// Call a callable Python object callable, with arguments given by the tuple args. If no arguments are needed, then args can be NULL.
/// Return the result of the call on success, or raise an exception and return NULL on failure.
/// This is the equivalent of the Python expression: callable(*args).
ffi.Pointer<PyObject> PyObject_CallObject(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<PyObject> arg1,
) {
  return _PyObject_CallObject(arg0, arg1);
}

final _PyObject_CallObject_Dart _PyObject_CallObject = _dynamicLibrary
    .lookupFunction<_PyObject_CallObject_C, _PyObject_CallObject_Dart>(
  'PyObject_CallObject',
);
typedef _PyObject_CallObject_C = ffi.Pointer<PyObject> Function(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<PyObject> arg1,
);
typedef _PyObject_CallObject_Dart = ffi.Pointer<PyObject> Function(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<PyObject> arg1,
);

/// Returns 1 if the object o is considered to be true, and 0 otherwise. This is equivalent to the Python expression not not o. On failure, return -1.
int PyObject_IsTrue(
  ffi.Pointer<PyObject> arg0,
) {
  return _PyObject_IsTrue(arg0);
}

final _PyObject_IsTrue_Dart _PyObject_IsTrue =
    _dynamicLibrary.lookupFunction<_PyObject_IsTrue_C, _PyObject_IsTrue_Dart>(
  'PyObject_IsTrue',
);
typedef _PyObject_IsTrue_C = ffi.Int32 Function(
  ffi.Pointer<PyObject> arg0,
);
typedef _PyObject_IsTrue_Dart = int Function(
  ffi.Pointer<PyObject> arg0,
);

/// Return value: New reference.
/// Return element of o corresponding to the object key or NULL on failure. This is the equivalent of the Python expression o[key].
ffi.Pointer<PyObject> PyObject_GetItem(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<PyObject> arg1,
) {
  return _PyObject_GetItem(arg0, arg1);
}

final _PyObject_GetItem_Dart _PyObject_GetItem =
    _dynamicLibrary.lookupFunction<_PyObject_GetItem_C, _PyObject_GetItem_Dart>(
  'PyObject_GetItem',
);
typedef _PyObject_GetItem_C = ffi.Pointer<PyObject> Function(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<PyObject> arg1,
);
typedef _PyObject_GetItem_Dart = ffi.Pointer<PyObject> Function(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<PyObject> arg1,
);

/// Map the object key to the value v. Raise an exception and return -1 on failure; return 0 on success. This is the equivalent of the Python statement o[key] = v. This function does not steal a reference to v.
int PyObject_SetItem(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<PyObject> arg1,
  ffi.Pointer<PyObject> arg2,
) {
  return _PyObject_SetItem(arg0, arg1, arg2);
}

final _PyObject_SetItem_Dart _PyObject_SetItem =
    _dynamicLibrary.lookupFunction<_PyObject_SetItem_C, _PyObject_SetItem_Dart>(
  'PyObject_SetItem',
);
typedef _PyObject_SetItem_C = ffi.Int32 Function(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<PyObject> arg1,
  ffi.Pointer<PyObject> arg2,
);
typedef _PyObject_SetItem_Dart = int Function(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<PyObject> arg1,
  ffi.Pointer<PyObject> arg2,
);

/// Remove the mapping for the object key from the object o. Return -1 on failure. This is equivalent to the Python statement del o[key].
int PyObject_DelItem(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<PyObject> arg1,
) {
  return _PyObject_DelItem(arg0, arg1);
}

final _PyObject_DelItem_Dart _PyObject_DelItem =
    _dynamicLibrary.lookupFunction<_PyObject_DelItem_C, _PyObject_DelItem_Dart>(
  'PyObject_DelItem',
);
typedef _PyObject_DelItem_C = ffi.Int32 Function(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<PyObject> arg1,
);
typedef _PyObject_DelItem_Dart = int Function(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<PyObject> arg1,
);

/// Return value: New reference.
/// This is equivalent to the Python expression dir(o), returning a (possibly empty) list of strings appropriate for the object argument, or NULL if there was an error. If the argument is NULL, this is like the Python dir(), returning the names of the current locals; in this case, if no execution frame is active then NULL is returned but PyErr_Occurred() will return false.
ffi.Pointer<PyObject> PyObject_Dir(
  ffi.Pointer<PyObject> arg0,
) {
  return _PyObject_Dir(arg0);
}

final _PyObject_Dir_Dart _PyObject_Dir =
    _dynamicLibrary.lookupFunction<_PyObject_Dir_C, _PyObject_Dir_Dart>(
  'PyObject_Dir',
);
typedef _PyObject_Dir_C = ffi.Pointer<PyObject> Function(
  ffi.Pointer<PyObject> arg0,
);
typedef _PyObject_Dir_Dart = ffi.Pointer<PyObject> Function(
  ffi.Pointer<PyObject> arg0,
);

/// Return value: New reference.
/// This is equivalent to the Python expression iter(o). It returns a new iterator for the object argument, or the object itself if the object is already an iterator. Raises TypeError and returns NULL if the object cannot be iterated.
ffi.Pointer<PyObject> PyObject_GetIter(
  ffi.Pointer<PyObject> arg0,
) {
  return _PyObject_GetIter(arg0);
}

final _PyObject_GetIter_Dart _PyObject_GetIter =
    _dynamicLibrary.lookupFunction<_PyObject_GetIter_C, _PyObject_GetIter_Dart>(
  'PyObject_GetIter',
);
typedef _PyObject_GetIter_C = ffi.Pointer<PyObject> Function(
  ffi.Pointer<PyObject> arg0,
);
typedef _PyObject_GetIter_Dart = ffi.Pointer<PyObject> Function(
  ffi.Pointer<PyObject> arg0,
);

/// Return true if the object o supports the iterator protocol.
int PyIter_Check(
  ffi.Pointer<PyObject> arg0,
) {
  return _PyIter_Check(arg0);
}

final _PyIter_Check_Dart _PyIter_Check =
    _dynamicLibrary.lookupFunction<_PyIter_Check_C, _PyIter_Check_Dart>(
  'PyIter_Check',
);
typedef _PyIter_Check_C = ffi.Int32 Function(
  ffi.Pointer<PyObject> arg0,
);
typedef _PyIter_Check_Dart = int Function(
  ffi.Pointer<PyObject> arg0,
);

/// Return value: New reference.
/// Return the next value from the iteration o. The object must be an iterator (it is up to the caller to check this). If there are no remaining values, returns NULL with no exception set. If an error occurs while retrieving the item, returns NULL and passes along the exception.
ffi.Pointer<PyObject> PyIter_Next(
  ffi.Pointer<PyObject> arg0,
) {
  return _PyIter_Next(arg0);
}

final _PyIter_Next_Dart _PyIter_Next =
    _dynamicLibrary.lookupFunction<_PyIter_Next_C, _PyIter_Next_Dart>(
  'PyIter_Next',
);
typedef _PyIter_Next_C = ffi.Pointer<PyObject> Function(
  ffi.Pointer<PyObject> arg0,
);
typedef _PyIter_Next_Dart = ffi.Pointer<PyObject> Function(
  ffi.Pointer<PyObject> arg0,
);

/// Send a request to exporter to fill in view as specified by flags. If the exporter cannot provide a buffer of the exact type, it MUST raise PyExc_BufferError, set view->obj to NULL and return -1.
/// On success, fill in view, set view->obj to a new reference to exporter and return 0. In the case of chained buffer providers that redirect requests to a single object, view->obj MAY refer to this object instead of exporter (See Buffer Object Structures).
/// Successful calls to PyObject_GetBuffer() must be paired with calls to PyBuffer_Release(), similar to malloc() and free(). Thus, after the consumer is done with the buffer, PyBuffer_Release() must be called exactly once.
int PyObject_GetBuffer(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer arg1,
  int arg2,
) {
  return _PyObject_GetBuffer(arg0, arg1, arg2);
}

final _PyObject_GetBuffer_Dart _PyObject_GetBuffer = _dynamicLibrary
    .lookupFunction<_PyObject_GetBuffer_C, _PyObject_GetBuffer_Dart>(
  'PyObject_GetBuffer',
);
typedef _PyObject_GetBuffer_C = ffi.Int32 Function(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer arg1,
  ffi.Int32 arg2,
);
typedef _PyObject_GetBuffer_Dart = int Function(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer arg1,
  int arg2,
);

/// Release the buffer view and decrement the reference count for view->obj. This function MUST be called when the buffer is no longer being used, otherwise reference leaks may occur.
/// It is an error to call this function on a buffer that was not obtained via PyObject_GetBuffer().
void PyBuffer_Release(
  ffi.Pointer arg0,
) {
  _PyBuffer_Release(arg0);
}

final _PyBuffer_Release_Dart _PyBuffer_Release =
    _dynamicLibrary.lookupFunction<_PyBuffer_Release_C, _PyBuffer_Release_Dart>(
  'PyBuffer_Release',
);
typedef _PyBuffer_Release_C = ffi.Void Function(
  ffi.Pointer arg0,
);
typedef _PyBuffer_Release_Dart = void Function(
  ffi.Pointer arg0,
);

/// Return true if a is a subtype of b.
/// This function only checks for actual subtypes, which means that __subclasscheck__() is not called on b. Call PyObject_IsSubclass() to do the same check that issubclass() would do.
int PyType_IsSubtype(
  ffi.Pointer<PyTypeObject> arg0,
  ffi.Pointer<PyTypeObject> arg1,
) {
  return _PyType_IsSubtype(arg0, arg1);
}

final _PyType_IsSubtype_Dart _PyType_IsSubtype =
    _dynamicLibrary.lookupFunction<_PyType_IsSubtype_C, _PyType_IsSubtype_Dart>(
  'PyType_IsSubtype',
);
typedef _PyType_IsSubtype_C = ffi.Int32 Function(
  ffi.Pointer<PyTypeObject> arg0,
  ffi.Pointer<PyTypeObject> arg1,
);
typedef _PyType_IsSubtype_Dart = int Function(
  ffi.Pointer<PyTypeObject> arg0,
  ffi.Pointer<PyTypeObject> arg1,
);

/// Return value: New reference.
/// Generic handler for the tp_new slot of a type object. Create a new instance using the type’s tp_alloc slot.
ffi.Pointer<PyObject> PyType_GenericNew(
  ffi.Pointer<PyTypeObject> arg0,
  ffi.Pointer<PyObject> arg1,
  ffi.Pointer<PyObject> arg2,
) {
  return _PyType_GenericNew(arg0, arg1, arg2);
}

final _PyType_GenericNew_Dart _PyType_GenericNew = _dynamicLibrary
    .lookupFunction<_PyType_GenericNew_C, _PyType_GenericNew_Dart>(
  'PyType_GenericNew',
);
typedef _PyType_GenericNew_C = ffi.Pointer<PyObject> Function(
  ffi.Pointer<PyTypeObject> arg0,
  ffi.Pointer<PyObject> arg1,
  ffi.Pointer<PyObject> arg2,
);
typedef _PyType_GenericNew_Dart = ffi.Pointer<PyObject> Function(
  ffi.Pointer<PyTypeObject> arg0,
  ffi.Pointer<PyObject> arg1,
  ffi.Pointer<PyObject> arg2,
);

/// Finalize a type object. This should be called on all type objects to finish their initialization. This function is responsible for adding inherited slots from a type’s base class. Return 0 on success, or return -1 and sets an exception on error.
int PyType_Ready(
  ffi.Pointer<PyTypeObject> arg0,
) {
  return _PyType_Ready(arg0);
}

final _PyType_Ready_Dart _PyType_Ready =
    _dynamicLibrary.lookupFunction<_PyType_Ready_C, _PyType_Ready_Dart>(
  'PyType_Ready',
);
typedef _PyType_Ready_C = ffi.Int32 Function(
  ffi.Pointer<PyTypeObject> arg0,
);
typedef _PyType_Ready_Dart = int Function(
  ffi.Pointer<PyTypeObject> arg0,
);

/// Return true if its argument is a PyLongObject or a subtype of PyLongObject.
int PyLong_Check(
  ffi.Pointer<PyObject> arg0,
) {
  return _PyLong_Check(arg0);
}

final _PyLong_Check_Dart _PyLong_Check =
    _dynamicLibrary.lookupFunction<_PyLong_Check_C, _PyLong_Check_Dart>(
  'PyLong_Check',
);
typedef _PyLong_Check_C = ffi.Int32 Function(
  ffi.Pointer<PyObject> arg0,
);
typedef _PyLong_Check_Dart = int Function(
  ffi.Pointer<PyObject> arg0,
);

/// Return true if its argument is a PyLongObject, but not a subtype of PyLongObject.
int PyLong_CheckExact(
  ffi.Pointer<PyObject> arg0,
) {
  return _PyLong_CheckExact(arg0);
}

final _PyLong_CheckExact_Dart _PyLong_CheckExact = _dynamicLibrary
    .lookupFunction<_PyLong_CheckExact_C, _PyLong_CheckExact_Dart>(
  'PyLong_CheckExact',
);
typedef _PyLong_CheckExact_C = ffi.Int32 Function(
  ffi.Pointer<PyObject> arg0,
);
typedef _PyLong_CheckExact_Dart = int Function(
  ffi.Pointer<PyObject> arg0,
);

/// Return value: New reference.
/// Return a new PyLongObject object from v, or NULL on failure.
/// The current implementation keeps an array of integer objects for all integers between -5 and 256, when you create an int in that range you actually just get back a reference to the existing object. So it should be possible to change the value of 1. I suspect the behaviour of Python in this case is undefined. :-)
ffi.Pointer<PyObject> PyLong_FromLong(
  int arg0,
) {
  return _PyLong_FromLong(arg0);
}

final _PyLong_FromLong_Dart _PyLong_FromLong =
    _dynamicLibrary.lookupFunction<_PyLong_FromLong_C, _PyLong_FromLong_Dart>(
  'PyLong_FromLong',
);
typedef _PyLong_FromLong_C = ffi.Pointer<PyObject> Function(
  ffi.Int32 arg0,
);
typedef _PyLong_FromLong_Dart = ffi.Pointer<PyObject> Function(
  int arg0,
);

/// Return value: New reference.
/// Return a new PyLongObject object from a C unsigned long, or NULL on failure.
ffi.Pointer<PyObject> PyLong_FromUnsignedLong(
  int arg0,
) {
  return _PyLong_FromUnsignedLong(arg0);
}

final _PyLong_FromUnsignedLong_Dart _PyLong_FromUnsignedLong = _dynamicLibrary
    .lookupFunction<_PyLong_FromUnsignedLong_C, _PyLong_FromUnsignedLong_Dart>(
  'PyLong_FromUnsignedLong',
);
typedef _PyLong_FromUnsignedLong_C = ffi.Pointer<PyObject> Function(
  ffi.Uint32 arg0,
);
typedef _PyLong_FromUnsignedLong_Dart = ffi.Pointer<PyObject> Function(
  int arg0,
);

/// Return a C long representation of obj. If obj is not an instance of PyLongObject, first call its __index__() or __int__() method (if present) to convert it to a PyLongObject.
/// Raise OverflowError if the value of obj is out of range for a long.
/// Returns -1 on error. Use PyErr_Occurred() to disambiguate.
/// Changed in version 3.8: Use __index__() if available.
/// Deprecated since version 3.8: Using __int__() is deprecated.
int PyLong_AsLong(
  ffi.Pointer<PyObject> arg0,
) {
  return _PyLong_AsLong(arg0);
}

final _PyLong_AsLong_Dart _PyLong_AsLong =
    _dynamicLibrary.lookupFunction<_PyLong_AsLong_C, _PyLong_AsLong_Dart>(
  'PyLong_AsLong',
);
typedef _PyLong_AsLong_C = ffi.Int32 Function(
  ffi.Pointer<PyObject> arg0,
);
typedef _PyLong_AsLong_Dart = int Function(
  ffi.Pointer<PyObject> arg0,
);

/// Return a C long long representation of obj. If obj is not an instance of PyLongObject, first call its __index__() or __int__() method (if present) to convert it to a PyLongObject.
/// Raise OverflowError if the value of obj is out of range for a long long.
/// Returns -1 on error. Use PyErr_Occurred() to disambiguate.
/// Changed in version 3.8: Use __index__() if available.
/// Deprecated since version 3.8: Using __int__() is deprecated.
int PyLong_AsLongLong(
  ffi.Pointer<PyObject> arg0,
) {
  return _PyLong_AsLongLong(arg0);
}

final _PyLong_AsLongLong_Dart _PyLong_AsLongLong = _dynamicLibrary
    .lookupFunction<_PyLong_AsLongLong_C, _PyLong_AsLongLong_Dart>(
  'PyLong_AsLongLong',
);
typedef _PyLong_AsLongLong_C = ffi.Int64 Function(
  ffi.Pointer<PyObject> arg0,
);
typedef _PyLong_AsLongLong_Dart = int Function(
  ffi.Pointer<PyObject> arg0,
);

/// Return value: New reference.
/// Return a new reference to Py_True or Py_False depending on the truth value of v.
ffi.Pointer<PyObject> PyBool_FromLong(
  int arg0,
) {
  return _PyBool_FromLong(arg0);
}

final _PyBool_FromLong_Dart _PyBool_FromLong =
    _dynamicLibrary.lookupFunction<_PyBool_FromLong_C, _PyBool_FromLong_Dart>(
  'PyBool_FromLong',
);
typedef _PyBool_FromLong_C = ffi.Pointer<PyObject> Function(
  ffi.Int32 arg0,
);
typedef _PyBool_FromLong_Dart = ffi.Pointer<PyObject> Function(
  int arg0,
);

/// Return value: New reference.
/// Create a PyFloatObject object from v, or NULL on failure.
ffi.Pointer<PyObject> PyFloat_FromDouble(
  double arg0,
) {
  return _PyFloat_FromDouble(arg0);
}

final _PyFloat_FromDouble_Dart _PyFloat_FromDouble = _dynamicLibrary
    .lookupFunction<_PyFloat_FromDouble_C, _PyFloat_FromDouble_Dart>(
  'PyFloat_FromDouble',
);
typedef _PyFloat_FromDouble_C = ffi.Pointer<PyObject> Function(
  ffi.Double arg0,
);
typedef _PyFloat_FromDouble_Dart = ffi.Pointer<PyObject> Function(
  double arg0,
);

/// Return a C double representation of the contents of pyfloat. If pyfloat is not a Python floating point object but has a __float__() method, this method will first be called to convert pyfloat into a float. If __float__() is not defined then it falls back to __index__(). This method returns -1.0 upon failure, so one should call PyErr_Occurred() to check for errors.
/// Changed in version 3.8: Use __index__() if available.
double PyFloat_AsDouble(
  ffi.Pointer<PyObject> arg0,
) {
  return _PyFloat_AsDouble(arg0);
}

final _PyFloat_AsDouble_Dart _PyFloat_AsDouble =
    _dynamicLibrary.lookupFunction<_PyFloat_AsDouble_C, _PyFloat_AsDouble_Dart>(
  'PyFloat_AsDouble',
);
typedef _PyFloat_AsDouble_C = ffi.Double Function(
  ffi.Pointer<PyObject> arg0,
);
typedef _PyFloat_AsDouble_Dart = double Function(
  ffi.Pointer<PyObject> arg0,
);

/// Return the real part of op as a C double.
double PyComplex_RealAsDouble(
  ffi.Pointer<PyObject> arg0,
) {
  return _PyComplex_RealAsDouble(arg0);
}

final _PyComplex_RealAsDouble_Dart _PyComplex_RealAsDouble = _dynamicLibrary
    .lookupFunction<_PyComplex_RealAsDouble_C, _PyComplex_RealAsDouble_Dart>(
  'PyComplex_RealAsDouble',
);
typedef _PyComplex_RealAsDouble_C = ffi.Double Function(
  ffi.Pointer<PyObject> arg0,
);
typedef _PyComplex_RealAsDouble_Dart = double Function(
  ffi.Pointer<PyObject> arg0,
);

/// Return the complex part of op as a C double.
double PyComplex_ImagAsDouble(
  ffi.Pointer<PyObject> arg0,
) {
  return _PyComplex_ImagAsDouble(arg0);
}

final _PyComplex_ImagAsDouble_Dart _PyComplex_ImagAsDouble = _dynamicLibrary
    .lookupFunction<_PyComplex_ImagAsDouble_C, _PyComplex_ImagAsDouble_Dart>(
  'PyComplex_ImagAsDouble',
);
typedef _PyComplex_ImagAsDouble_C = ffi.Double Function(
  ffi.Pointer<PyObject> arg0,
);
typedef _PyComplex_ImagAsDouble_Dart = double Function(
  ffi.Pointer<PyObject> arg0,
);

/// Return the null-terminated contents of the object obj through the output variables buffer and length.
/// If length is NULL, the bytes object may not contain embedded null bytes; if it does, the function returns -1 and a ValueError is raised.
/// The buffer refers to an internal buffer of obj, which includes an additional null byte at the end (not counted in length). The data must not be modified in any way, unless the object was just created using PyBytes_FromStringAndSize(NULL, size). It must not be deallocated. If obj is not a bytes object at all, PyBytes_AsStringAndSize() returns -1 and raises TypeError.
/// Changed in version 3.5: Previously, TypeError was raised when embedded null bytes were encountered in the bytes object.
int PyBytes_AsStringAndSize(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<ffi.Pointer<ffi.Uint8>> arg1,
  ffi.Pointer<ffi.Uint32> arg2,
) {
  return _PyBytes_AsStringAndSize(arg0, arg1, arg2);
}

final _PyBytes_AsStringAndSize_Dart _PyBytes_AsStringAndSize = _dynamicLibrary
    .lookupFunction<_PyBytes_AsStringAndSize_C, _PyBytes_AsStringAndSize_Dart>(
  'PyBytes_AsStringAndSize',
);
typedef _PyBytes_AsStringAndSize_C = ffi.Int32 Function(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<ffi.Pointer<ffi.Uint8>> arg1,
  ffi.Pointer<ffi.Uint32> arg2,
);
typedef _PyBytes_AsStringAndSize_Dart = int Function(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<ffi.Pointer<ffi.Uint8>> arg1,
  ffi.Pointer<ffi.Uint32> arg2,
);

/// Return value: New reference.
/// Create a Unicode object from a UTF-8 encoded null-terminated char buffer u.
ffi.Pointer<PyObject> PyUnicode_FromString(
  ffi.Pointer<ffi.Uint8> arg0,
) {
  return _PyUnicode_FromString(arg0);
}

final _PyUnicode_FromString_Dart _PyUnicode_FromString = _dynamicLibrary
    .lookupFunction<_PyUnicode_FromString_C, _PyUnicode_FromString_Dart>(
  'PyUnicode_FromString',
);
typedef _PyUnicode_FromString_C = ffi.Pointer<PyObject> Function(
  ffi.Pointer<ffi.Uint8> arg0,
);
typedef _PyUnicode_FromString_Dart = ffi.Pointer<PyObject> Function(
  ffi.Pointer<ffi.Uint8> arg0,
);

/// Return value: New reference.
/// Decode a null-terminated string using Py_FileSystemDefaultEncoding and the Py_FileSystemDefaultEncodeErrors error handler.
/// If Py_FileSystemDefaultEncoding is not set, fall back to the locale encoding.
/// Use PyUnicode_DecodeFSDefaultAndSize() if you know the string length.
/// Changed in version 3.6: Use Py_FileSystemDefaultEncodeErrors error handler.
ffi.Pointer<PyObject> PyUnicode_DecodeFSDefault(
  ffi.Pointer<ffi.Uint8> arg0,
) {
  return _PyUnicode_DecodeFSDefault(arg0);
}

final _PyUnicode_DecodeFSDefault_Dart _PyUnicode_DecodeFSDefault =
    _dynamicLibrary.lookupFunction<_PyUnicode_DecodeFSDefault_C,
        _PyUnicode_DecodeFSDefault_Dart>(
  'PyUnicode_DecodeFSDefault',
);
typedef _PyUnicode_DecodeFSDefault_C = ffi.Pointer<PyObject> Function(
  ffi.Pointer<ffi.Uint8> arg0,
);
typedef _PyUnicode_DecodeFSDefault_Dart = ffi.Pointer<PyObject> Function(
  ffi.Pointer<ffi.Uint8> arg0,
);

/// Return value: New reference.
/// Encode a Unicode object using UTF-8 and return the result as Python bytes object. Error handling is “strict”. Return NULL if an exception was raised by the codec.
ffi.Pointer<PyObject> PyUnicode_AsUTF8String(
  ffi.Pointer<PyObject> arg0,
) {
  return _PyUnicode_AsUTF8String(arg0);
}

final _PyUnicode_AsUTF8String_Dart _PyUnicode_AsUTF8String = _dynamicLibrary
    .lookupFunction<_PyUnicode_AsUTF8String_C, _PyUnicode_AsUTF8String_Dart>(
  'PyUnicode_AsUTF8String',
);
typedef _PyUnicode_AsUTF8String_C = ffi.Pointer<PyObject> Function(
  ffi.Pointer<PyObject> arg0,
);
typedef _PyUnicode_AsUTF8String_Dart = ffi.Pointer<PyObject> Function(
  ffi.Pointer<PyObject> arg0,
);

/// Compare a Unicode object, uni, with string and return -1, 0, 1 for less than, equal, and greater than, respectively. It is best to pass only ASCII-encoded strings, but the function interprets the input string as ISO-8859-1 if it contains non-ASCII characters.
/// This function does not raise exceptions.
int PyUnicode_CompareWithASCIIString(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<ffi.Uint8> arg1,
) {
  return _PyUnicode_CompareWithASCIIString(arg0, arg1);
}

final _PyUnicode_CompareWithASCIIString_Dart _PyUnicode_CompareWithASCIIString =
    _dynamicLibrary.lookupFunction<_PyUnicode_CompareWithASCIIString_C,
        _PyUnicode_CompareWithASCIIString_Dart>(
  'PyUnicode_CompareWithASCIIString',
);
typedef _PyUnicode_CompareWithASCIIString_C = ffi.Int32 Function(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<ffi.Uint8> arg1,
);
typedef _PyUnicode_CompareWithASCIIString_Dart = int Function(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<ffi.Uint8> arg1,
);

/// Return value: New reference.
/// Return a new tuple object of size len, or NULL on failure.
ffi.Pointer<PyObject> PyTuple_New(
  int arg0,
) {
  return _PyTuple_New(arg0);
}

final _PyTuple_New_Dart _PyTuple_New =
    _dynamicLibrary.lookupFunction<_PyTuple_New_C, _PyTuple_New_Dart>(
  'PyTuple_New',
);
typedef _PyTuple_New_C = ffi.Pointer<PyObject> Function(
  ffi.Uint32 arg0,
);
typedef _PyTuple_New_Dart = ffi.Pointer<PyObject> Function(
  int arg0,
);

/// Take a pointer to a tuple object, and return the size of that tuple.
int PyTuple_Size(
  ffi.Pointer<PyObject> arg0,
) {
  return _PyTuple_Size(arg0);
}

final _PyTuple_Size_Dart _PyTuple_Size =
    _dynamicLibrary.lookupFunction<_PyTuple_Size_C, _PyTuple_Size_Dart>(
  'PyTuple_Size',
);
typedef _PyTuple_Size_C = ffi.Uint32 Function(
  ffi.Pointer<PyObject> arg0,
);
typedef _PyTuple_Size_Dart = int Function(
  ffi.Pointer<PyObject> arg0,
);

/// Return value: Borrowed reference.
/// Return the object at position pos in the tuple pointed to by p. If pos is out of bounds, return NULL and set an IndexError exception.
ffi.Pointer<PyObject> PyTuple_GetItem(
  ffi.Pointer<PyObject> arg0,
  int arg1,
) {
  return _PyTuple_GetItem(arg0, arg1);
}

final _PyTuple_GetItem_Dart _PyTuple_GetItem =
    _dynamicLibrary.lookupFunction<_PyTuple_GetItem_C, _PyTuple_GetItem_Dart>(
  'PyTuple_GetItem',
);
typedef _PyTuple_GetItem_C = ffi.Pointer<PyObject> Function(
  ffi.Pointer<PyObject> arg0,
  ffi.Uint32 arg1,
);
typedef _PyTuple_GetItem_Dart = ffi.Pointer<PyObject> Function(
  ffi.Pointer<PyObject> arg0,
  int arg1,
);

/// Insert a reference to object o at position pos of the tuple pointed to by p. Return 0 on success. If pos is out of bounds, return -1 and set an IndexError exception.
/// Note This function “steals” a reference to o and discards a reference to an item already in the tuple at the affected position.
int PyTuple_SetItem(
  ffi.Pointer<PyObject> arg0,
  int arg1,
  ffi.Pointer<PyObject> arg2,
) {
  return _PyTuple_SetItem(arg0, arg1, arg2);
}

final _PyTuple_SetItem_Dart _PyTuple_SetItem =
    _dynamicLibrary.lookupFunction<_PyTuple_SetItem_C, _PyTuple_SetItem_Dart>(
  'PyTuple_SetItem',
);
typedef _PyTuple_SetItem_C = ffi.Int32 Function(
  ffi.Pointer<PyObject> arg0,
  ffi.Uint32 arg1,
  ffi.Pointer<PyObject> arg2,
);
typedef _PyTuple_SetItem_Dart = int Function(
  ffi.Pointer<PyObject> arg0,
  int arg1,
  ffi.Pointer<PyObject> arg2,
);

/// Return value: New reference.
/// Return a new list of length len on success, or NULL on failure.
/// Note If len is greater than zero, the returned list object’s items are set to NULL. Thus you cannot use abstract API functions such as PySequence_SetItem() or expose the object to Python code before setting all items to a real object with PyList_SetItem().
ffi.Pointer<PyObject> PyList_New(
  int arg0,
) {
  return _PyList_New(arg0);
}

final _PyList_New_Dart _PyList_New =
    _dynamicLibrary.lookupFunction<_PyList_New_C, _PyList_New_Dart>(
  'PyList_New',
);
typedef _PyList_New_C = ffi.Pointer<PyObject> Function(
  ffi.Uint32 arg0,
);
typedef _PyList_New_Dart = ffi.Pointer<PyObject> Function(
  int arg0,
);

/// Return the length of the list object in list; this is equivalent to len(list) on a list object.
int PyList_Size(
  ffi.Pointer<PyObject> arg0,
) {
  return _PyList_Size(arg0);
}

final _PyList_Size_Dart _PyList_Size =
    _dynamicLibrary.lookupFunction<_PyList_Size_C, _PyList_Size_Dart>(
  'PyList_Size',
);
typedef _PyList_Size_C = ffi.Uint32 Function(
  ffi.Pointer<PyObject> arg0,
);
typedef _PyList_Size_Dart = int Function(
  ffi.Pointer<PyObject> arg0,
);

/// Return value: Borrowed reference.
/// Return the object at position index in the list pointed to by list. The position must be non-negative; indexing from the end of the list is not supported. If index is out of bounds (<0 or >=len(list)), return NULL and set an IndexError exception.
ffi.Pointer<PyObject> PyList_GetItem(
  ffi.Pointer<PyObject> arg0,
  int arg1,
) {
  return _PyList_GetItem(arg0, arg1);
}

final _PyList_GetItem_Dart _PyList_GetItem =
    _dynamicLibrary.lookupFunction<_PyList_GetItem_C, _PyList_GetItem_Dart>(
  'PyList_GetItem',
);
typedef _PyList_GetItem_C = ffi.Pointer<PyObject> Function(
  ffi.Pointer<PyObject> arg0,
  ffi.Uint32 arg1,
);
typedef _PyList_GetItem_Dart = ffi.Pointer<PyObject> Function(
  ffi.Pointer<PyObject> arg0,
  int arg1,
);

/// Set the item at index index in list to item. Return 0 on success. If index is out of bounds, return -1 and set an IndexError exception.
/// Note This function “steals” a reference to item and discards a reference to an item already in the list at the affected position.
int PyList_SetItem(
  ffi.Pointer<PyObject> arg0,
  int arg1,
  ffi.Pointer<PyObject> arg2,
) {
  return _PyList_SetItem(arg0, arg1, arg2);
}

final _PyList_SetItem_Dart _PyList_SetItem =
    _dynamicLibrary.lookupFunction<_PyList_SetItem_C, _PyList_SetItem_Dart>(
  'PyList_SetItem',
);
typedef _PyList_SetItem_C = ffi.Int32 Function(
  ffi.Pointer<PyObject> arg0,
  ffi.Uint32 arg1,
  ffi.Pointer<PyObject> arg2,
);
typedef _PyList_SetItem_Dart = int Function(
  ffi.Pointer<PyObject> arg0,
  int arg1,
  ffi.Pointer<PyObject> arg2,
);

/// Return value: New reference.
/// Return a new empty dictionary, or NULL on failure.
ffi.Pointer<PyObject> PyDict_New() {
  return _PyDict_New();
}

final _PyDict_New_Dart _PyDict_New =
    _dynamicLibrary.lookupFunction<_PyDict_New_C, _PyDict_New_Dart>(
  'PyDict_New',
);
typedef _PyDict_New_C = ffi.Pointer<PyObject> Function();
typedef _PyDict_New_Dart = ffi.Pointer<PyObject> Function();

/// Determine if dictionary p contains key. If an item in p is matches key, return 1, otherwise return 0. On error, return -1. This is equivalent to the Python expression key in p.
int PyDict_Contains(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<PyObject> arg1,
) {
  return _PyDict_Contains(arg0, arg1);
}

final _PyDict_Contains_Dart _PyDict_Contains =
    _dynamicLibrary.lookupFunction<_PyDict_Contains_C, _PyDict_Contains_Dart>(
  'PyDict_Contains',
);
typedef _PyDict_Contains_C = ffi.Int32 Function(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<PyObject> arg1,
);
typedef _PyDict_Contains_Dart = int Function(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<PyObject> arg1,
);

/// Insert val into the dictionary p with a key of key. key must be hashable; if it isn’t, TypeError will be raised. Return 0 on success or -1 on failure. This function does not steal a reference to val.
int PyDict_SetItem(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<PyObject> arg1,
  ffi.Pointer<PyObject> arg2,
) {
  return _PyDict_SetItem(arg0, arg1, arg2);
}

final _PyDict_SetItem_Dart _PyDict_SetItem =
    _dynamicLibrary.lookupFunction<_PyDict_SetItem_C, _PyDict_SetItem_Dart>(
  'PyDict_SetItem',
);
typedef _PyDict_SetItem_C = ffi.Int32 Function(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<PyObject> arg1,
  ffi.Pointer<PyObject> arg2,
);
typedef _PyDict_SetItem_Dart = int Function(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<PyObject> arg1,
  ffi.Pointer<PyObject> arg2,
);

/// Insert val into the dictionary p using key as a key. key should be a const char*. The key object is created using PyUnicode_FromString(key). Return 0 on success or -1 on failure. This function does not steal a reference to val.
int PyDict_SetItemString(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<ffi.Uint8> arg1,
  ffi.Pointer<PyObject> arg2,
) {
  return _PyDict_SetItemString(arg0, arg1, arg2);
}

final _PyDict_SetItemString_Dart _PyDict_SetItemString = _dynamicLibrary
    .lookupFunction<_PyDict_SetItemString_C, _PyDict_SetItemString_Dart>(
  'PyDict_SetItemString',
);
typedef _PyDict_SetItemString_C = ffi.Int32 Function(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<ffi.Uint8> arg1,
  ffi.Pointer<PyObject> arg2,
);
typedef _PyDict_SetItemString_Dart = int Function(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<ffi.Uint8> arg1,
  ffi.Pointer<PyObject> arg2,
);

/// Return value: Borrowed reference.
/// Return the object from dictionary p which has a key key. Return NULL if the key key is not present, but without setting an exception.
/// Note that exceptions which occur while calling __hash__() and __eq__() methods will get suppressed. To get error reporting use PyDict_GetItemWithError() instead.
ffi.Pointer<PyObject> PyDict_GetItem(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<PyObject> arg1,
) {
  return _PyDict_GetItem(arg0, arg1);
}

final _PyDict_GetItem_Dart _PyDict_GetItem =
    _dynamicLibrary.lookupFunction<_PyDict_GetItem_C, _PyDict_GetItem_Dart>(
  'PyDict_GetItem',
);
typedef _PyDict_GetItem_C = ffi.Pointer<PyObject> Function(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<PyObject> arg1,
);
typedef _PyDict_GetItem_Dart = ffi.Pointer<PyObject> Function(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<PyObject> arg1,
);

/// Return value: Borrowed reference.
/// This is the same as PyDict_GetItem(), but key is specified as a const char*, rather than a PyObject*.
/// Note that exceptions which occur while calling __hash__() and __eq__() methods and creating a temporary string object will get suppressed. To get error reporting use PyDict_GetItemWithError() instead.
ffi.Pointer<PyObject> PyDict_GetItemString(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<ffi.Uint8> arg1,
) {
  return _PyDict_GetItemString(arg0, arg1);
}

final _PyDict_GetItemString_Dart _PyDict_GetItemString = _dynamicLibrary
    .lookupFunction<_PyDict_GetItemString_C, _PyDict_GetItemString_Dart>(
  'PyDict_GetItemString',
);
typedef _PyDict_GetItemString_C = ffi.Pointer<PyObject> Function(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<ffi.Uint8> arg1,
);
typedef _PyDict_GetItemString_Dart = ffi.Pointer<PyObject> Function(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<ffi.Uint8> arg1,
);

/// Return value: New reference.
/// Return a PyListObject containing all the keys from the dictionary.
ffi.Pointer<PyObject> PyDict_Keys(
  ffi.Pointer<PyObject> arg0,
) {
  return _PyDict_Keys(arg0);
}

final _PyDict_Keys_Dart _PyDict_Keys =
    _dynamicLibrary.lookupFunction<_PyDict_Keys_C, _PyDict_Keys_Dart>(
  'PyDict_Keys',
);
typedef _PyDict_Keys_C = ffi.Pointer<PyObject> Function(
  ffi.Pointer<PyObject> arg0,
);
typedef _PyDict_Keys_Dart = ffi.Pointer<PyObject> Function(
  ffi.Pointer<PyObject> arg0,
);

/// Return value: New reference.
/// Return a PyListObject containing all the values from the dictionary p.
ffi.Pointer<PyObject> PyDict_Values(
  ffi.Pointer<PyObject> arg0,
) {
  return _PyDict_Values(arg0);
}

final _PyDict_Values_Dart _PyDict_Values =
    _dynamicLibrary.lookupFunction<_PyDict_Values_C, _PyDict_Values_Dart>(
  'PyDict_Values',
);
typedef _PyDict_Values_C = ffi.Pointer<PyObject> Function(
  ffi.Pointer<PyObject> arg0,
);
typedef _PyDict_Values_Dart = ffi.Pointer<PyObject> Function(
  ffi.Pointer<PyObject> arg0,
);

/// Return the number of items in the dictionary. This is equivalent to len(p) on a dictionary.
int PyDict_Size(
  ffi.Pointer<PyObject> arg0,
) {
  return _PyDict_Size(arg0);
}

final _PyDict_Size_Dart _PyDict_Size =
    _dynamicLibrary.lookupFunction<_PyDict_Size_C, _PyDict_Size_Dart>(
  'PyDict_Size',
);
typedef _PyDict_Size_C = ffi.Uint32 Function(
  ffi.Pointer<PyObject> arg0,
);
typedef _PyDict_Size_Dart = int Function(
  ffi.Pointer<PyObject> arg0,
);

/// Add an object to module as name. This is a convenience function which can be used from the module’s initialization function. This steals a reference to value on success. Return -1 on error, 0 on success.
/// Note Unlike other functions that steal references, PyModule_AddObject() only decrements the reference count of value on success.
/// This means that its return value must be checked, and calling code must Py_DECREF() value manually on error. Example usage:
int PyModule_AddObject(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<ffi.Uint8> arg1,
  ffi.Pointer<PyObject> arg2,
) {
  return _PyModule_AddObject(arg0, arg1, arg2);
}

final _PyModule_AddObject_Dart _PyModule_AddObject = _dynamicLibrary
    .lookupFunction<_PyModule_AddObject_C, _PyModule_AddObject_Dart>(
  'PyModule_AddObject',
);
typedef _PyModule_AddObject_C = ffi.Int32 Function(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<ffi.Uint8> arg1,
  ffi.Pointer<PyObject> arg2,
);
typedef _PyModule_AddObject_Dart = int Function(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<ffi.Uint8> arg1,
  ffi.Pointer<PyObject> arg2,
);

/// Return value: New reference.
/// Create a PyCapsule encapsulating the pointer. The pointer argument may not be NULL.
/// On failure, set an exception and return NULL.
/// The name string may either be NULL or a pointer to a valid C string. If non-NULL, this string must outlive the capsule. (Though it is permitted to free it inside the destructor.)
/// If the destructor argument is not NULL, it will be called with the capsule as its argument when it is destroyed.
/// If this capsule will be stored as an attribute of a module, the name should be specified as modulename.attributename. This will enable other modules to import the capsule using PyCapsule_Import().
ffi.Pointer<PyObject> PyCapsule_New(
  ffi.Pointer arg0,
  ffi.Pointer<ffi.Uint8> arg1,
  ffi.Pointer arg2,
) {
  return _PyCapsule_New(arg0, arg1, arg2);
}

final _PyCapsule_New_Dart _PyCapsule_New =
    _dynamicLibrary.lookupFunction<_PyCapsule_New_C, _PyCapsule_New_Dart>(
  'PyCapsule_New',
);
typedef _PyCapsule_New_C = ffi.Pointer<PyObject> Function(
  ffi.Pointer arg0,
  ffi.Pointer<ffi.Uint8> arg1,
  ffi.Pointer arg2,
);
typedef _PyCapsule_New_Dart = ffi.Pointer<PyObject> Function(
  ffi.Pointer arg0,
  ffi.Pointer<ffi.Uint8> arg1,
  ffi.Pointer arg2,
);

/// Retrieve the pointer stored in the capsule. On failure, set an exception and return NULL.
///
/// The name parameter must compare exactly to the name stored in the capsule. If the name stored in the capsule is NULL, the name passed in must also be NULL. Python uses the C function strcmp() to compare capsule names.
ffi.Pointer PyCapsule_GetPointer(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<ffi.Uint8> arg1,
) {
  return _PyCapsule_GetPointer(arg0, arg1);
}

final _PyCapsule_GetPointer_Dart _PyCapsule_GetPointer = _dynamicLibrary
    .lookupFunction<_PyCapsule_GetPointer_C, _PyCapsule_GetPointer_Dart>(
  'PyCapsule_GetPointer',
);
typedef _PyCapsule_GetPointer_C = ffi.Pointer Function(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<ffi.Uint8> arg1,
);
typedef _PyCapsule_GetPointer_Dart = ffi.Pointer Function(
  ffi.Pointer<PyObject> arg0,
  ffi.Pointer<ffi.Uint8> arg1,
);

/// Initialize the Python interpreter. In an application embedding Python, this should be called before using any other Python/C API functions; see Before Python Initialization for the few exceptions.
/// This initializes the table of loaded modules (sys.modules), and creates the fundamental modules builtins, __main__ and sys. It also initializes the module search path (sys.path). It does not set sys.argv; use PySys_SetArgvEx() for that. This is a no-op when called for a second time (without calling Py_FinalizeEx() first). There is no return value; it is a fatal error if the initialization fails.
/// Note On Windows, changes the console mode from O_TEXT to O_BINARY, which will also affect non-Python uses of the console using the C Runtime.
void Py_Initialize() {
  _Py_Initialize();
}

final _Py_Initialize_Dart _Py_Initialize =
    _dynamicLibrary.lookupFunction<_Py_Initialize_C, _Py_Initialize_Dart>(
  'Py_Initialize',
);
typedef _Py_Initialize_C = ffi.Void Function();
typedef _Py_Initialize_Dart = void Function();

/// This function works like Py_Initialize() if initsigs is 1. If initsigs is 0, it skips initialization registration of signal handlers, which might be useful when Python is embedded.
void Py_InitializeEx(
  int arg0,
) {
  _Py_InitializeEx(arg0);
}

final _Py_InitializeEx_Dart _Py_InitializeEx =
    _dynamicLibrary.lookupFunction<_Py_InitializeEx_C, _Py_InitializeEx_Dart>(
  'Py_InitializeEx',
);
typedef _Py_InitializeEx_C = ffi.Void Function(
  ffi.Int32 arg0,
);
typedef _Py_InitializeEx_Dart = void Function(
  int arg0,
);

/// Return true (nonzero) when the Python interpreter has been initialized, false (zero) if not. After Py_FinalizeEx() is called, this returns false until Py_Initialize() is called again.
int Py_IsInitialized() {
  return _Py_IsInitialized();
}

final _Py_IsInitialized_Dart _Py_IsInitialized =
    _dynamicLibrary.lookupFunction<_Py_IsInitialized_C, _Py_IsInitialized_Dart>(
  'Py_IsInitialized',
);
typedef _Py_IsInitialized_C = ffi.Int32 Function();
typedef _Py_IsInitialized_Dart = int Function();

/// Undo all initializations made by Py_Initialize() and subsequent use of Python/C API functions, and destroy all sub-interpreters (see Py_NewInterpreter() below) that were created and not yet destroyed since the last call to Py_Initialize(). Ideally, this frees all memory allocated by the Python interpreter. This is a no-op when called for a second time (without calling Py_Initialize() again first). Normally the return value is 0. If there were errors during finalization (flushing buffered data), -1 is returned.
/// This function is provided for a number of reasons. An embedding application might want to restart Python without having to restart the application itself. An application that has loaded the Python interpreter from a dynamically loadable library (or DLL) might want to free all memory allocated by Python before unloading the DLL. During a hunt for memory leaks in an application a developer might want to free all memory allocated by Python before exiting from the application.
/// Bugs and caveats: The destruction of modules and objects in modules is done in random order; this may cause destructors (__del__() methods) to fail when they depend on other objects (even functions) or modules. Dynamically loaded extension modules loaded by Python are not unloaded. Small amounts of memory allocated by the Python interpreter may not be freed (if you find a leak, please report it). Memory tied up in circular references between objects is not freed. Some memory allocated by extension modules may not be freed. Some extensions may not work properly if their initialization routine is called more than once; this can happen if an application calls Py_Initialize() and Py_FinalizeEx() more than once.
/// Raises an auditing event cpython._PySys_ClearAuditHooks with no arguments.
/// New in version 3.6.
int Py_FinalizeEx() {
  return _Py_FinalizeEx();
}

final _Py_FinalizeEx_Dart _Py_FinalizeEx =
    _dynamicLibrary.lookupFunction<_Py_FinalizeEx_C, _Py_FinalizeEx_Dart>(
  'Py_FinalizeEx',
);
typedef _Py_FinalizeEx_C = ffi.Int32 Function();
typedef _Py_FinalizeEx_Dart = int Function();

/// This is a backwards-compatible version of Py_FinalizeEx() that disregards the return value.
void Py_Finalize() {
  _Py_Finalize();
}

final _Py_Finalize_Dart _Py_Finalize =
    _dynamicLibrary.lookupFunction<_Py_Finalize_C, _Py_Finalize_Dart>(
  'Py_Finalize',
);
typedef _Py_Finalize_C = ffi.Void Function();
typedef _Py_Finalize_Dart = void Function();

/// This function should be called before Py_Initialize() is called for the first time, if it is called at all. It tells the interpreter the value of the argv[0] argument to the main() function of the program (converted to wide characters). This is used by Py_GetPath() and some other functions below to find the Python run-time libraries relative to the interpreter executable. The default value is 'python'. The argument should point to a zero-terminated wide character string in static storage whose contents will not change for the duration of the program’s execution. No code in the Python interpreter will change the contents of this storage.
/// Use Py_DecodeLocale() to decode a bytes string to get a wchar_* string.
void Py_SetProgramName(
  ffi.Pointer<ffi.Uint16> arg0,
) {
  _Py_SetProgramName(arg0);
}

final _Py_SetProgramName_Dart _Py_SetProgramName = _dynamicLibrary
    .lookupFunction<_Py_SetProgramName_C, _Py_SetProgramName_Dart>(
  'Py_SetProgramName',
);
typedef _Py_SetProgramName_C = ffi.Void Function(
  ffi.Pointer<ffi.Uint16> arg0,
);
typedef _Py_SetProgramName_Dart = void Function(
  ffi.Pointer<ffi.Uint16> arg0,
);

/// Return the default module search path; this is computed from the program name (set by Py_SetProgramName() above) and some environment variables. The returned string consists of a series of directory names separated by a platform dependent delimiter character. The delimiter character is ':' on Unix and Mac OS X, ';' on Windows. The returned string points into static storage; the caller should not modify its value. The list sys.path is initialized with this value on interpreter startup; it can be (and usually is) modified later to change the search path for loading modules.
ffi.Pointer<ffi.Uint16> Py_GetPath() {
  return _Py_GetPath();
}

final _Py_GetPath_Dart _Py_GetPath =
    _dynamicLibrary.lookupFunction<_Py_GetPath_C, _Py_GetPath_Dart>(
  'Py_GetPath',
);
typedef _Py_GetPath_C = ffi.Pointer<ffi.Uint16> Function();
typedef _Py_GetPath_Dart = ffi.Pointer<ffi.Uint16> Function();

/// Set the default module search path. If this function is called before Py_Initialize(), then Py_GetPath() won’t attempt to compute a default search path but uses the one provided instead. This is useful if Python is embedded by an application that has full knowledge of the location of all modules. The path components should be separated by the platform dependent delimiter character, which is ':' on Unix and Mac OS X, ';' on Windows.
/// This also causes sys.executable to be set to the program full path (see Py_GetProgramFullPath()) and for sys.prefix and sys.exec_prefix to be empty. It is up to the caller to modify these if required after calling Py_Initialize().
/// Use Py_DecodeLocale() to decode a bytes string to get a wchar_* string.
/// The path argument is copied internally, so the caller may free it after the call completes.
/// Changed in version 3.8: The program full path is now used for sys.executable, instead of the program name.
void Py_SetPath(
  ffi.Pointer<ffi.Uint16> arg0,
) {
  _Py_SetPath(arg0);
}

final _Py_SetPath_Dart _Py_SetPath =
    _dynamicLibrary.lookupFunction<_Py_SetPath_C, _Py_SetPath_Dart>(
  'Py_SetPath',
);
typedef _Py_SetPath_C = ffi.Void Function(
  ffi.Pointer<ffi.Uint16> arg0,
);
typedef _Py_SetPath_Dart = void Function(
  ffi.Pointer<ffi.Uint16> arg0,
);

/// C global `PyExc_BaseException`.
final ffi.Pointer<PyObject> PyExc_BaseException = _dynamicLibrary
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_BaseException',
    )
    .value;

/// C global `PyExc_Exception`.
final ffi.Pointer<PyObject> PyExc_Exception = _dynamicLibrary
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_Exception',
    )
    .value;

/// C global `PyExc_ArithmeticError`.
final ffi.Pointer<PyObject> PyExc_ArithmeticError = _dynamicLibrary
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_ArithmeticError',
    )
    .value;

/// C global `PyExc_AssertionError`.
final ffi.Pointer<PyObject> PyExc_AssertionError = _dynamicLibrary
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_AssertionError',
    )
    .value;

/// C global `PyExc_AttributeError`.
final ffi.Pointer<PyObject> PyExc_AttributeError = _dynamicLibrary
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_AttributeError',
    )
    .value;

/// C global `PyExc_BlockingIOError`.
final ffi.Pointer<PyObject> PyExc_BlockingIOError = _dynamicLibrary
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_BlockingIOError',
    )
    .value;

/// C global `PyExc_BrokenPipeError`.
final ffi.Pointer<PyObject> PyExc_BrokenPipeError = _dynamicLibrary
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_BrokenPipeError',
    )
    .value;

/// C global `PyExc_FloatingPointError`.
final ffi.Pointer<PyObject> PyExc_FloatingPointError = _dynamicLibrary
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_FloatingPointError',
    )
    .value;

/// C global `PyExc_OverflowError`.
final ffi.Pointer<PyObject> PyExc_OverflowError = _dynamicLibrary
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_OverflowError',
    )
    .value;

/// C global `PyExc_ZeroDivisionError`.
final ffi.Pointer<PyObject> PyExc_ZeroDivisionError = _dynamicLibrary
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_ZeroDivisionError',
    )
    .value;

/// C global `PyExc_OSError`.
final ffi.Pointer<PyObject> PyExc_OSError = _dynamicLibrary
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_OSError',
    )
    .value;

/// C global `PyExc_IOError`.
final ffi.Pointer<PyObject> PyExc_IOError = _dynamicLibrary
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_IOError',
    )
    .value;

/// C global `PyExc_ValueError`.
final ffi.Pointer<PyObject> PyExc_ValueError = _dynamicLibrary
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_ValueError',
    )
    .value;

/// C global `PyExc_EOFError`.
final ffi.Pointer<PyObject> PyExc_EOFError = _dynamicLibrary
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_EOFError',
    )
    .value;

/// C global `PyExc_MemoryError`.
final ffi.Pointer<PyObject> PyExc_MemoryError = _dynamicLibrary
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_MemoryError',
    )
    .value;

/// C global `PyExc_IndexError`.
final ffi.Pointer<PyObject> PyExc_IndexError = _dynamicLibrary
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_IndexError',
    )
    .value;

/// C global `PyExc_KeyError`.
final ffi.Pointer<PyObject> PyExc_KeyError = _dynamicLibrary
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_KeyError',
    )
    .value;

/// C global `PyExc_TypeError`.
final ffi.Pointer<PyObject> PyExc_TypeError = _dynamicLibrary
    .lookup<ffi.Pointer<PyObject>>(
      'PyExc_TypeError',
    )
    .value;

/// The NotImplemented singleton, used to signal that an operation is not implemented for the given type combination.
/// Increment the reference count before returning it.
final ffi.Pointer<PyObject> Py_NotImplemented = _dynamicLibrary
    .lookup<ffi.Pointer<PyObject>>(
      'Py_NotImplemented',
    )
    .value;

/// The C structure of the objects used to describe built-in types.
final ffi.Pointer<PyObject> PyType_Type = _dynamicLibrary
    .lookup<ffi.Pointer<PyObject>>(
      'PyType_Type',
    )
    .value;

/// The Python None object, denoting lack of value. This object has no methods. It needs to be treated just like any other object with respect to reference counts.
final ffi.Pointer<PyObject> Py_None = _dynamicLibrary
    .lookup<ffi.Pointer<PyObject>>(
      '_Py_NoneStruct',
    )
    .value;

/// The Python False object. This object has no methods. It needs to be treated just like any other object with respect to reference counts.
final ffi.Pointer<PyObject> Py_False = _dynamicLibrary
    .lookup<ffi.Pointer<PyObject>>(
      '_Py_FalseStruct',
    )
    .value;

/// The Python True object. This object has no methods. It needs to be treated just like any other object with respect to reference counts.
final ffi.Pointer<PyObject> Py_True = _dynamicLibrary
    .lookup<ffi.Pointer<PyObject>>(
      '_Py_TrueStruct',
    )
    .value;
