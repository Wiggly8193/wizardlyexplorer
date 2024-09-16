// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spell.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Spell _$SpellFromJson(Map<String, dynamic> json) {
  return _Spell.fromJson(json);
}

/// @nodoc
mixin _$Spell {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get incantation => throw _privateConstructorUsedError;
  String get effect => throw _privateConstructorUsedError;
  bool? get canBeVerbal => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get light => throw _privateConstructorUsedError;
  String? get creator => throw _privateConstructorUsedError;

  /// Serializes this Spell to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Spell
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpellCopyWith<Spell> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpellCopyWith<$Res> {
  factory $SpellCopyWith(Spell value, $Res Function(Spell) then) =
      _$SpellCopyWithImpl<$Res, Spell>;
  @useResult
  $Res call(
      {String id,
      String name,
      String? incantation,
      String effect,
      bool? canBeVerbal,
      String type,
      String light,
      String? creator});
}

/// @nodoc
class _$SpellCopyWithImpl<$Res, $Val extends Spell>
    implements $SpellCopyWith<$Res> {
  _$SpellCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Spell
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? incantation = freezed,
    Object? effect = null,
    Object? canBeVerbal = freezed,
    Object? type = null,
    Object? light = null,
    Object? creator = freezed,
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
      incantation: freezed == incantation
          ? _value.incantation
          : incantation // ignore: cast_nullable_to_non_nullable
              as String?,
      effect: null == effect
          ? _value.effect
          : effect // ignore: cast_nullable_to_non_nullable
              as String,
      canBeVerbal: freezed == canBeVerbal
          ? _value.canBeVerbal
          : canBeVerbal // ignore: cast_nullable_to_non_nullable
              as bool?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      light: null == light
          ? _value.light
          : light // ignore: cast_nullable_to_non_nullable
              as String,
      creator: freezed == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpellImplCopyWith<$Res> implements $SpellCopyWith<$Res> {
  factory _$$SpellImplCopyWith(
          _$SpellImpl value, $Res Function(_$SpellImpl) then) =
      __$$SpellImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? incantation,
      String effect,
      bool? canBeVerbal,
      String type,
      String light,
      String? creator});
}

/// @nodoc
class __$$SpellImplCopyWithImpl<$Res>
    extends _$SpellCopyWithImpl<$Res, _$SpellImpl>
    implements _$$SpellImplCopyWith<$Res> {
  __$$SpellImplCopyWithImpl(
      _$SpellImpl _value, $Res Function(_$SpellImpl) _then)
      : super(_value, _then);

  /// Create a copy of Spell
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? incantation = freezed,
    Object? effect = null,
    Object? canBeVerbal = freezed,
    Object? type = null,
    Object? light = null,
    Object? creator = freezed,
  }) {
    return _then(_$SpellImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      incantation: freezed == incantation
          ? _value.incantation
          : incantation // ignore: cast_nullable_to_non_nullable
              as String?,
      effect: null == effect
          ? _value.effect
          : effect // ignore: cast_nullable_to_non_nullable
              as String,
      canBeVerbal: freezed == canBeVerbal
          ? _value.canBeVerbal
          : canBeVerbal // ignore: cast_nullable_to_non_nullable
              as bool?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      light: null == light
          ? _value.light
          : light // ignore: cast_nullable_to_non_nullable
              as String,
      creator: freezed == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpellImpl implements _Spell {
  const _$SpellImpl(
      {required this.id,
      required this.name,
      this.incantation,
      required this.effect,
      this.canBeVerbal,
      required this.type,
      required this.light,
      this.creator});

  factory _$SpellImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpellImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? incantation;
  @override
  final String effect;
  @override
  final bool? canBeVerbal;
  @override
  final String type;
  @override
  final String light;
  @override
  final String? creator;

  @override
  String toString() {
    return 'Spell(id: $id, name: $name, incantation: $incantation, effect: $effect, canBeVerbal: $canBeVerbal, type: $type, light: $light, creator: $creator)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpellImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.incantation, incantation) ||
                other.incantation == incantation) &&
            (identical(other.effect, effect) || other.effect == effect) &&
            (identical(other.canBeVerbal, canBeVerbal) ||
                other.canBeVerbal == canBeVerbal) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.light, light) || other.light == light) &&
            (identical(other.creator, creator) || other.creator == creator));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, incantation, effect,
      canBeVerbal, type, light, creator);

  /// Create a copy of Spell
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpellImplCopyWith<_$SpellImpl> get copyWith =>
      __$$SpellImplCopyWithImpl<_$SpellImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpellImplToJson(
      this,
    );
  }
}

abstract class _Spell implements Spell {
  const factory _Spell(
      {required final String id,
      required final String name,
      final String? incantation,
      required final String effect,
      final bool? canBeVerbal,
      required final String type,
      required final String light,
      final String? creator}) = _$SpellImpl;

  factory _Spell.fromJson(Map<String, dynamic> json) = _$SpellImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get incantation;
  @override
  String get effect;
  @override
  bool? get canBeVerbal;
  @override
  String get type;
  @override
  String get light;
  @override
  String? get creator;

  /// Create a copy of Spell
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpellImplCopyWith<_$SpellImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
