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
    returnType: pySsizeT,
    documentation: '''
This is a simplified interface to [PyRun_SimpleStringFlags] below, leaving the PyCompilerFlags* argument set to NULL.''',
  ),
  Func(
    name: 'PyRun_SimpleStringFlags',
    parameterTypes: [cstring, pPyCompilerFlags],
    returnType: pySsizeT,
    documentation: '''
Executes the Python source code from command in the __main__ module according to the flags argument. If __main__ does not already exist, it is created. Returns 0 on success or -1 if an exception was raised. If there was an error, there is no way to get the exception information. For the meaning of flags, see below.
Note that if an otherwise unhandled SystemExit is raised, this function will not return -1, but exit the process, as long as Py_InspectFlag is not set.''',
  ),
  // Reference Counting

  Func(
    name: 'Py_IncRef',
    parameterTypes: [ppyObject],
    returnType: cvoid,
    documentation: '''
Increment the reference count for object o. The object may be NULL, in which case the function has no effect.''',
  ),
  Func(
    name: 'Py_DecRef',
    parameterTypes: [ppyObject],
    returnType: cvoid,
    documentation: '''
Decrement the reference count for object o. The object may be NULL, in which case the macro has no effect; otherwise the effect is the same as for Py_DECREF(), and the same warning applies.''',
  ),

  ///
  Func(name: 'Py_Initialize', parameterTypes: [], returnType: pySsizeT),
  Func(name: 'Py_FinalizeEx', returnType: pySsizeT, parameterTypes: []),
  Func(
      name: 'PyImport_Import',
      parameterTypes: [cstring],
      returnType: ppyObject),

  Func(name: 'Py_BuildValue', parameterTypes: [cstring], returnType: ppyObject),
  Func(name: 'PyTuple_New', parameterTypes: [pySsizeT], returnType: ppyObject),
  Func(name: 'PyTuple_Size', parameterTypes: [ppyObject], returnType: pySsizeT),
  Func(
      name: 'PyTuple_GetItem',
      parameterTypes: [ppyObject, pySsizeT],
      returnType: ppyObject),
  Func(
      name: 'PyTuple_SetItem',
      parameterTypes: [ppyObject, pySsizeT, ppyObject],
      returnType: pySsizeT),

  // TODO: Py_None ????
  Func(name: 'PyType_Ready', parameterTypes: [pyTypeObject], returnType: cint),
  Func(
      name: 'PyType_GenericNew',
      parameterTypes: [pyTypeObject, ppyObject, ppyObject],
      returnType: ppyObject),
  Func(
      name: 'PyModule_AddObject',
      parameterTypes: [ppyObject, cstring, ppyObject],
      returnType: cint),

  Func(name: 'PyListNew', parameterTypes: [pySsizeT], returnType: ppyObject),
  Func(name: 'PyList_Size', parameterTypes: [ppyObject], returnType: pySsizeT),
  Func(
      name: 'PyList_GetItem',
      parameterTypes: [ppyObject, pySsizeT],
      returnType: ppyObject),
  Func(
      name: 'PyList_SetItem',
      parameterTypes: [ppyObject, pySsizeT, ppyObject],
      returnType: cint),

//TODO: Check keyword versus non keyword function calls
  Func(
      name: 'PyObject_CallObject',
      parameterTypes: [ppyObject, ppyObject],
      returnType: ppyObject),
  Func(
      name: 'PyObject_Call',
      parameterTypes: [ppyObject, ppyObject, ppyObject],
      returnType: ppyObject),
  Func(name: 'PyObject_IsTrue', parameterTypes: [ppyObject], returnType: cint),
  Func(
      name: 'PyObject_GetAttrString',
      parameterTypes: [ppyObject, cstring],
      returnType: ppyObject),
  Func(
      name: 'PyObject_SetAttrString',
      parameterTypes: [ppyObject, cstring, ppyObject],
      returnType: cint),
  Func(
      name: 'PyObject_Dir', parameterTypes: [ppyObject], returnType: ppyObject),
  Func(
      name: 'PyObject_Str', parameterTypes: [ppyObject], returnType: ppyObject),
  Func(
      name: 'PyObject_GetIter',
      parameterTypes: [ppyObject],
      returnType: ppyObject),
  Func(
      name: 'PyObject_GetItem',
      parameterTypes: [ppyObject, ppyObject],
      returnType: ppyObject),
  Func(
      name: 'PyObject_SetItem',
      parameterTypes: [ppyObject, ppyObject, ppyObject],
      returnType: cint),
  Func(
      name: 'PyObject_RichCompareBool',
      parameterTypes: [ppyObject, ppyObject, cint],
      returnType: cint),
  Func(
      name: 'PyObject_GetBuffer',
      parameterTypes: [ppyObject, rawPyBuffer, cint],
      returnType: cint),
  Func(
      name: 'PyBuffer_Release',
      parameterTypes: [rawPyBuffer],
      returnType: cint),

  Func(
      name: 'PyErr_NewException',
      parameterTypes: [cstring, ppyObject, ppyObject],
      returnType: ppyObject),

  Func(name: 'PyIter_Next', parameterTypes: [ppyObject], returnType: ppyObject),

  Func(
      name: 'PyLong_AsLongLong',
      parameterTypes: [ppyObject],
      returnType: clonglong),
  Func(
      name: 'PyFloat_AsDouble',
      parameterTypes: [ppyObject],
      returnType: cdouble),
  Func(name: 'PyBool_FromLong', parameterTypes: [clong], returnType: ppyObject),

  Func(
      name: 'PyType_IsSubtype',
      parameterTypes: [pyTypeObject, pyTypeObject],
      returnType: cint),

//TODO: Complex -> dart complex

  Func(
      name: 'PyComplex_RealAsDouble',
      parameterTypes: [ppyObject],
      returnType: cdouble),
  Func(
      name: 'PyComplex_ImagAsDouble',
      parameterTypes: [ppyObject],
      returnType: cdouble),

  Func(
      name: 'PyUnicode_AsUTF8String',
      parameterTypes: [ppyObject],
      returnType: ppyObject),
  Func(
      name: 'PyBytes_AsStringAndSize',
      parameterTypes: [ppyObject, ppC, ppySize],
      returnType: cint),
  Func(
      name: 'PyUnicode_FromString',
      parameterTypes: [cstring],
      returnType: ppyObject),
  Func(
      name: 'PyUnicode_CompareWithASCIIString',
      parameterTypes: [ppyObject, cstring],
      returnType: cint),
  Func(
      name: 'PyString_AsString',
      parameterTypes: [ppyObject],
      returnType: cstring),

  Func(name: 'PyDict_New', parameterTypes: [], returnType: ppyObject),
  Func(name: 'PyDict_Size', parameterTypes: [ppyObject], returnType: pySsizeT),
  Func(
      name: 'PyDict_GetItemString',
      parameterTypes: [ppyObject, cstring],
      returnType: ppyObject),
  Func(
      name: 'PyDict_SetItemString',
      parameterTypes: [ppyObject, cstring, ppyObject],
      returnType: cint),
  Func(
      name: 'PyDict_GetItem',
      parameterTypes: [ppyObject, ppyObject],
      returnType: ppyObject),
  Func(
      name: 'PyDict_SetItem',
      parameterTypes: [ppyObject, ppyObject, ppyObject],
      returnType: cint),
  Func(name: 'PyDict_Keys', parameterTypes: [ppyObject], returnType: ppyObject),
  Func(
      name: 'PyDict_Values',
      parameterTypes: [ppyObject],
      returnType: ppyObject),
  Func(
      name: 'PyDict_Contains',
      parameterTypes: [ppyObject, ppyObject],
      returnType: cint),

  Func(name: 'PyErr_Clear', parameterTypes: [], returnType: cint),
  Func(
      name: 'PyErr_SetString',
      parameterTypes: [ppyObject, cstring],
      returnType: cint),
  Func(name: 'PyErr_Occurred', parameterTypes: [], returnType: ppyObject),

  Func(
      name: 'PyCapsule_New',
      parameterTypes: ['*void', cstring, '*void'],
      returnType: ppyObject),
  Func(
      name: 'PyCapsule_GetPointer',
      parameterTypes: [ppyObject, cstring],
      returnType: '*void'),

  Func(
      name: 'PyImport_ImportModule',
      parameterTypes: [cstring],
      returnType: ppyObject),
  Func(name: 'PyEval_GetBuiltins', parameterTypes: [], returnType: ppyObject),
  Func(name: 'PyEval_GetGlobals', parameterTypes: [], returnType: ppyObject),
  Func(name: 'PyEval_GetLocals', parameterTypes: [], returnType: ppyObject),

  Func(
      name: 'PyUnicode_DecodeFSDefault',
      parameterTypes: [cstring],
      returnType: ppyObject),

  Func(
      name: 'PyCallable_Check',
      parameterTypes: [ppyObject],
      returnType: pySsizeT),
  Func(
      name: 'PyLong_FromLong',
      parameterTypes: ['uint64'],
      returnType: ppyObject),
  Func(
      name: 'PyLong_AsLong', parameterTypes: [ppyObject], returnType: 'uint64'),

  Func(name: 'PyErr_Print', parameterTypes: [], returnType: pySsizeT)
];
