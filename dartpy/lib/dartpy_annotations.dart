import 'package:freezed_annotation/freezed_annotation.dart';
export 'dart:ffi';
part 'dartpy_annotations.freezed.dart';

/// Annotation for a dart function to automatically create the python bindings
///
/// Work in progress
class PyFunction {
  /// The name of the python module the function is contained within
  final String module;

  /// The name of the python function
  ///
  /// Defaults to the name of the dart function if null
  final String? name;

  const PyFunction({required this.module, this.name});
}

/// Annotation for a dart function to automatically create the python bindings
///
/// Work in progress
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
