import 'gen.dart';

import 'dart:ffi' as ffi;
export 'gen.dart';
import 'dart:io' as io show Platform;
part 'globals.dart';

String? pyLibLocation;
final _pyLib = pyLibLocation != null
    ? ffi.DynamicLibrary.open(pyLibLocation!)
    : io.Platform.isLinux
        ? ffi.DynamicLibrary.open('/usr/lib/x86_64-linux-gnu/libpython3.8.so')
        : io.Platform.isMacOS
            ? ffi.DynamicLibrary.open(
                '/usr/local/Frameworks/Python.framework/Versions/3.8/lib/libpython3.8.dylib')
            : throw UnimplementedError('${io.Platform} not supported');

DartPyC? _dartpyc;

/// Dynamic library
DartPyC get dartpyc => _dartpyc ?? (_dartpyc = DartPyC(_pyLib));
