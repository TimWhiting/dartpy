import 'dart:ffi';

import 'package:ffi/ffi.dart';

import '../lib/dartpy.dart';

void main(List<String> args) {
  print(args);
  Py_Initialize();
  final name = Utf8.toUtf8(args[0]);
  final pName = PyUnicode_DecodeFSDefault(name.cast<Uint8>());
  free(name);
  final pModule = PyImport_Import(pName.cast<Uint8>());
  if (pModule.address != 0) {
    final funcName = Utf8.toUtf8(args[1]);
    final pFunc = PyObject_GetAttrString(pModule, funcName.cast<Uint8>());
    if (pFunc.address != 0 && PyCallable_Check(pFunc) != 0) {
      final pArgs = PyTuple_New(args.length - 2);
      for (var i = 0; i < args.length - 2; ++i) {
        final pValue = PyLong_FromLong(int.parse(args[i + 2]));
        PyTuple_SetItem(pArgs, i, pValue);
      }
      final pValue = PyObject_CallObject(pFunc, pArgs);
      final result = PyLong_AsLong(pValue);
      print(result);
    }
  }
  Py_FinalizeEx();
}
