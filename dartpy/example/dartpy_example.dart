import 'dart:ffi';

import 'package:dartpy/dartpy.dart';
import 'package:ffi/ffi.dart';

void main(List<String> args) {
  dartpyc.Py_Initialize();
  final python = '''
from time import time, ctime
print("Today is", ctime(time()))
''';
  final pystring = python.toNativeUtf8();
  dartpyc.PyRun_SimpleString(pystring.cast<Char>());
  malloc.free(pystring);
  print(dartpyc.Py_FinalizeEx());
}
