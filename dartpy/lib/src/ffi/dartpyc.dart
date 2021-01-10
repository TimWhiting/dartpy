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
