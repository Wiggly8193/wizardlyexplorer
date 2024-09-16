// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'elixirs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ElixirsImpl _$$ElixirsImplFromJson(Map<String, dynamic> json) =>
    _$ElixirsImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      effect: json['effect'] as String,
      sideEffects: json['sideEffects'] as String,
      characteristics: json['characteristics'] as String,
      time: json['time'] as String,
      difficulty: json['difficulty'] as String,
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      inventors: (json['inventors'] as List<dynamic>)
          .map((e) => Inventor.fromJson(e as Map<String, dynamic>))
          .toList(),
      manufacturer: json['manufacturer'] as String,
    );

Map<String, dynamic> _$$ElixirsImplToJson(_$ElixirsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'effect': instance.effect,
      'sideEffects': instance.sideEffects,
      'characteristics': instance.characteristics,
      'time': instance.time,
      'difficulty': instance.difficulty,
      'ingredients': instance.ingredients,
      'inventors': instance.inventors,
      'manufacturer': instance.manufacturer,
    };
