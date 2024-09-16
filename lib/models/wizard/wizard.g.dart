// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wizard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WizardImpl _$$WizardImplFromJson(Map<String, dynamic> json) => _$WizardImpl(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      elixirs: (json['elixirs'] as List<dynamic>)
          .map((e) => WizardElixir.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WizardImplToJson(_$WizardImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'elixirs': instance.elixirs,
    };
