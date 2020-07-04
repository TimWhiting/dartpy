import 'dart:ffi';
import 'package:ffi_tool/c.dart';

import 'type_aliases.dart';

const pPyObject = 'ffi.Pointer<PyObject>';
const pPyObjectObj = 'ffi.Pointer<PyObjectObj>';
const pPyModuleDef_Base = 'ffi.Pointer<PyModuleDef_Base>';
const pPyModuleDef = 'ffi.Pointer<PyModuleDef>';

const pPyCFunction = 'ffi.Pointer';
const pPyCFunctionWithKeywords = 'ffi.Pointer';

const structs = [
  Struct(name: 'PyObject', fields: []),
  Struct(name: 'PyMethodDef', fields: [
    StructField(name: 'ml_name', type: cstring),
    StructField(name: 'ml_meth', type: pPyCFunctionWithKeywords),
    StructField(name: 'ml_flags', type: cint),
    StructField(name: 'ml_doc', type: cstring),
  ]),
  Struct(name: 'PyMemberDef', fields: [
    StructField(name: 'name', type: cstring),
    StructField(name: 'typ', type: cint),
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
  Struct(name: 'PyObjectObj', fields: [
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
    StructField(name: 'ob_base', type: pPyObjectObj),
    StructField(name: 'm_init', type: ppyObject),
    StructField(name: 'm_index', type: pySsizeT),
    StructField(name: 'm_copy', type: ppyObject),
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
];
