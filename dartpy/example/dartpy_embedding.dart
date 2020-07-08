import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';
import 'package:dartpy/dartpy.dart';

void main(List<String> args) {
  print(args);
  DartPyModule pyModule;
  try {
    pyModule = pyimport(args[0]);
    final pFunc = pyModule.getFunction(args[1]);
    final result = pFunc(args.skip(2).map((a) => int.parse(a)).toList());
    print(result);
  } on DartPyException catch (e) {
    print(e);
    pyCleanup();
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
