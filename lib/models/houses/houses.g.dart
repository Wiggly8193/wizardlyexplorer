// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'houses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HousesImpl _$$HousesImplFromJson(Map<String, dynamic> json) => _$HousesImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      houseColours: json['houseColours'] as String,
      founder: json['founder'] as String,
      animal: json['animal'] as String,
      element: json['element'] as String,
      ghost: json['ghost'] as String,
      commonRoom: json['commonRoom'] as String,
      heads: (json['heads'] as List<dynamic>)
          .map((e) => Head.fromJson(e as Map<String, dynamic>))
          .toList(),
      traits: (json['traits'] as List<dynamic>)
          .map((e) => Trait.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$HousesImplToJson(_$HousesImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'houseColours': instance.houseColours,
      'founder': instance.founder,
      'animal': instance.animal,
      'element': instance.element,
      'ghost': instance.ghost,
      'commonRoom': instance.commonRoom,
      'heads': instance.heads,
      'traits': instance.traits,
    };

_$TraitImpl _$$TraitImplFromJson(Map<String, dynamic> json) => _$TraitImpl(
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$TraitImplToJson(_$TraitImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$HeadImpl _$$HeadImplFromJson(Map<String, dynamic> json) => _$HeadImpl(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
    );

Map<String, dynamic> _$$HeadImplToJson(_$HeadImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
