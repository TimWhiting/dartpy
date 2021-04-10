import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

import 'package:build/src/builder/build_step.dart';
import 'package:source_gen/source_gen.dart';
import 'package:dartpy/dartpy_annotations.dart';

class DartpyFunctionGenerator extends GeneratorForAnnotation<PyFunction> {
  @override
  FutureOr<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    final e = element as FunctionElement;
    final eq = e.source.contents.data.indexOf('=>', e.nameOffset);
    final redirectedName = e.source.contents.data
        .substring(eq + 2, e.source.contents.data.indexOf('(', eq))
        .trim();
    final pf = PyFunction(
        name: annotation.read('name').isNull
            ? null
            : annotation.read('name').stringValue,
        module: annotation.read('module').stringValue);
    final funcName = pf.name ?? e.name;

    return '''
${e.documentationComment == null ? '/// Calls the python function ' + funcName : e.documentationComment!.split('\n').map((l) => '/// ' + l).join('\n')}
${e.returnType.getDisplayString(withNullability: true)} $redirectedName(${e.parameters.map((p) => p.getDisplayString(withNullability: true)).join(',')}){${createWrapperFor(e, pf)}}''';
  }

  String createWrapperFor(FunctionElement e, PyFunction func) {
    final parameters = e.parameters;
    final paramConversion = parameters.map((p) => '''
arg = null;
try {
  arg = ${p.name}.${convertParameter(p)};
  dartpyc.PyTuple_SetItem(pArgs, ${parameters.indexOf(p)}, arg);
} on DartPyException catch (e) {
  if (arg != null){
    dartpyc.Py_DecRef(arg);
  }
  dartpyc.Py_DecRef(pArgs);
  throw DartPyException(
      'Failed while converting argument \$arg with error \$e');
}''').join('\n');

    return '''
final pyModule = pyImport('${func.module}');
final pFunc = pyModule.getFunction('${func.name ?? e.name}');
final pArgs = dartpyc.PyTuple_New(${parameters.length});
if (pArgs == nullptr) {
  throw DartPyException('Creating argument tuple failed');
}
Pointer<PyObject>? arg;
$paramConversion
final result = dartpyc.PyObject_CallObject(pFunc.pyFunctionObject, pArgs);
dartpyc.Py_DecRef(pArgs);
return result.${convertReturnType(e.returnType)};''';
  }

  String convertParameter(ParameterElement p) {
    final pType = p.type;
    if (pType.isDartCoreInt) {
      return 'asPyInt';
    }
    if (pType.isDartCoreDouble) {
      return 'asPyFloat';
    }
    if (pType.isDartCoreNum) {
      return 'asPyNum';
    }
    throw UnimplementedError(
        'Converting $pType failed, type is not implemented');
  }

  String convertReturnType(DartType returnType) {
    if (returnType.isVoid) {
      return '';
    }
    if (returnType.isDartCoreInt) {
      return 'asInt';
    }
    if (returnType.isDartCoreDouble) {
      return 'asDouble';
    }
    if (returnType.isDartCoreNum) {
      return 'asNum';
    }
    return 'null';
  }
}
