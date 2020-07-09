import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:gen_dartpy/src/dartpy_function.dart';

Builder dartpyFunction(BuilderOptions options) =>
    SharedPartBuilder([DartpyFunctionGenerator()], 'dartpy_function');
