import 'dart:io';

import 'package:dartpy/dartpy.dart';

void main(List<String> args) {
  print(args);
  // initializes the python runtime
  pyStart();
  try {
    // imports a python module
    final pyModule = pyimport(args[0]);
    // gets a function within that module
    final pFunc = pyModule.getFunction(args[1]);
    // calls the function and gets the result
    final result = pFunc(args.skip(2).map((a) => int.parse(a)).toList());
    print(result);
  } on DartPyException catch (e) {
    print(e);
    // Cleans up memory
    pyCleanup();
    exit(1);
  }
  // Cleans up memory
  pyCleanup();
  exit(0);
}
