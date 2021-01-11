import 'gen.dart';

import 'dart:ffi' as ffi;
export 'gen.dart';
import 'dart:io' as io show Platform;
part 'globals.dart';

final _pyLib = io.Platform.isLinux
    ? ffi.DynamicLibrary.open('/usr/lib/x86_64-linux-gnu/libpython3.7m.so')
    : io.Platform.isMacOS
        ? ffi.DynamicLibrary.open(
            '/usr/local/Frameworks/Python.framework/Versions/3.8/lib/libpython3.8.dylib')
        : throw UnimplementedError('${io.Platform} not supported');

/// Dynamic library
final dartpyc = DartPyC(_pyLib);
