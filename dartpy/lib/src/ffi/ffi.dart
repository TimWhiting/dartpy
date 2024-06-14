import 'dart:ffi' as ffi;
import 'dart:io' as io show Platform;
import 'dart:io';

import 'package:args/args.dart';

import 'gen.dart';

export 'gen.dart';

part 'globals.dart';

/// A variable to override the python dynamic library location on your computer
String? pyLibLocation;
final _pyLib = pyLibLocation != null
    ? ffi.DynamicLibrary.open(pyLibLocation!)
    : io.Platform.isLinux
        ? ffi.DynamicLibrary.open(_findLinux())
        : io.Platform.isMacOS
            ? ffi.DynamicLibrary.open(_findMacos())
            : io.Platform.isWindows
                ? ffi.DynamicLibrary.open(_findWindows())
                : ffi.DynamicLibrary.open(
                    pythonDylib()); // throw UnimplementedError('${io.Platform} not supported');

String pythonDylib() {
  final platformSuffix = io.Platform.isWindows
      ? '.dll'
      : io.Platform.isMacOS
          ? '.dylib'
          : '.so';
  final options = ['--ldflags', '--embed'];
  var result = Process.runSync('python3.12-config', options);
  if (result.exitCode != 0) {
    var result = Process.runSync('python3.10-config', options);
    if (result.exitCode != 0) {
      result = Process.runSync('python3.9-config', options);
      if (result.exitCode != 0) {
        result = Process.runSync('python3.8-config', options);
        if (result.exitCode != 0) {
          throw Exception('Failed to get python location');
        }
      }
    }
  }
  final output = result.stdout.toString().trim();
  // TODO: Windows paths can have spaces
  // print(output);
  final parser = ArgParser()
    ..addMultiOption('L', abbr: 'L')
    ..addMultiOption('l', abbr: 'l');
  final results = parser.parse(output.split(' '));
  // print(results);
  for (final dylibDir in (results['L'] as List<String>)) {
    // print('Got dylib dir: $dylibDir');
    final dir = Directory(dylibDir);
    final files = dir
        .listSync()
        .whereType<File>()
        .where((e) => e.uri.pathSegments.last.endsWith(platformSuffix))
        .toList();
    for (final file in files) {
      final fname = file.uri.pathSegments.last;
      if (fname.startsWith('libpython') || fname.startsWith('python')) {
        // print('Opening dynamic library: ${file.path}');
        // ffi.DynamicLibrary.open(file.path);
        return file.path;
      } else {
        // print('Skipping dynamic library: ${file.path}');
      }
    }
  }
  throw Exception('Failed to find python dylib');
}

String _findLinux() {
  if (File('/usr/lib/x86_64-linux-gnu/libpython3.12.so').existsSync()) {
    return '/usr/lib/x86_64-linux-gnu/libpython3.12.so';
  } else if (File('/usr/lib/x86_64-linux-gnu/libpython3.10.so').existsSync()) {
    return '/usr/lib/x86_64-linux-gnu/libpython3.10.so';
  } else if (File('/usr/lib/x86_64-linux-gnu/libpython3.9.so').existsSync()) {
    return '/usr/lib/x86_64-linux-gnu/libpython3.9.so';
  } else if (File('/usr/lib/x86_64-linux-gnu/libpython3.8.so').existsSync()) {
    return '/usr/lib/x86_64-linux-gnu/libpython3.8.so';
  }
  return pythonDylib();
  // throw UnimplementedError(
  //     'Linux python version not found, searched for Python 3.8, 3.9 and 3.10, set pyLibLocation for custom install location');
}

String _findMacos() {
  if (Directory('/usr/local/Frameworks/Python.framework/Versions/3.12')
      .existsSync()) {
    return '/usr/local/Frameworks/Python.framework/Versions/3.12/lib/libpython3.12.dylib';
  } else if (Directory('/usr/local/Frameworks/Python.framework/Versions/3.10')
      .existsSync()) {
    return '/usr/local/Frameworks/Python.framework/Versions/3.10/lib/libpython3.10.dylib';
  } else if (Directory('/usr/local/Frameworks/Python.framework/Versions/3.9')
      .existsSync()) {
    return '/usr/local/Frameworks/Python.framework/Versions/3.9/lib/libpython3.9.dylib';
  } else if (Directory('/usr/local/Frameworks/Python.framework/Versions/3.8')
      .existsSync()) {
    return '/usr/local/Frameworks/Python.framework/Versions/3.8/lib/libpython3.8.dylib';
  }
  return pythonDylib();
  // throw UnimplementedError(
  //     'Macos python version not found, searched for Python 3.8, 3.9, and 3.10, set pyLibLocation for custom install location');
}

String _findWindows() {
  Map env = Platform.environment;
  String username = env['USERNAME'];

  if (Directory(
          'C:\\Users\\$username\\AppData\\Local\\Programs\\Python\\Python312\\python312.dll')
      .existsSync()) {
    return 'C:\\Users\\$username\\AppData\\Local\\Programs\\Python\\Python312\\python312.dll';
  } else if (Directory(
          'C:\\Users\\$username\\AppData\\Local\\Programs\\Python\\Python310\\python310.dll')
      .existsSync()) {
    return 'C:\\Users\\$username\\AppData\\Local\\Programs\\Python\\Python310\\python310.dll';
  } else if (Directory(
          'C:\\Users\\$username\\AppData\\Local\\Programs\\Python\\Python39\\python39.dll')
      .existsSync()) {
    return 'C:\\Users\\$username\\AppData\\Local\\Programs\\Python\\Python39\\python39.dll';
  } else if (Directory(
          'C:\\Users\\$username\\AppData\\Local\\Programs\\Python\\Python38\\python38.dll')
      .existsSync()) {
    return 'C:\\Users\\$username\\AppData\\Local\\Programs\\Python\\Python38\\python38.dll';
  }
  return pythonDylib();
  // throw UnimplementedError(
  //     'Window python version not found, searched for Python 3.8, 3.9, 3.10 set pyLibLocation for custom install location');
}

DartPyC? _dartpyc;

/// Dynamic library
DartPyC get dartpyc => _dartpyc ?? (_dartpyc = DartPyC(_pyLib));
