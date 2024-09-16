// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Inventor _$InventorFromJson(Map<String, dynamic> json) {
  return _Inventor.fromJson(json);
}

/// @nodoc
mixin _$Inventor {
  String get id => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;

  /// Serializes this Inventor to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Inventor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InventorCopyWith<Inventor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventorCopyWith<$Res> {
  factory $InventorCopyWith(Inventor value, $Res Function(Inventor) then) =
      _$InventorCopyWithImpl<$Res, Inventor>;
  @useResult
  $Res call({String id, String firstName, String lastName});
}

/// @nodoc
class _$InventorCopyWithImpl<$Res, $Val extends Inventor>
    implements $InventorCopyWith<$Res> {
  _$InventorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Inventor
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
abstract class _$$InventorImplCopyWith<$Res>
    implements $InventorCopyWith<$Res> {
  factory _$$InventorImplCopyWith(
          _$InventorImpl value, $Res Function(_$InventorImpl) then) =
      __$$InventorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String firstName, String lastName});
}

/// @nodoc
class __$$InventorImplCopyWithImpl<$Res>
    extends _$InventorCopyWithImpl<$Res, _$InventorImpl>
    implements _$$InventorImplCopyWith<$Res> {
  __$$InventorImplCopyWithImpl(
      _$InventorImpl _value, $Res Function(_$InventorImpl) _then)
      : super(_value, _then);

  /// Create a copy of Inventor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
  }) {
    return _then(_$InventorImpl(
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
class _$InventorImpl implements _Inventor {
  const _$InventorImpl(
      {required this.id, required this.firstName, required this.lastName});

  factory _$InventorImpl.fromJson(Map<String, dynamic> json) =>
      _$$InventorImplFromJson(json);

  @override
  final String id;
  @override
  final String firstName;
  @override
  final String lastName;

  @override
  String toString() {
    return 'Inventor(id: $id, firstName: $firstName, lastName: $lastName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventorImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, lastName);

  /// Create a copy of Inventor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InventorImplCopyWith<_$InventorImpl> get copyWith =>
      __$$InventorImplCopyWithImpl<_$InventorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InventorImplToJson(
      this,
    );
  }
}

abstract class _Inventor implements Inventor {
  const factory _Inventor(
      {required final String id,
      required final String firstName,
      required final String lastName}) = _$InventorImpl;

  factory _Inventor.fromJson(Map<String, dynamic> json) =
      _$InventorImpl.fromJson;

  @override
  String get id;
  @override
  String get firstName;
  @override
  String get lastName;

  /// Create a copy of Inventor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InventorImplCopyWith<_$InventorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
