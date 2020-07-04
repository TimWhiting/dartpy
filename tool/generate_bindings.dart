import 'dart:io';

import 'package:ffi_tool/c.dart';

void main() {
  generateFile(File('lib/src/ffi/generated.dart'), library);
}

final library = const Library.platformAware(
  // Configure, how the dynamic library should be loaded depending on the platform
  dynamicLibraryConfig: DynamicLibraryConfig(
    macOS: DynamicLibraryPlatformConfig.open(
        '/usr/local/Frameworks/Python.framework/Versions/3.7/lib/libpython3.7m.dylib'),
  ),

  elements: [
    Struct(name: 'PyObject', fields: [], documentation: 'PPyObject'),
    Struct(name: 'Py_ssize_t', fields: [], documentation: ''),
    Struct(
        name: 'PyMethodDef',
        fields: [
          // StructField(name: 'ml_name', type: '*char'),
          // StructField(name: 'ml_meth', type: '*void'),
          // StructField(name: 'ml_flags', type: 'uint32'),
          // StructField(name: 'ml_doc', type: '*char'),
        ],
        documentation: ''),
    Func(name: 'Py_Initialize', parameterTypes: [], returnType: 'uint32'),
    Func(
        name: 'PyRun_SimpleString',
        parameterTypes: ['*char'],
        returnType: 'uint32'),
    Func(name: 'Py_FinalizeEx', returnType: 'uint32', parameterTypes: []),
    Func(
        name: 'PyImport_Import',
        parameterTypes: ['*char'],
        returnType: '*void'),
    Func(
        name: 'PyUnicode_DecodeFSDefault',
        parameterTypes: ['*char'],
        returnType: '*void'),
    Func(
        name: 'PyObject_GetAttrString',
        parameterTypes: ['*void', '*char'],
        returnType: '*void'),
    Func(
        name: 'PyCallable_Check',
        parameterTypes: ['*void'],
        returnType: 'uint32'),
    Func(name: 'PyTuple_New', parameterTypes: ['uint32'], returnType: '*void'),
    Func(
        name: 'PyLong_FromLong',
        parameterTypes: ['uint64'],
        returnType: '*void'),
    Func(
        name: 'PyLong_AsLong', parameterTypes: ['*void'], returnType: 'uint64'),
    Func(
        name: 'PyTuple_SetItem',
        parameterTypes: ['*void', 'uint32', '*void'],
        returnType: 'uint32'),
    Func(
        name: 'PyObject_CallObject',
        parameterTypes: ['*void', '*void'],
        returnType: '*void'),
    Func(name: 'PyErr_Print', parameterTypes: [], returnType: 'uint32')
  ],
);
