import 'dart:ffi';
import 'package:ffi_tool/c.dart';

import 'type_aliases.dart';

const pPyObject = 'ffi.Pointer<PyObject>';
const pPyModuleDef_Base = 'ffi.Pointer<PyModuleDef_Base>';
const pPyModuleDef = 'ffi.Pointer<PyModuleDef>';
const pPyCompilerFlags = 'ffi.Pointer<PyCompilerFlags>';
const pPyCFunction = 'ffi.Pointer';
const pPyCFunctionWithKeywords = 'ffi.Pointer';
const pyTypeObject = 'PyTypeObject';
const pPyTypeObject = 'ffi.Pointer<PyTypeObject>';

const structs = [
  //https://docs.python.org/3/c-api/veryhigh.html#c.PyCompilerFlags
  Struct(
    name: 'PyCompilerFlags',
    fields: [
      StructField(name: 'cf_flags', type: cint),
      StructField(name: 'cf_feature_version', type: cint),
    ],
    documentation: '''
This is the structure used to hold compiler flags. In cases where code is only being compiled, it is passed as int flags, and in cases where code is being executed, it is passed as PyCompilerFlags *flags. In this case, from __future__ import can modify flags.
Whenever PyCompilerFlags *flags is NULL, cf_flags is treated as equal to 0, and any modification due to from __future__ import is discarded.''',
  ),
  Struct(name: 'PyMethodDef', fields: [
    StructField(name: 'ml_name', type: cstring),
    StructField(name: 'ml_meth', type: pPyCFunctionWithKeywords),
    StructField(name: 'ml_flags', type: cint),
    StructField(name: 'ml_doc', type: cstring),
  ]),
  Struct(name: 'PyMemberDef', fields: [
    StructField(name: 'name', type: cstring),
    StructField(name: 'type', type: cint),
    StructField(name: 'offset', type: pySsizeT),
    StructField(name: 'flags', type: cint),
    StructField(name: 'doc', type: cstring)
  ]),
  Struct(name: 'PyModuleDef_Slot', fields: [
    StructField(name: 'slot', type: cint),
    StructField(name: 'value', type: cpointer)
  ]),
  Struct(name: 'PyObject_HEAD_EXTRA', fields: [
    StructField(name: 'ob_next', type: cpointer),
    StructField(name: 'ob_prev', type: cpointer),
  ]),
  Struct(name: 'PyObject', fields: [
    StructField(name: 'ob_refcnt', type: pySsizeT),
    StructField(name: 'ob_type', type: cpointer),
  ]),
  Struct(name: 'PyObjectVarHeadObj', fields: [
    // PyObjectObj
    StructField(name: 'ob_refcnt', type: pySsizeT),
    StructField(name: 'ob_type', type: cpointer),
    // PyObjectVarHeadObj
    StructField(name: 'ob_size', type: pySsizeT),
  ]),
  Struct(name: 'PyModuleDef_Base', fields: [
    StructField(name: 'ob_base', type: pPyObject),
    StructField(name: 'm_init', type: pPyObject),
    StructField(name: 'm_index', type: pySsizeT),
    StructField(name: 'm_copy', type: pPyObject),
  ]),
  Struct(name: 'PyModuleDef', fields: [
    StructField(name: 'm_base', type: pPyModuleDef_Base),
    StructField(name: 'm_name', type: cstring),
    StructField(name: 'm_doc', type: cstring),
    StructField(name: 'm_size', type: pySsizeT),
    StructField(name: 'm_methods', type: 'ffi.Pointer<$pPyModuleDef>'),
    StructField(name: 'm_slots', type: 'ffi.Pointer'),
    StructField(name: 'm_traverse', type: cpointer),
    StructField(name: 'm_clear', type: cpointer),
    StructField(name: 'm_free', type: cpointer),
  ]),
  //TODO: TypeObjects and buffers
  Struct(name: 'PyTypeObject', fields: [
    // PyObjectObj
    StructField(name: 'ob_refcnt', type: pySsizeT),
    StructField(name: 'ob_type', type: cpointer),
    // PyObjectVarHeadObj
    StructField(name: 'ob_size', type: pySsizeT),
    // PyTypeObject3Obj
    StructField(name: 'tp_name', type: cstring),
    StructField(name: 'tp_basicsize', type: pySsizeT),
    StructField(name: 'tp_itemsize', type: pySsizeT),
    StructField(name: 'tp_dealloc', type: DeallocFunc),
    StructField(name: 'tp_print', type: cpointer),
    StructField(name: 'tp_getattr', type: cpointer),
    StructField(name: 'tp_setattr', type: cpointer),
    StructField(name: 'tp_as_async', type: cpointer),
    StructField(name: 'tp_repr', type: cpointer),
    StructField(name: 'tp_as_number', type: cpointer),
    StructField(name: 'tp_as_sequence', type: cpointer),
    StructField(name: 'tp_as_mapping', type: cpointer),
    StructField(name: 'tp_hash', type: cpointer),
    StructField(name: 'tp_call', type: cpointer),
    StructField(name: 'tp_str', type: cpointer),
    StructField(name: 'tp_getattro', type: cpointer),
    StructField(name: 'tp_setattro', type: cpointer),
    StructField(name: 'tp_as_buffer', type: cpointer),
    StructField(name: 'tp_flags', type: culong),
    StructField(name: 'tp_doc', type: cstring),
    StructField(name: 'tp_clear', type: cpointer),
    StructField(name: 'tp_richcompare', type: cpointer),
    StructField(name: 'tp_weaklistoffset', type: pySsizeT),
    StructField(name: 'tp_iter', type: cpointer),
    StructField(name: 'tp_iternext', type: cpointer),
    StructField(name: 'tp_methods', type: cpointer),
    StructField(name: 'tp_members', type: cpointer),
    StructField(name: 'tp_getset', type: cpointer),
    StructField(name: 'tp_vase', type: pPyTypeObject),
    StructField(name: 'tp_dict', type: pPyObject),
    StructField(name: 'tp_descr_get', type: cpointer),
    StructField(name: 'tp_descr_set', type: cpointer),
    StructField(name: 'tp_dictoffset', type: pySsizeT),
    StructField(name: 'tp_init', type: cpointer),
    StructField(name: 'tp_alloc', type: cpointer),
    StructField(name: 'tp_new', type: cpointer),
    StructField(name: 'tp_free', type: cpointer),
    StructField(name: 'tp_is_gc', type: cpointer),
    StructField(name: 'tp_bases', type: pPyObject),
    StructField(name: 'tp_mro', type: pPyObject),
    StructField(name: 'tp_cache', type: pPyObject),
    StructField(name: 'tp_subclasses', type: pPyObject),
    StructField(name: 'tp_weaklist', type: pPyObject),
    StructField(name: 'tp_del', type: cpointer),
    StructField(name: 'tp_version_tag', type: cuint),
    StructField(name: 'tp_finalize', type: cpointer),
  ]),
];

const DeallocFunc =
    'ffi.Pointer<ffi.NativeFunction<ffi.Uint32 Function(ffi.Pointer<PyObject>)>>';
