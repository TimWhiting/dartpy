import 'package:freezed_annotation/freezed_annotation.dart';
export 'dart:ffi';
part 'dartpy_annotations.freezed.dart';

class PyFunction {
  final String module;
  final String name;

  const PyFunction({required this.name, required this.module});
}

@freezed
abstract class PyTypeAnnotation with _$PyTypeAnnotation {
  const factory PyTypeAnnotation.pyint() = PyInt;
  const factory PyTypeAnnotation.pydouble() = PyDouble;
  const factory PyTypeAnnotation.pytuple(List<PyTypeAnnotation> elements) =
      PyTuple;
  const factory PyTypeAnnotation.pylist(PyTypeAnnotation listType) = PyList;
  const factory PyTypeAnnotation.pymap(
      PyTypeAnnotation keyType, PyTypeAnnotation valueType) = PyMap;
}
