import 'dart:io';

import 'package:dartpy/dartpy.dart';

void main() {
  // pyLibLocation = '/usr/lib/x86_64-linux-gnu/libpython3.12.so';
  // initializes the python runtime
  pyStart();
  try {
    final pyModule = pyImport('os');
    final pFunc = pyModule.getFunction('getenv');
    final envName = 'HOME';
    final result = pFunc([envName]);
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
