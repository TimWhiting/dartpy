import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';
import 'package:dartpy/dartpy.dart';

void main(List<String> args) {
  print(args);
  Py_Initialize();
  final name = Utf8.toUtf8(args[0]);
  final pName = PyUnicode_DecodeFSDefault(name.cast<Uint8>());
  free(name);
  final pModule = PyImport_Import(pName.cast<Uint8>());
  // print(pName.cast<PyObjectObj>().ref.ob_refcnt);
  Py_DecRef(pName);
  // print(pName.cast<PyObjectObj>().ref.ob_refcnt);
  if (pModule.address != 0) {
    final funcName = Utf8.toUtf8(args[1]);
    final pFunc = PyObject_GetAttrString(pModule, funcName.cast<Uint8>());
    free(funcName);
    if (pFunc.address != 0 && PyCallable_Check(pFunc) != 0) {
      final pArgs = PyTuple_New(args.length - 2);
      for (var i = 0; i < args.length - 2; ++i) {
        final pValue = PyLong_FromLong(int.parse(args[i + 2]));
        if (pValue.address == 0) {
          Py_DecRef(pArgs);
          Py_DecRef(pModule);
          print('Cannot convert arguments');
          exit(1);
        }
        PyTuple_SetItem(pArgs, i, pValue);
      }
      final pValue = PyObject_CallObject(pFunc, pArgs);
      Py_DecRef(pArgs);
      if (pValue.address != 0) {
        final result = PyLong_AsLong(pValue);
        print(result);
      } else {
        Py_DecRef(pFunc);
        Py_DecRef(pModule);
        PyErr_Print();
        print('Call failed');
        exit(1);
      }
    } else {
      if (PyErr_Occurred().address != 0) {
        PyErr_Print();
      }
      print('Cannot find function ${args[1]}');
    }
    Py_DecRef(pFunc);
    Py_DecRef(pModule);
  } else {
    PyErr_Print();
    print('Failed to load ${args[0]}');
    exit(1);
  }
  if (Py_FinalizeEx() < 0) {
    exit(120);
  }
  exit(0);
}
