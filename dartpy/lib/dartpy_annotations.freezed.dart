// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'dartpy_annotations.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PyTypeAnnotationTearOff {
  const _$PyTypeAnnotationTearOff();

  PyInt pyint() {
    return const PyInt();
  }

  PyDouble pydouble() {
    return const PyDouble();
  }

  PyTuple pytuple(List<PyTypeAnnotation> elements) {
    return PyTuple(
      elements,
    );
  }

  PyList pylist(PyTypeAnnotation listType) {
    return PyList(
      listType,
    );
  }

  PyMap pymap(PyTypeAnnotation keyType, PyTypeAnnotation valueType) {
    return PyMap(
      keyType,
      valueType,
    );
  }
}

/// @nodoc
const $PyTypeAnnotation = _$PyTypeAnnotationTearOff();

/// @nodoc
mixin _$PyTypeAnnotation {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pyint,
    required TResult Function() pydouble,
    required TResult Function(List<PyTypeAnnotation> elements) pytuple,
    required TResult Function(PyTypeAnnotation listType) pylist,
    required TResult Function(
            PyTypeAnnotation keyType, PyTypeAnnotation valueType)
        pymap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pyint,
    TResult Function()? pydouble,
    TResult Function(List<PyTypeAnnotation> elements)? pytuple,
    TResult Function(PyTypeAnnotation listType)? pylist,
    TResult Function(PyTypeAnnotation keyType, PyTypeAnnotation valueType)?
        pymap,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PyInt value) pyint,
    required TResult Function(PyDouble value) pydouble,
    required TResult Function(PyTuple value) pytuple,
    required TResult Function(PyList value) pylist,
    required TResult Function(PyMap value) pymap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PyInt value)? pyint,
    TResult Function(PyDouble value)? pydouble,
    TResult Function(PyTuple value)? pytuple,
    TResult Function(PyList value)? pylist,
    TResult Function(PyMap value)? pymap,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PyTypeAnnotationCopyWith<$Res> {
  factory $PyTypeAnnotationCopyWith(
          PyTypeAnnotation value, $Res Function(PyTypeAnnotation) then) =
      _$PyTypeAnnotationCopyWithImpl<$Res>;
}

/// @nodoc
class _$PyTypeAnnotationCopyWithImpl<$Res>
    implements $PyTypeAnnotationCopyWith<$Res> {
  _$PyTypeAnnotationCopyWithImpl(this._value, this._then);

  final PyTypeAnnotation _value;
  // ignore: unused_field
  final $Res Function(PyTypeAnnotation) _then;
}

/// @nodoc
abstract class $PyIntCopyWith<$Res> {
  factory $PyIntCopyWith(PyInt value, $Res Function(PyInt) then) =
      _$PyIntCopyWithImpl<$Res>;
}

/// @nodoc
class _$PyIntCopyWithImpl<$Res> extends _$PyTypeAnnotationCopyWithImpl<$Res>
    implements $PyIntCopyWith<$Res> {
  _$PyIntCopyWithImpl(PyInt _value, $Res Function(PyInt) _then)
      : super(_value, (v) => _then(v as PyInt));

  @override
  PyInt get _value => super._value as PyInt;
}

/// @nodoc
class _$PyInt implements PyInt {
  const _$PyInt();

  @override
  String toString() {
    return 'PyTypeAnnotation.pyint()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is PyInt);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pyint,
    required TResult Function() pydouble,
    required TResult Function(List<PyTypeAnnotation> elements) pytuple,
    required TResult Function(PyTypeAnnotation listType) pylist,
    required TResult Function(
            PyTypeAnnotation keyType, PyTypeAnnotation valueType)
        pymap,
  }) {
    return pyint();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pyint,
    TResult Function()? pydouble,
    TResult Function(List<PyTypeAnnotation> elements)? pytuple,
    TResult Function(PyTypeAnnotation listType)? pylist,
    TResult Function(PyTypeAnnotation keyType, PyTypeAnnotation valueType)?
        pymap,
    required TResult orElse(),
  }) {
    if (pyint != null) {
      return pyint();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PyInt value) pyint,
    required TResult Function(PyDouble value) pydouble,
    required TResult Function(PyTuple value) pytuple,
    required TResult Function(PyList value) pylist,
    required TResult Function(PyMap value) pymap,
  }) {
    return pyint(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PyInt value)? pyint,
    TResult Function(PyDouble value)? pydouble,
    TResult Function(PyTuple value)? pytuple,
    TResult Function(PyList value)? pylist,
    TResult Function(PyMap value)? pymap,
    required TResult orElse(),
  }) {
    if (pyint != null) {
      return pyint(this);
    }
    return orElse();
  }
}

abstract class PyInt implements PyTypeAnnotation {
  const factory PyInt() = _$PyInt;
}

/// @nodoc
abstract class $PyDoubleCopyWith<$Res> {
  factory $PyDoubleCopyWith(PyDouble value, $Res Function(PyDouble) then) =
      _$PyDoubleCopyWithImpl<$Res>;
}

/// @nodoc
class _$PyDoubleCopyWithImpl<$Res> extends _$PyTypeAnnotationCopyWithImpl<$Res>
    implements $PyDoubleCopyWith<$Res> {
  _$PyDoubleCopyWithImpl(PyDouble _value, $Res Function(PyDouble) _then)
      : super(_value, (v) => _then(v as PyDouble));

  @override
  PyDouble get _value => super._value as PyDouble;
}

/// @nodoc
class _$PyDouble implements PyDouble {
  const _$PyDouble();

  @override
  String toString() {
    return 'PyTypeAnnotation.pydouble()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is PyDouble);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pyint,
    required TResult Function() pydouble,
    required TResult Function(List<PyTypeAnnotation> elements) pytuple,
    required TResult Function(PyTypeAnnotation listType) pylist,
    required TResult Function(
            PyTypeAnnotation keyType, PyTypeAnnotation valueType)
        pymap,
  }) {
    return pydouble();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pyint,
    TResult Function()? pydouble,
    TResult Function(List<PyTypeAnnotation> elements)? pytuple,
    TResult Function(PyTypeAnnotation listType)? pylist,
    TResult Function(PyTypeAnnotation keyType, PyTypeAnnotation valueType)?
        pymap,
    required TResult orElse(),
  }) {
    if (pydouble != null) {
      return pydouble();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PyInt value) pyint,
    required TResult Function(PyDouble value) pydouble,
    required TResult Function(PyTuple value) pytuple,
    required TResult Function(PyList value) pylist,
    required TResult Function(PyMap value) pymap,
  }) {
    return pydouble(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PyInt value)? pyint,
    TResult Function(PyDouble value)? pydouble,
    TResult Function(PyTuple value)? pytuple,
    TResult Function(PyList value)? pylist,
    TResult Function(PyMap value)? pymap,
    required TResult orElse(),
  }) {
    if (pydouble != null) {
      return pydouble(this);
    }
    return orElse();
  }
}

abstract class PyDouble implements PyTypeAnnotation {
  const factory PyDouble() = _$PyDouble;
}

/// @nodoc
abstract class $PyTupleCopyWith<$Res> {
  factory $PyTupleCopyWith(PyTuple value, $Res Function(PyTuple) then) =
      _$PyTupleCopyWithImpl<$Res>;
  $Res call({List<PyTypeAnnotation> elements});
}

/// @nodoc
class _$PyTupleCopyWithImpl<$Res> extends _$PyTypeAnnotationCopyWithImpl<$Res>
    implements $PyTupleCopyWith<$Res> {
  _$PyTupleCopyWithImpl(PyTuple _value, $Res Function(PyTuple) _then)
      : super(_value, (v) => _then(v as PyTuple));

  @override
  PyTuple get _value => super._value as PyTuple;

  @override
  $Res call({
    Object? elements = freezed,
  }) {
    return _then(PyTuple(
      elements == freezed
          ? _value.elements
          : elements as List<PyTypeAnnotation>,
    ));
  }
}

/// @nodoc
class _$PyTuple implements PyTuple {
  const _$PyTuple(this.elements);

  @override
  final List<PyTypeAnnotation> elements;

  @override
  String toString() {
    return 'PyTypeAnnotation.pytuple(elements: $elements)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PyTuple &&
            (identical(other.elements, elements) ||
                const DeepCollectionEquality()
                    .equals(other.elements, elements)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(elements);

  @JsonKey(ignore: true)
  @override
  $PyTupleCopyWith<PyTuple> get copyWith =>
      _$PyTupleCopyWithImpl<PyTuple>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pyint,
    required TResult Function() pydouble,
    required TResult Function(List<PyTypeAnnotation> elements) pytuple,
    required TResult Function(PyTypeAnnotation listType) pylist,
    required TResult Function(
            PyTypeAnnotation keyType, PyTypeAnnotation valueType)
        pymap,
  }) {
    return pytuple(elements);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pyint,
    TResult Function()? pydouble,
    TResult Function(List<PyTypeAnnotation> elements)? pytuple,
    TResult Function(PyTypeAnnotation listType)? pylist,
    TResult Function(PyTypeAnnotation keyType, PyTypeAnnotation valueType)?
        pymap,
    required TResult orElse(),
  }) {
    if (pytuple != null) {
      return pytuple(elements);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PyInt value) pyint,
    required TResult Function(PyDouble value) pydouble,
    required TResult Function(PyTuple value) pytuple,
    required TResult Function(PyList value) pylist,
    required TResult Function(PyMap value) pymap,
  }) {
    return pytuple(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PyInt value)? pyint,
    TResult Function(PyDouble value)? pydouble,
    TResult Function(PyTuple value)? pytuple,
    TResult Function(PyList value)? pylist,
    TResult Function(PyMap value)? pymap,
    required TResult orElse(),
  }) {
    if (pytuple != null) {
      return pytuple(this);
    }
    return orElse();
  }
}

abstract class PyTuple implements PyTypeAnnotation {
  const factory PyTuple(List<PyTypeAnnotation> elements) = _$PyTuple;

  List<PyTypeAnnotation> get elements => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PyTupleCopyWith<PyTuple> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PyListCopyWith<$Res> {
  factory $PyListCopyWith(PyList value, $Res Function(PyList) then) =
      _$PyListCopyWithImpl<$Res>;
  $Res call({PyTypeAnnotation listType});

  $PyTypeAnnotationCopyWith<$Res> get listType;
}

/// @nodoc
class _$PyListCopyWithImpl<$Res> extends _$PyTypeAnnotationCopyWithImpl<$Res>
    implements $PyListCopyWith<$Res> {
  _$PyListCopyWithImpl(PyList _value, $Res Function(PyList) _then)
      : super(_value, (v) => _then(v as PyList));

  @override
  PyList get _value => super._value as PyList;

  @override
  $Res call({
    Object? listType = freezed,
  }) {
    return _then(PyList(
      listType == freezed ? _value.listType : listType as PyTypeAnnotation,
    ));
  }

  @override
  $PyTypeAnnotationCopyWith<$Res> get listType {
    return $PyTypeAnnotationCopyWith<$Res>(_value.listType, (value) {
      return _then(_value.copyWith(listType: value));
    });
  }
}

/// @nodoc
class _$PyList implements PyList {
  const _$PyList(this.listType);

  @override
  final PyTypeAnnotation listType;

  @override
  String toString() {
    return 'PyTypeAnnotation.pylist(listType: $listType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PyList &&
            (identical(other.listType, listType) ||
                const DeepCollectionEquality()
                    .equals(other.listType, listType)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(listType);

  @JsonKey(ignore: true)
  @override
  $PyListCopyWith<PyList> get copyWith =>
      _$PyListCopyWithImpl<PyList>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pyint,
    required TResult Function() pydouble,
    required TResult Function(List<PyTypeAnnotation> elements) pytuple,
    required TResult Function(PyTypeAnnotation listType) pylist,
    required TResult Function(
            PyTypeAnnotation keyType, PyTypeAnnotation valueType)
        pymap,
  }) {
    return pylist(listType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pyint,
    TResult Function()? pydouble,
    TResult Function(List<PyTypeAnnotation> elements)? pytuple,
    TResult Function(PyTypeAnnotation listType)? pylist,
    TResult Function(PyTypeAnnotation keyType, PyTypeAnnotation valueType)?
        pymap,
    required TResult orElse(),
  }) {
    if (pylist != null) {
      return pylist(listType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PyInt value) pyint,
    required TResult Function(PyDouble value) pydouble,
    required TResult Function(PyTuple value) pytuple,
    required TResult Function(PyList value) pylist,
    required TResult Function(PyMap value) pymap,
  }) {
    return pylist(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PyInt value)? pyint,
    TResult Function(PyDouble value)? pydouble,
    TResult Function(PyTuple value)? pytuple,
    TResult Function(PyList value)? pylist,
    TResult Function(PyMap value)? pymap,
    required TResult orElse(),
  }) {
    if (pylist != null) {
      return pylist(this);
    }
    return orElse();
  }
}

abstract class PyList implements PyTypeAnnotation {
  const factory PyList(PyTypeAnnotation listType) = _$PyList;

  PyTypeAnnotation get listType => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PyListCopyWith<PyList> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PyMapCopyWith<$Res> {
  factory $PyMapCopyWith(PyMap value, $Res Function(PyMap) then) =
      _$PyMapCopyWithImpl<$Res>;
  $Res call({PyTypeAnnotation keyType, PyTypeAnnotation valueType});

  $PyTypeAnnotationCopyWith<$Res> get keyType;
  $PyTypeAnnotationCopyWith<$Res> get valueType;
}

/// @nodoc
class _$PyMapCopyWithImpl<$Res> extends _$PyTypeAnnotationCopyWithImpl<$Res>
    implements $PyMapCopyWith<$Res> {
  _$PyMapCopyWithImpl(PyMap _value, $Res Function(PyMap) _then)
      : super(_value, (v) => _then(v as PyMap));

  @override
  PyMap get _value => super._value as PyMap;

  @override
  $Res call({
    Object? keyType = freezed,
    Object? valueType = freezed,
  }) {
    return _then(PyMap(
      keyType == freezed ? _value.keyType : keyType as PyTypeAnnotation,
      valueType == freezed ? _value.valueType : valueType as PyTypeAnnotation,
    ));
  }

  @override
  $PyTypeAnnotationCopyWith<$Res> get keyType {
    return $PyTypeAnnotationCopyWith<$Res>(_value.keyType, (value) {
      return _then(_value.copyWith(keyType: value));
    });
  }

  @override
  $PyTypeAnnotationCopyWith<$Res> get valueType {
    return $PyTypeAnnotationCopyWith<$Res>(_value.valueType, (value) {
      return _then(_value.copyWith(valueType: value));
    });
  }
}

/// @nodoc
class _$PyMap implements PyMap {
  const _$PyMap(this.keyType, this.valueType);

  @override
  final PyTypeAnnotation keyType;
  @override
  final PyTypeAnnotation valueType;

  @override
  String toString() {
    return 'PyTypeAnnotation.pymap(keyType: $keyType, valueType: $valueType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PyMap &&
            (identical(other.keyType, keyType) ||
                const DeepCollectionEquality()
                    .equals(other.keyType, keyType)) &&
            (identical(other.valueType, valueType) ||
                const DeepCollectionEquality()
                    .equals(other.valueType, valueType)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(keyType) ^
      const DeepCollectionEquality().hash(valueType);

  @JsonKey(ignore: true)
  @override
  $PyMapCopyWith<PyMap> get copyWith =>
      _$PyMapCopyWithImpl<PyMap>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pyint,
    required TResult Function() pydouble,
    required TResult Function(List<PyTypeAnnotation> elements) pytuple,
    required TResult Function(PyTypeAnnotation listType) pylist,
    required TResult Function(
            PyTypeAnnotation keyType, PyTypeAnnotation valueType)
        pymap,
  }) {
    return pymap(keyType, valueType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pyint,
    TResult Function()? pydouble,
    TResult Function(List<PyTypeAnnotation> elements)? pytuple,
    TResult Function(PyTypeAnnotation listType)? pylist,
    TResult Function(PyTypeAnnotation keyType, PyTypeAnnotation valueType)?
        pymap,
    required TResult orElse(),
  }) {
    if (pymap != null) {
      return pymap(keyType, valueType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PyInt value) pyint,
    required TResult Function(PyDouble value) pydouble,
    required TResult Function(PyTuple value) pytuple,
    required TResult Function(PyList value) pylist,
    required TResult Function(PyMap value) pymap,
  }) {
    return pymap(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PyInt value)? pyint,
    TResult Function(PyDouble value)? pydouble,
    TResult Function(PyTuple value)? pytuple,
    TResult Function(PyList value)? pylist,
    TResult Function(PyMap value)? pymap,
    required TResult orElse(),
  }) {
    if (pymap != null) {
      return pymap(this);
    }
    return orElse();
  }
}

abstract class PyMap implements PyTypeAnnotation {
  const factory PyMap(PyTypeAnnotation keyType, PyTypeAnnotation valueType) =
      _$PyMap;

  PyTypeAnnotation get keyType => throw _privateConstructorUsedError;
  PyTypeAnnotation get valueType => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PyMapCopyWith<PyMap> get copyWith => throw _privateConstructorUsedError;
}
