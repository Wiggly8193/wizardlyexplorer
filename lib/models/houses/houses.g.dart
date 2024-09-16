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
