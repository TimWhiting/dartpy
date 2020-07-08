import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';
import 'package:dartpy/dartpy.dart';

void main(List<String> args) {
  print(args);
  PyModule pyModule;
  try {
    pyModule = pyimport(args[0]);
    final pFunc = pyModule.getFunction(args[1]);
    final pValue = pFunc(args.skip(2).map((a) => int.parse(a)).toList());
    if (pValue != nullptr) {
      final result = PyLong_AsLong(pValue);
      print(result);
    } else {
      pyModule.dispose();
      PyErr_Print();
      print('Call failed');
      exit(1);
    }
    pyModule.dispose();
  } on DartPyException catch (e) {
    print(e);
    pyModule?.dispose();
    if (PyErr_Occurred() != nullptr) {
      PyErr_Print();
    }
    print('Failed to load ${args[0]} $e');
    exit(1);
  }
  if (Py_FinalizeEx() < 0) {
    exit(120);
  }
  exit(0);
}
