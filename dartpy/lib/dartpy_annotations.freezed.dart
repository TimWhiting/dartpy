// @dart=2.9
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'dartpy_annotations.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

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

// ignore: unused_element
const $PyTypeAnnotation = _$PyTypeAnnotationTearOff();

mixin _$PyTypeAnnotation {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result pyint(),
    @required Result pydouble(),
    @required Result pytuple(List<PyTypeAnnotation> elements),
    @required Result pylist(PyTypeAnnotation listType),
    @required
        Result pymap(PyTypeAnnotation keyType, PyTypeAnnotation valueType),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result pyint(),
    Result pydouble(),
    Result pytuple(List<PyTypeAnnotation> elements),
    Result pylist(PyTypeAnnotation listType),
    Result pymap(PyTypeAnnotation keyType, PyTypeAnnotation valueType),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result pyint(PyInt value),
    @required Result pydouble(PyDouble value),
    @required Result pytuple(PyTuple value),
    @required Result pylist(PyList value),
    @required Result pymap(PyMap value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result pyint(PyInt value),
    Result pydouble(PyDouble value),
    Result pytuple(PyTuple value),
    Result pylist(PyList value),
    Result pymap(PyMap value),
    @required Result orElse(),
  });
}

abstract class $PyTypeAnnotationCopyWith<$Res> {
  factory $PyTypeAnnotationCopyWith(
          PyTypeAnnotation value, $Res Function(PyTypeAnnotation) then) =
      _$PyTypeAnnotationCopyWithImpl<$Res>;
}

class _$PyTypeAnnotationCopyWithImpl<$Res>
    implements $PyTypeAnnotationCopyWith<$Res> {
  _$PyTypeAnnotationCopyWithImpl(this._value, this._then);

  final PyTypeAnnotation _value;
  // ignore: unused_field
  final $Res Function(PyTypeAnnotation) _then;
}

abstract class $PyIntCopyWith<$Res> {
  factory $PyIntCopyWith(PyInt value, $Res Function(PyInt) then) =
      _$PyIntCopyWithImpl<$Res>;
}

class _$PyIntCopyWithImpl<$Res> extends _$PyTypeAnnotationCopyWithImpl<$Res>
    implements $PyIntCopyWith<$Res> {
  _$PyIntCopyWithImpl(PyInt _value, $Res Function(PyInt) _then)
      : super(_value, (v) => _then(v as PyInt));

  @override
  PyInt get _value => super._value as PyInt;
}

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
  Result when<Result extends Object>({
    @required Result pyint(),
    @required Result pydouble(),
    @required Result pytuple(List<PyTypeAnnotation> elements),
    @required Result pylist(PyTypeAnnotation listType),
    @required
        Result pymap(PyTypeAnnotation keyType, PyTypeAnnotation valueType),
  }) {
    assert(pyint != null);
    assert(pydouble != null);
    assert(pytuple != null);
    assert(pylist != null);
    assert(pymap != null);
    return pyint();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result pyint(),
    Result pydouble(),
    Result pytuple(List<PyTypeAnnotation> elements),
    Result pylist(PyTypeAnnotation listType),
    Result pymap(PyTypeAnnotation keyType, PyTypeAnnotation valueType),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (pyint != null) {
      return pyint();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result pyint(PyInt value),
    @required Result pydouble(PyDouble value),
    @required Result pytuple(PyTuple value),
    @required Result pylist(PyList value),
    @required Result pymap(PyMap value),
  }) {
    assert(pyint != null);
    assert(pydouble != null);
    assert(pytuple != null);
    assert(pylist != null);
    assert(pymap != null);
    return pyint(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result pyint(PyInt value),
    Result pydouble(PyDouble value),
    Result pytuple(PyTuple value),
    Result pylist(PyList value),
    Result pymap(PyMap value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (pyint != null) {
      return pyint(this);
    }
    return orElse();
  }
}

abstract class PyInt implements PyTypeAnnotation {
  const factory PyInt() = _$PyInt;
}

abstract class $PyDoubleCopyWith<$Res> {
  factory $PyDoubleCopyWith(PyDouble value, $Res Function(PyDouble) then) =
      _$PyDoubleCopyWithImpl<$Res>;
}

class _$PyDoubleCopyWithImpl<$Res> extends _$PyTypeAnnotationCopyWithImpl<$Res>
    implements $PyDoubleCopyWith<$Res> {
  _$PyDoubleCopyWithImpl(PyDouble _value, $Res Function(PyDouble) _then)
      : super(_value, (v) => _then(v as PyDouble));

  @override
  PyDouble get _value => super._value as PyDouble;
}

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
  Result when<Result extends Object>({
    @required Result pyint(),
    @required Result pydouble(),
    @required Result pytuple(List<PyTypeAnnotation> elements),
    @required Result pylist(PyTypeAnnotation listType),
    @required
        Result pymap(PyTypeAnnotation keyType, PyTypeAnnotation valueType),
  }) {
    assert(pyint != null);
    assert(pydouble != null);
    assert(pytuple != null);
    assert(pylist != null);
    assert(pymap != null);
    return pydouble();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result pyint(),
    Result pydouble(),
    Result pytuple(List<PyTypeAnnotation> elements),
    Result pylist(PyTypeAnnotation listType),
    Result pymap(PyTypeAnnotation keyType, PyTypeAnnotation valueType),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (pydouble != null) {
      return pydouble();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result pyint(PyInt value),
    @required Result pydouble(PyDouble value),
    @required Result pytuple(PyTuple value),
    @required Result pylist(PyList value),
    @required Result pymap(PyMap value),
  }) {
    assert(pyint != null);
    assert(pydouble != null);
    assert(pytuple != null);
    assert(pylist != null);
    assert(pymap != null);
    return pydouble(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result pyint(PyInt value),
    Result pydouble(PyDouble value),
    Result pytuple(PyTuple value),
    Result pylist(PyList value),
    Result pymap(PyMap value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (pydouble != null) {
      return pydouble(this);
    }
    return orElse();
  }
}

abstract class PyDouble implements PyTypeAnnotation {
  const factory PyDouble() = _$PyDouble;
}

abstract class $PyTupleCopyWith<$Res> {
  factory $PyTupleCopyWith(PyTuple value, $Res Function(PyTuple) then) =
      _$PyTupleCopyWithImpl<$Res>;
  $Res call({List<PyTypeAnnotation> elements});
}

class _$PyTupleCopyWithImpl<$Res> extends _$PyTypeAnnotationCopyWithImpl<$Res>
    implements $PyTupleCopyWith<$Res> {
  _$PyTupleCopyWithImpl(PyTuple _value, $Res Function(PyTuple) _then)
      : super(_value, (v) => _then(v as PyTuple));

  @override
  PyTuple get _value => super._value as PyTuple;

  @override
  $Res call({
    Object elements = freezed,
  }) {
    return _then(PyTuple(
      elements == freezed
          ? _value.elements
          : elements as List<PyTypeAnnotation>,
    ));
  }
}

class _$PyTuple implements PyTuple {
  const _$PyTuple(this.elements) : assert(elements != null);

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

  @override
  $PyTupleCopyWith<PyTuple> get copyWith =>
      _$PyTupleCopyWithImpl<PyTuple>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result pyint(),
    @required Result pydouble(),
    @required Result pytuple(List<PyTypeAnnotation> elements),
    @required Result pylist(PyTypeAnnotation listType),
    @required
        Result pymap(PyTypeAnnotation keyType, PyTypeAnnotation valueType),
  }) {
    assert(pyint != null);
    assert(pydouble != null);
    assert(pytuple != null);
    assert(pylist != null);
    assert(pymap != null);
    return pytuple(elements);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result pyint(),
    Result pydouble(),
    Result pytuple(List<PyTypeAnnotation> elements),
    Result pylist(PyTypeAnnotation listType),
    Result pymap(PyTypeAnnotation keyType, PyTypeAnnotation valueType),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (pytuple != null) {
      return pytuple(elements);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result pyint(PyInt value),
    @required Result pydouble(PyDouble value),
    @required Result pytuple(PyTuple value),
    @required Result pylist(PyList value),
    @required Result pymap(PyMap value),
  }) {
    assert(pyint != null);
    assert(pydouble != null);
    assert(pytuple != null);
    assert(pylist != null);
    assert(pymap != null);
    return pytuple(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result pyint(PyInt value),
    Result pydouble(PyDouble value),
    Result pytuple(PyTuple value),
    Result pylist(PyList value),
    Result pymap(PyMap value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (pytuple != null) {
      return pytuple(this);
    }
    return orElse();
  }
}

abstract class PyTuple implements PyTypeAnnotation {
  const factory PyTuple(List<PyTypeAnnotation> elements) = _$PyTuple;

  List<PyTypeAnnotation> get elements;
  $PyTupleCopyWith<PyTuple> get copyWith;
}

abstract class $PyListCopyWith<$Res> {
  factory $PyListCopyWith(PyList value, $Res Function(PyList) then) =
      _$PyListCopyWithImpl<$Res>;
  $Res call({PyTypeAnnotation listType});
}

class _$PyListCopyWithImpl<$Res> extends _$PyTypeAnnotationCopyWithImpl<$Res>
    implements $PyListCopyWith<$Res> {
  _$PyListCopyWithImpl(PyList _value, $Res Function(PyList) _then)
      : super(_value, (v) => _then(v as PyList));

  @override
  PyList get _value => super._value as PyList;

  @override
  $Res call({
    Object listType = freezed,
  }) {
    return _then(PyList(
      listType == freezed ? _value.listType : listType as PyTypeAnnotation,
    ));
  }
}

class _$PyList implements PyList {
  const _$PyList(this.listType) : assert(listType != null);

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

  @override
  $PyListCopyWith<PyList> get copyWith =>
      _$PyListCopyWithImpl<PyList>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result pyint(),
    @required Result pydouble(),
    @required Result pytuple(List<PyTypeAnnotation> elements),
    @required Result pylist(PyTypeAnnotation listType),
    @required
        Result pymap(PyTypeAnnotation keyType, PyTypeAnnotation valueType),
  }) {
    assert(pyint != null);
    assert(pydouble != null);
    assert(pytuple != null);
    assert(pylist != null);
    assert(pymap != null);
    return pylist(listType);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result pyint(),
    Result pydouble(),
    Result pytuple(List<PyTypeAnnotation> elements),
    Result pylist(PyTypeAnnotation listType),
    Result pymap(PyTypeAnnotation keyType, PyTypeAnnotation valueType),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (pylist != null) {
      return pylist(listType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result pyint(PyInt value),
    @required Result pydouble(PyDouble value),
    @required Result pytuple(PyTuple value),
    @required Result pylist(PyList value),
    @required Result pymap(PyMap value),
  }) {
    assert(pyint != null);
    assert(pydouble != null);
    assert(pytuple != null);
    assert(pylist != null);
    assert(pymap != null);
    return pylist(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result pyint(PyInt value),
    Result pydouble(PyDouble value),
    Result pytuple(PyTuple value),
    Result pylist(PyList value),
    Result pymap(PyMap value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (pylist != null) {
      return pylist(this);
    }
    return orElse();
  }
}

abstract class PyList implements PyTypeAnnotation {
  const factory PyList(PyTypeAnnotation listType) = _$PyList;

  PyTypeAnnotation get listType;
  $PyListCopyWith<PyList> get copyWith;
}

abstract class $PyMapCopyWith<$Res> {
  factory $PyMapCopyWith(PyMap value, $Res Function(PyMap) then) =
      _$PyMapCopyWithImpl<$Res>;
  $Res call({PyTypeAnnotation keyType, PyTypeAnnotation valueType});
}

class _$PyMapCopyWithImpl<$Res> extends _$PyTypeAnnotationCopyWithImpl<$Res>
    implements $PyMapCopyWith<$Res> {
  _$PyMapCopyWithImpl(PyMap _value, $Res Function(PyMap) _then)
      : super(_value, (v) => _then(v as PyMap));

  @override
  PyMap get _value => super._value as PyMap;

  @override
  $Res call({
    Object keyType = freezed,
    Object valueType = freezed,
  }) {
    return _then(PyMap(
      keyType == freezed ? _value.keyType : keyType as PyTypeAnnotation,
      valueType == freezed ? _value.valueType : valueType as PyTypeAnnotation,
    ));
  }
}

class _$PyMap implements PyMap {
  const _$PyMap(this.keyType, this.valueType)
      : assert(keyType != null),
        assert(valueType != null);

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

  @override
  $PyMapCopyWith<PyMap> get copyWith =>
      _$PyMapCopyWithImpl<PyMap>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result pyint(),
    @required Result pydouble(),
    @required Result pytuple(List<PyTypeAnnotation> elements),
    @required Result pylist(PyTypeAnnotation listType),
    @required
        Result pymap(PyTypeAnnotation keyType, PyTypeAnnotation valueType),
  }) {
    assert(pyint != null);
    assert(pydouble != null);
    assert(pytuple != null);
    assert(pylist != null);
    assert(pymap != null);
    return pymap(keyType, valueType);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result pyint(),
    Result pydouble(),
    Result pytuple(List<PyTypeAnnotation> elements),
    Result pylist(PyTypeAnnotation listType),
    Result pymap(PyTypeAnnotation keyType, PyTypeAnnotation valueType),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (pymap != null) {
      return pymap(keyType, valueType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result pyint(PyInt value),
    @required Result pydouble(PyDouble value),
    @required Result pytuple(PyTuple value),
    @required Result pylist(PyList value),
    @required Result pymap(PyMap value),
  }) {
    assert(pyint != null);
    assert(pydouble != null);
    assert(pytuple != null);
    assert(pylist != null);
    assert(pymap != null);
    return pymap(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result pyint(PyInt value),
    Result pydouble(PyDouble value),
    Result pytuple(PyTuple value),
    Result pylist(PyList value),
    Result pymap(PyMap value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (pymap != null) {
      return pymap(this);
    }
    return orElse();
  }
}

abstract class PyMap implements PyTypeAnnotation {
  const factory PyMap(PyTypeAnnotation keyType, PyTypeAnnotation valueType) =
      _$PyMap;

  PyTypeAnnotation get keyType;
  PyTypeAnnotation get valueType;
  $PyMapCopyWith<PyMap> get copyWith;
}
