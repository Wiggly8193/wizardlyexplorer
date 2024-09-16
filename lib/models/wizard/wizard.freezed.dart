// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wizard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Wizard _$WizardFromJson(Map<String, dynamic> json) {
  return _Wizard.fromJson(json);
}

/// @nodoc
mixin _$Wizard {
  String get id => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  List<WizardElixir> get elixirs => throw _privateConstructorUsedError;

  /// Serializes this Wizard to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Wizard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WizardCopyWith<Wizard> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WizardCopyWith<$Res> {
  factory $WizardCopyWith(Wizard value, $Res Function(Wizard) then) =
      _$WizardCopyWithImpl<$Res, Wizard>;
  @useResult
  $Res call(
      {String id,
      String firstName,
      String lastName,
      List<WizardElixir> elixirs});
}

/// @nodoc
class _$WizardCopyWithImpl<$Res, $Val extends Wizard>
    implements $WizardCopyWith<$Res> {
  _$WizardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Wizard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? elixirs = null,
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
      elixirs: null == elixirs
          ? _value.elixirs
          : elixirs // ignore: cast_nullable_to_non_nullable
              as List<WizardElixir>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WizardImplCopyWith<$Res> implements $WizardCopyWith<$Res> {
  factory _$$WizardImplCopyWith(
          _$WizardImpl value, $Res Function(_$WizardImpl) then) =
      __$$WizardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String firstName,
      String lastName,
      List<WizardElixir> elixirs});
}

/// @nodoc
class __$$WizardImplCopyWithImpl<$Res>
    extends _$WizardCopyWithImpl<$Res, _$WizardImpl>
    implements _$$WizardImplCopyWith<$Res> {
  __$$WizardImplCopyWithImpl(
      _$WizardImpl _value, $Res Function(_$WizardImpl) _then)
      : super(_value, _then);

  /// Create a copy of Wizard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? elixirs = null,
  }) {
    return _then(_$WizardImpl(
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
      elixirs: null == elixirs
          ? _value._elixirs
          : elixirs // ignore: cast_nullable_to_non_nullable
              as List<WizardElixir>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WizardImpl implements _Wizard {
  const _$WizardImpl(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required final List<WizardElixir> elixirs})
      : _elixirs = elixirs;

  factory _$WizardImpl.fromJson(Map<String, dynamic> json) =>
      _$$WizardImplFromJson(json);

  @override
  final String id;
  @override
  final String firstName;
  @override
  final String lastName;
  final List<WizardElixir> _elixirs;
  @override
  List<WizardElixir> get elixirs {
    if (_elixirs is EqualUnmodifiableListView) return _elixirs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_elixirs);
  }

  @override
  String toString() {
    return 'Wizard(id: $id, firstName: $firstName, lastName: $lastName, elixirs: $elixirs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WizardImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            const DeepCollectionEquality().equals(other._elixirs, _elixirs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, lastName,
      const DeepCollectionEquality().hash(_elixirs));

  /// Create a copy of Wizard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WizardImplCopyWith<_$WizardImpl> get copyWith =>
      __$$WizardImplCopyWithImpl<_$WizardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WizardImplToJson(
      this,
    );
  }
}

abstract class _Wizard implements Wizard {
  const factory _Wizard(
      {required final String id,
      required final String firstName,
      required final String lastName,
      required final List<WizardElixir> elixirs}) = _$WizardImpl;

  factory _Wizard.fromJson(Map<String, dynamic> json) = _$WizardImpl.fromJson;

  @override
  String get id;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  List<WizardElixir> get elixirs;

  /// Create a copy of Wizard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WizardImplCopyWith<_$WizardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
