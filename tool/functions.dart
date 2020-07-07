import 'package:ffi_tool/c.dart';

import 'structs.dart';
import 'type_aliases.dart';

const functions = [
  // The Very High Level Layer
  // https://docs.python.org/3/c-api/veryhigh.html
  // The functions in this chapter will let you execute Python source code given in a file or a buffer, but they will not let you interact in a more detailed way with the interpreter.
  // Several of these functions accept a start symbol from the grammar as a parameter. The available start symbols are Py_eval_input, Py_file_input, and Py_single_input. These are described following the functions which accept them as parameters.
  // Note also that several of these functions take FILE* parameters. One particular issue which needs to be handled carefully is that the FILE structure for different C libraries can be different and incompatible. Under Windows (at least), it is possible for dynamically linked extensions to actually use different libraries, so care should be taken that FILE* parameters are only passed to these functions if it is certain that they were created by the same library that the Python runtime is using.
  Func(
    name: 'Py_Main',
    parameterTypes: [cint, cwstring],
    returnType: cint,
    documentation: '''
The main program for the standard interpreter. This is made available for programs which embed Python. The argc and argv parameters should be prepared exactly as those which are passed to a C program’s main() function (converted to wchar_t according to the user’s locale). It is important to note that the argument list may be modified (but the contents of the strings pointed to by the argument list are not). The return value will be 0 if the interpreter exits normally (i.e., without an exception), 1 if the interpreter exits due to an exception, or 2 if the parameter list does not represent a valid Python command line.
Note that if an otherwise unhandled SystemExit is raised, this function will not return 1, but exit the process, as long as Py_InspectFlag is not set.''',
  ),

  Func(
    name: 'Py_BytesMain',
    parameterTypes: [cint, cstring],
    returnType: cint,
    documentation: '''
Similar to [Py_Main] but argv is an array of bytes strings.
New in version 3.8''',
  ),
  // TODO: More things here
  Func(
    name: 'PyRun_SimpleString',
    parameterTypes: [cstring],
    returnType: cint,
    documentation: '''
This is a simplified interface to [PyRun_SimpleStringFlags] below, leaving the PyCompilerFlags* argument set to NULL.''',
  ),
  Func(
    name: 'PyRun_SimpleStringFlags',
    parameterTypes: [cstring, pPyCompilerFlags],
    returnType: cint,
    documentation: '''
Executes the Python source code from command in the __main__ module according to the flags argument. If __main__ does not already exist, it is created. Returns 0 on success or -1 if an exception was raised. If there was an error, there is no way to get the exception information. For the meaning of flags, see below.
Note that if an otherwise unhandled SystemExit is raised, this function will not return -1, but exit the process, as long as Py_InspectFlag is not set.''',
  ),
  // Reference Counting
  // https://docs.python.org/3/c-api/refcounting.html
  Func(
    name: 'Py_IncRef',
    parameterTypes: [pPyObject],
    returnType: cvoid,
    documentation: '''
Increment the reference count for object o. The object may be NULL, in which case the function has no effect.''',
  ),
  Func(
    name: 'Py_DecRef',
    parameterTypes: [pPyObject],
    returnType: cvoid,
    documentation: '''
Decrement the reference count for object o. The object may be NULL, in which case the function has no effect.
If the reference count reaches zero, the object’s type’s deallocation function (which must not be NULL) is invoked.
Warning The deallocation function can cause arbitrary Python code to be invoked (e.g. when a class instance with a __del__() method is deallocated). While exceptions in such code are not propagated, the executed code has free access to all Python global variables. This means that any object that is reachable from a global variable should be in a consistent state before Py_DECREF() is invoked. For example, code to delete an object from a list should copy a reference to the deleted object in a temporary variable, update the list data structure, and then call Py_DECREF() for the temporary variable.''',
  ),

  // Exception Handling
  // https://docs.python.org/3/c-api/exceptions.html
  Func(
    name: 'PyErr_Clear',
    parameterTypes: [],
    returnType: cvoid,
    documentation: '''
Clear the error indicator. If the error indicator is not set, there is no effect.''',
  ),

  Func(
    name: 'PyErr_PrintEx',
    parameterTypes: [cint],
    returnType: cvoid,
    documentation: '''
Print a standard traceback to sys.stderr and clear the error indicator. Unless the error is a SystemExit, in that case no traceback is printed and the Python process will exit with the error code specified by the SystemExit instance.
Call this function only when the error indicator is set. Otherwise it will cause a fatal error!
If set_sys_last_vars is nonzero, the variables sys.last_type, sys.last_value and sys.last_traceback will be set to the type, value and traceback of the printed exception, respectively.''',
  ),
  Func(
      name: 'PyErr_Print',
      parameterTypes: [],
      returnType: cvoid,
      documentation: 'Alias for [PyErr_PrintEx(1)].'),

  //TODO: more
  Func(
    name: 'PyErr_SetString',
    parameterTypes: [pPyObject, cstring],
    returnType: cvoid,
    documentation: '''
This is the most common way to set the error indicator. The first argument specifies the exception type; it is normally one of the standard exceptions, e.g. PyExc_RuntimeError. You need not increment its reference count. The second argument is an error message; it is decoded from 'utf-8’.''',
  ),
  // TODO: More
  Func(
    name: 'PyErr_SetNone',
    parameterTypes: [pPyObject],
    returnType: cvoid,
    documentation: 'This is a shorthand for PyErr_SetObject(type, Py_None).',
  ),
  //TODO: More
  Func(
    name: 'PyErr_Occurred',
    parameterTypes: [],
    returnType: pPyObject,
    documentation: '''
Return value: Borrowed reference.
Test whether the error indicator is set. If set, return the exception type (the first argument to the last call to one of the PyErr_Set*() functions or to PyErr_Restore()). If not set, return NULL. You do not own a reference to the return value, so you do not need to Py_DECREF() it.
Note Do not compare the return value to a specific exception; use PyErr_ExceptionMatches() instead, shown below. (The comparison could easily fail since the exception may be an instance instead of a class, in the case of a class exception, or it may be a subclass of the expected exception.)''',
  ),
  //TODO: More
  Func(
    name: 'PyErr_NewException',
    parameterTypes: [cstring, pPyObject, pPyObject],
    returnType: pPyObject,
    documentation: '''
Return value: New reference.
This utility function creates and returns a new exception class. The name argument must be the name of the new exception, a C string of the form module.classname. The base and dict arguments are normally NULL. This creates a class object derived from Exception (accessible in C as PyExc_Exception).
The __module__ attribute of the new class is set to the first part (up to the last dot) of the name argument, and the class name is set to the last part (after the last dot). The base argument can be used to specify alternate base classes; it can either be only one class or a tuple of classes. The dict argument can be used to specify a dictionary of class variables and methods.''',
  ),
  // TODO: More
// Operating System Utilities
// https://docs.python.org/3/c-api/sys.html
// TODO: All of system

// Importing Modules
// https://docs.python.org/3/c-api/import.html
  Func(
    name: 'PyImport_ImportModule',
    parameterTypes: [cstring],
    returnType: pPyObject,
    documentation: '''
Return value: New reference.
This is a simplified interface to PyImport_ImportModuleEx() below, leaving the globals and locals arguments set to NULL and level set to 0. When the name argument contains a dot (when it specifies a submodule of a package), the fromlist argument is set to the list ['*'] so that the return value is the named module rather than the top-level package containing it as would otherwise be the case. (Unfortunately, this has an additional side effect when name in fact specifies a subpackage instead of a submodule: the submodules specified in the package’s __all__ variable are loaded.) Return a new reference to the imported module, or NULL with an exception set on failure. A failing import of a module doesn’t leave the module in sys.modules.
This function always uses absolute imports.''',
  ),
  // TODO More
  Func(
    name: 'PyImport_Import',
    parameterTypes: [pPyObject],
    returnType: pPyObject,
    documentation: '''
Return value: New reference.
This is a higher-level interface that calls the current “import hook function” (with an explicit level of 0, meaning absolute import). It invokes the __import__() function from the __builtins__ of the current globals. This means that the import is done using whatever import hooks are installed in the current environment.
This function always uses absolute imports.''',
  ),
// TODO More

// Data marshalling support
// https://docs.python.org/3/c-api/marshal.html
// TODO: All of data marshalling

// Parsing arguments and building values
// https://docs.python.org/3/c-api/arg.html
// TODO: This one is really good, but complex, since varargs
// TODO: A bunch

// String conversion and formatting
// https://docs.python.org/3/c-api/conversion.html
// TODO: This

// Reflection
// https://docs.python.org/3/c-api/reflection.html
  Func(
    name: 'PyEval_GetBuiltins',
    parameterTypes: [],
    returnType: pPyObject,
    documentation: '''
Return value: Borrowed reference.
Return a dictionary of the builtins in the current execution frame, or the interpreter of the thread state if no frame is currently executing.''',
  ),
  Func(
    name: 'PyEval_GetLocals',
    parameterTypes: [],
    returnType: pPyObject,
    documentation: '''
Return value: Borrowed reference.
Return a dictionary of the local variables in the current execution frame, or NULL if no frame is currently executing.''',
  ),
  Func(
    name: 'PyEval_GetGlobals',
    parameterTypes: [],
    returnType: pPyObject,
    documentation: '''
Return value: Borrowed reference.
Return a dictionary of the global variables in the current execution frame, or NULL if no frame is currently executing.''',
  ),
// TODO: More

// Code registry and support functions
// https://docs.python.org/3/c-api/codec.html
// TODO: This

// Object Protocol
// https://docs.python.org/3/c-api/object.html
  Func(
      name: 'PyObject_CallObject',
      parameterTypes: [pPyObject, pPyObject],
      returnType: pPyObject),
  Func(
      name: 'PyObject_Call',
      parameterTypes: [pPyObject, pPyObject, pPyObject],
      returnType: pPyObject),
  Func(name: 'PyObject_IsTrue', parameterTypes: [pPyObject], returnType: cint),
  Func(
      name: 'PyObject_GetAttrString',
      parameterTypes: [pPyObject, cstring],
      returnType: pPyObject),
  Func(
      name: 'PyObject_SetAttrString',
      parameterTypes: [pPyObject, cstring, pPyObject],
      returnType: cint),
  Func(
      name: 'PyObject_Dir', parameterTypes: [pPyObject], returnType: pPyObject),
  Func(
      name: 'PyObject_Str', parameterTypes: [pPyObject], returnType: pPyObject),
  Func(
      name: 'PyObject_GetIter',
      parameterTypes: [pPyObject],
      returnType: pPyObject),
  Func(
      name: 'PyObject_GetItem',
      parameterTypes: [pPyObject, pPyObject],
      returnType: pPyObject),
  Func(
      name: 'PyObject_SetItem',
      parameterTypes: [pPyObject, pPyObject, pPyObject],
      returnType: cint),
  Func(
      name: 'PyObject_RichCompareBool',
      parameterTypes: [pPyObject, pPyObject, cint],
      returnType: cint),
  Func(
      name: 'PyObject_GetBuffer',
      parameterTypes: [pPyObject, rawPyBuffer, cint],
      returnType: cint),
// TODO: Some here

  Func(name: 'Py_Initialize', parameterTypes: [], returnType: pySsizeT),
  Func(name: 'Py_FinalizeEx', returnType: pySsizeT, parameterTypes: []),

  Func(name: 'PyTuple_New', parameterTypes: [pySsizeT], returnType: pPyObject),
  Func(name: 'PyTuple_Size', parameterTypes: [pPyObject], returnType: pySsizeT),
  Func(
      name: 'PyTuple_GetItem',
      parameterTypes: [pPyObject, pySsizeT],
      returnType: pPyObject),
  Func(
      name: 'PyTuple_SetItem',
      parameterTypes: [pPyObject, pySsizeT, pPyObject],
      returnType: pySsizeT),

  // TODO: Py_None ????
  Func(name: 'PyType_Ready', parameterTypes: [pyTypeObject], returnType: cint),
  Func(
      name: 'PyType_GenericNew',
      parameterTypes: [pyTypeObject, pPyObject, pPyObject],
      returnType: pPyObject),
  Func(
      name: 'PyModule_AddObject',
      parameterTypes: [pPyObject, cstring, pPyObject],
      returnType: cint),

  Func(name: 'PyListNew', parameterTypes: [pySsizeT], returnType: pPyObject),
  Func(name: 'PyList_Size', parameterTypes: [pPyObject], returnType: pySsizeT),
  Func(
      name: 'PyList_GetItem',
      parameterTypes: [pPyObject, pySsizeT],
      returnType: pPyObject),
  Func(
      name: 'PyList_SetItem',
      parameterTypes: [pPyObject, pySsizeT, pPyObject],
      returnType: cint),

//TODO: Check keyword versus non keyword function calls

  Func(
      name: 'PyBuffer_Release',
      parameterTypes: [rawPyBuffer],
      returnType: cint),

  Func(name: 'PyIter_Next', parameterTypes: [pPyObject], returnType: pPyObject),

  Func(
      name: 'PyLong_AsLongLong',
      parameterTypes: [pPyObject],
      returnType: clonglong),
  Func(
      name: 'PyFloat_AsDouble',
      parameterTypes: [pPyObject],
      returnType: cdouble),
  Func(name: 'PyBool_FromLong', parameterTypes: [clong], returnType: pPyObject),

  Func(
      name: 'PyType_IsSubtype',
      parameterTypes: [pyTypeObject, pyTypeObject],
      returnType: cint),

//TODO: Complex -> dart complex

  Func(
      name: 'PyComplex_RealAsDouble',
      parameterTypes: [pPyObject],
      returnType: cdouble),
  Func(
      name: 'PyComplex_ImagAsDouble',
      parameterTypes: [pPyObject],
      returnType: cdouble),

  Func(
      name: 'PyUnicode_AsUTF8String',
      parameterTypes: [pPyObject],
      returnType: pPyObject),
  Func(
      name: 'PyBytes_AsStringAndSize',
      parameterTypes: [pPyObject, ppC, ppySize],
      returnType: cint),
  Func(
      name: 'PyUnicode_FromString',
      parameterTypes: [cstring],
      returnType: pPyObject),
  Func(
      name: 'PyUnicode_CompareWithASCIIString',
      parameterTypes: [pPyObject, cstring],
      returnType: cint),
  Func(
      name: 'PyString_AsString',
      parameterTypes: [pPyObject],
      returnType: cstring),

  Func(name: 'PyDict_New', parameterTypes: [], returnType: pPyObject),
  Func(name: 'PyDict_Size', parameterTypes: [pPyObject], returnType: pySsizeT),
  Func(
      name: 'PyDict_GetItemString',
      parameterTypes: [pPyObject, cstring],
      returnType: pPyObject),
  Func(
      name: 'PyDict_SetItemString',
      parameterTypes: [pPyObject, cstring, pPyObject],
      returnType: cint),
  Func(
      name: 'PyDict_GetItem',
      parameterTypes: [pPyObject, pPyObject],
      returnType: pPyObject),
  Func(
      name: 'PyDict_SetItem',
      parameterTypes: [pPyObject, pPyObject, pPyObject],
      returnType: cint),
  Func(name: 'PyDict_Keys', parameterTypes: [pPyObject], returnType: pPyObject),
  Func(
      name: 'PyDict_Values',
      parameterTypes: [pPyObject],
      returnType: pPyObject),
  Func(
      name: 'PyDict_Contains',
      parameterTypes: [pPyObject, pPyObject],
      returnType: cint),

  Func(
      name: 'PyCapsule_New',
      parameterTypes: ['*void', cstring, '*void'],
      returnType: pPyObject),
  Func(
      name: 'PyCapsule_GetPointer',
      parameterTypes: [pPyObject, cstring],
      returnType: '*void'),

  Func(
      name: 'PyUnicode_DecodeFSDefault',
      parameterTypes: [cstring],
      returnType: pPyObject),

  Func(
      name: 'PyCallable_Check',
      parameterTypes: [pPyObject],
      returnType: pySsizeT),
  Func(
      name: 'PyLong_FromLong',
      parameterTypes: ['uint64'],
      returnType: pPyObject),
  Func(
      name: 'PyLong_AsLong', parameterTypes: [pPyObject], returnType: 'uint64'),
];
