import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';

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

    print(e);
    return '''
${e.documentationComment == null ? '/// Calls the python function ' + funcName : e.documentationComment.split('\n').map((l) => '/// ' + l).join('\n')}
${e.returnType} ${redirectedName}(${e.parameters.map((p) => p.getDisplayString(withNullability: false)).join(',')}){${createWrapperFor(e, pf)}}''';
  }

  String createWrapperFor(FunctionElement e, PyFunction func) {
    final parameters = e.parameters;
    final paramConversion = parameters.map((p) => '''
try {
  arg = ${convertParameter(p)}(${p.name});
  PyTuple_SetItem(pArgs, ${parameters.indexOf(p)}, arg);
} on DartPyException catch (e) {
  Py_DecRef(arg);
  Py_DecRef(pArgs);
  throw DartPyException(
      'Failed while converting argument \${arg} with error \$e');
}''').join('\n');

    return '''
final pyModule = pyimport('${func.module}');
final pFunc = pyModule.getFunction('${func.name ?? e.name}');
final pArgs = PyTuple_New(${parameters.length});
if (pArgs == nullptr) {
  throw DartPyException('Creating argument tuple failed');
}
Pointer<PyObject> arg;
$paramConversion
final result = PyObject_CallObject(pFunc.pyFunctionObject, pArgs);
Py_DecRef(pArgs);
return ${convertReturnType(e.returnType)};''';
  }

  String convertParameter(ParameterElement p) {
    final pType = p.type;
    if (pType.isDartCoreInt) {
      return 'pyConvertInt';
    }
    if (pType.isDartCoreDouble) {
      return 'pyConvertDouble';
    }
    if (pType.isDartCoreNum) {
      return 'pyConvertNum';
    }
  }

  String convertReturnType(DartType returnType) {
    if (returnType.isVoid) {
      return '';
    }
    if (returnType.isDartCoreInt) {
      return 'pyConvertBackInt(result)';
    }
    if (returnType.isDartCoreDouble) {
      return 'pyConvertBackDouble(result)';
    }
    if (returnType.isDartCoreNum) {
      return 'pyConvertBackNum(result)';
    }
    return 'null';
  }
}
