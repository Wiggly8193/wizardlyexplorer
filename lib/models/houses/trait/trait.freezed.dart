// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trait.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Trait _$TraitFromJson(Map<String, dynamic> json) {
  return _Trait.fromJson(json);
}

/// @nodoc
mixin _$Trait {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this Trait to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Trait
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TraitCopyWith<Trait> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TraitCopyWith<$Res> {
  factory $TraitCopyWith(Trait value, $Res Function(Trait) then) =
      _$TraitCopyWithImpl<$Res, Trait>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$TraitCopyWithImpl<$Res, $Val extends Trait>
    implements $TraitCopyWith<$Res> {
  _$TraitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Trait
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TraitImplCopyWith<$Res> implements $TraitCopyWith<$Res> {
  factory _$$TraitImplCopyWith(
          _$TraitImpl value, $Res Function(_$TraitImpl) then) =
      __$$TraitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$TraitImplCopyWithImpl<$Res>
    extends _$TraitCopyWithImpl<$Res, _$TraitImpl>
    implements _$$TraitImplCopyWith<$Res> {
  __$$TraitImplCopyWithImpl(
      _$TraitImpl _value, $Res Function(_$TraitImpl) _then)
      : super(_value, _then);

  /// Create a copy of Trait
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$TraitImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TraitImpl implements _Trait {
  const _$TraitImpl({required this.id, required this.name});

  factory _$TraitImpl.fromJson(Map<String, dynamic> json) =>
      _$$TraitImplFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'Trait(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TraitImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of Trait
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TraitImplCopyWith<_$TraitImpl> get copyWith =>
      __$$TraitImplCopyWithImpl<_$TraitImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TraitImplToJson(
      this,
    );
  }
}

abstract class _Trait implements Trait {
  const factory _Trait({required final String id, required final String name}) =
      _$TraitImpl;

  factory _Trait.fromJson(Map<String, dynamic> json) = _$TraitImpl.fromJson;

  @override
  String get id;
  @override
  String get name;

  /// Create a copy of Trait
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TraitImplCopyWith<_$TraitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
