import 'dart:ffi';

import 'package:dartpy/dartpy.dart';
import 'package:ffi/ffi.dart';

void main() {
  Py_Initialize();
  final python = '''
from time import time, ctime
print("Today is", ctime(time()))
''';
  final pystring = Utf8.toUtf8(python);
  PyRun_SimpleString(pystring.cast<Uint8>());
  free(pystring);
  print(Py_FinalizeEx());
}
