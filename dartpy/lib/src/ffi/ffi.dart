import 'dart:io';

import 'gen.dart';

import 'dart:ffi' as ffi;
export 'gen.dart';
import 'dart:io' as io show Platform;
part 'globals.dart';

/// A variable to override the python dynamic library location on your computer
String? pyLibLocation;
final _pyLib = pyLibLocation != null
    ? ffi.DynamicLibrary.open(pyLibLocation!)
    : io.Platform.isLinux
        ? ffi.DynamicLibrary.open(_findLinux())
        : io.Platform.isMacOS
            ? ffi.DynamicLibrary.open(_findMacos())
            : throw UnimplementedError('${io.Platform} not supported');

String _findLinux() {
  if (File('/usr/lib/x86_64-linux-gnu/libpython3.8.so').existsSync()) {
    return '/usr/lib/x86_64-linux-gnu/libpython3.8.so';
  } else if (File('/usr/lib/x86_64-linux-gnu/libpython3.9.so').existsSync()) {
    return '/usr/lib/x86_64-linux-gnu/libpython3.9.so';
  }
  throw UnimplementedError(
      'Linux python version not found, searched for Python 3.8 and 3.9, set pyLibLocation for custom install location');
}

String _findMacos() {
  if (Directory('/usr/local/Frameworks/Python.framework/Versions/3.8')
      .existsSync()) {
    return '/usr/local/Frameworks/Python.framework/Versions/3.8/lib/libpython3.8.dylib';
  } else if (Directory('/usr/local/Frameworks/Python.framework/Versions/3.9')
      .existsSync()) {
    return '/usr/local/Frameworks/Python.framework/Versions/3.9/lib/libpython3.9.dylib';
  }
  throw UnimplementedError(
      'Macos python version not found, searched for Python 3.8 and 3.9, set pyLibLocation for custom install location');
}

DartPyC? _dartpyc;

/// Dynamic library
DartPyC get dartpyc => _dartpyc ?? (_dartpyc = DartPyC(_pyLib));
