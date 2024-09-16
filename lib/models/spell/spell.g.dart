// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spell.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SpellImpl _$$SpellImplFromJson(Map<String, dynamic> json) => _$SpellImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      incantation: json['incantation'] as String?,
      effect: json['effect'] as String,
      canBeVerbal: json['canBeVerbal'] as bool?,
      type: json['type'] as String,
      light: json['light'] as String,
      creator: json['creator'] as String?,
    );

Map<String, dynamic> _$$SpellImplToJson(_$SpellImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'incantation': instance.incantation,
      'effect': instance.effect,
      'canBeVerbal': instance.canBeVerbal,
      'type': instance.type,
      'light': instance.light,
      'creator': instance.creator,
    };
