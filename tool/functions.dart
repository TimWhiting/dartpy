import 'package:ffi_tool/c.dart';

import 'type_aliases.dart';

// The ordering of this is taken from https://github.com/yglukhov/nimpy/blob/master/nimpy/py_lib.nim
const functions = [
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

  Func(name: 'Py_IncRef', parameterTypes: [ppyObject], returnType: cint),
  Func(name: 'Py_DecRef', parameterTypes: [ppyObject], returnType: cint),
  Func(name: 'Py_Initialize', parameterTypes: [], returnType: pySsizeT),
  Func(
      name: 'PyRun_SimpleString',
      parameterTypes: [cstring],
      returnType: pySsizeT),
  Func(name: 'Py_FinalizeEx', returnType: pySsizeT, parameterTypes: []),
  Func(
      name: 'PyImport_Import',
      parameterTypes: [cstring],
      returnType: ppyObject),
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
