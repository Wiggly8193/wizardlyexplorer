// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'head.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Head _$HeadFromJson(Map<String, dynamic> json) {
  return _Head.fromJson(json);
}

/// @nodoc
mixin _$Head {
  String get id => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;

  /// Serializes this Head to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Head
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HeadCopyWith<Head> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HeadCopyWith<$Res> {
  factory $HeadCopyWith(Head value, $Res Function(Head) then) =
      _$HeadCopyWithImpl<$Res, Head>;
  @useResult
  $Res call({String id, String firstName, String lastName});
}

/// @nodoc
class _$HeadCopyWithImpl<$Res, $Val extends Head>
    implements $HeadCopyWith<$Res> {
  _$HeadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Head
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HeadImplCopyWith<$Res> implements $HeadCopyWith<$Res> {
  factory _$$HeadImplCopyWith(
          _$HeadImpl value, $Res Function(_$HeadImpl) then) =
      __$$HeadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String firstName, String lastName});
}

/// @nodoc
class __$$HeadImplCopyWithImpl<$Res>
    extends _$HeadCopyWithImpl<$Res, _$HeadImpl>
    implements _$$HeadImplCopyWith<$Res> {
  __$$HeadImplCopyWithImpl(_$HeadImpl _value, $Res Function(_$HeadImpl) _then)
      : super(_value, _then);

  /// Create a copy of Head
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
  }) {
    return _then(_$HeadImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HeadImpl implements _Head {
  const _$HeadImpl(
      {required this.id, required this.firstName, required this.lastName});

  factory _$HeadImpl.fromJson(Map<String, dynamic> json) =>
      _$$HeadImplFromJson(json);

  @override
  final String id;
  @override
  final String firstName;
  @override
  final String lastName;

  @override
  String toString() {
    return 'Head(id: $id, firstName: $firstName, lastName: $lastName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HeadImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, lastName);

  /// Create a copy of Head
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HeadImplCopyWith<_$HeadImpl> get copyWith =>
      __$$HeadImplCopyWithImpl<_$HeadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HeadImplToJson(
      this,
    );
  }
}

abstract class _Head implements Head {
  const factory _Head(
      {required final String id,
      required final String firstName,
      required final String lastName}) = _$HeadImpl;

  factory _Head.fromJson(Map<String, dynamic> json) = _$HeadImpl.fromJson;

  @override
  String get id;
  @override
  String get firstName;
  @override
  String get lastName;

  /// Create a copy of Head
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HeadImplCopyWith<_$HeadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
