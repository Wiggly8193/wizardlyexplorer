// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wizard_elixir.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WizardElixir _$WizardElixirFromJson(Map<String, dynamic> json) {
  return _WizardElixir.fromJson(json);
}

/// @nodoc
mixin _$WizardElixir {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this WizardElixir to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WizardElixir
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WizardElixirCopyWith<WizardElixir> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WizardElixirCopyWith<$Res> {
  factory $WizardElixirCopyWith(
          WizardElixir value, $Res Function(WizardElixir) then) =
      _$WizardElixirCopyWithImpl<$Res, WizardElixir>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$WizardElixirCopyWithImpl<$Res, $Val extends WizardElixir>
    implements $WizardElixirCopyWith<$Res> {
  _$WizardElixirCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WizardElixir
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
abstract class _$$WizardElixirImplCopyWith<$Res>
    implements $WizardElixirCopyWith<$Res> {
  factory _$$WizardElixirImplCopyWith(
          _$WizardElixirImpl value, $Res Function(_$WizardElixirImpl) then) =
      __$$WizardElixirImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$WizardElixirImplCopyWithImpl<$Res>
    extends _$WizardElixirCopyWithImpl<$Res, _$WizardElixirImpl>
    implements _$$WizardElixirImplCopyWith<$Res> {
  __$$WizardElixirImplCopyWithImpl(
      _$WizardElixirImpl _value, $Res Function(_$WizardElixirImpl) _then)
      : super(_value, _then);

  /// Create a copy of WizardElixir
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$WizardElixirImpl(
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
class _$WizardElixirImpl implements _WizardElixir {
  const _$WizardElixirImpl({required this.id, required this.name});

  factory _$WizardElixirImpl.fromJson(Map<String, dynamic> json) =>
      _$$WizardElixirImplFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'WizardElixir(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WizardElixirImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of WizardElixir
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WizardElixirImplCopyWith<_$WizardElixirImpl> get copyWith =>
      __$$WizardElixirImplCopyWithImpl<_$WizardElixirImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WizardElixirImplToJson(
      this,
    );
  }
}

abstract class _WizardElixir implements WizardElixir {
  const factory _WizardElixir(
      {required final String id,
      required final String name}) = _$WizardElixirImpl;

  factory _WizardElixir.fromJson(Map<String, dynamic> json) =
      _$WizardElixirImpl.fromJson;

  @override
  String get id;
  @override
  String get name;

  /// Create a copy of WizardElixir
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WizardElixirImplCopyWith<_$WizardElixirImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
