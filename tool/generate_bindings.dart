import 'dart:io';

import 'package:ffi_tool/c.dart';

import 'functions.dart';
import 'globals.dart';
import 'structs.dart';

void main() {
  final f = File('lib/src/ffi/generated.dart');
  generateFile(f, library);
  var s = f.readAsStringSync();
  s = s.replaceAll('@ffi.Pointer()', '');
  f.writeAsStringSync(s);
}

const typedefs = ImportedUri('typedefs.dart');
final library = Library.platformAware(
  // Configure, how the dynamic library should be loaded depending on the platform
  dynamicLibraryConfig: DynamicLibraryConfig(
    macOS: DynamicLibraryPlatformConfig.open(
        '/usr/local/Frameworks/Python.framework/Versions/3.7/lib/libpython3.7m.dylib'),
  ),
  importedUris: {typedefs},
  elements: [...structs, ...functions, ...globals],
);
