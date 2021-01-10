import 'package:ffi/ffi.dart';

import 'gen.dart';

import 'dart:ffi' as ffi;
import 'dart:io' as io show Platform;

/// Dynamic library
final dartpyc = DartPyC(
  io.Platform.isLinux
      ? ffi.DynamicLibrary.open('/usr/lib/x86_64-linux-gnu/libpython3.7m.so')
      : io.Platform.isMacOS
          ? ffi.DynamicLibrary.open(
              '/usr/local/Frameworks/Python.framework/Versions/3.8/lib/libpython3.8.dylib')
          : throw UnimplementedError('${io.Platform} not supported'),
);
void main(List<String> args) {
  dartpyc.Py_Initialize();
  final python = '''
from time import time, ctime
print("Today is", ctime(time()))
''';
  final pystring = Utf8.toUtf8(python);
  dartpyc.PyRun_SimpleString(pystring.cast<ffi.Int8>());
  free(pystring);

  print(dartpyc.Py_FinalizeEx());
}
