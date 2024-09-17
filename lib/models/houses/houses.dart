import 'package:freezed_annotation/freezed_annotation.dart';

part 'houses.freezed.dart';
part 'houses.g.dart';

@Freezed()
class Houses with _$Houses {
  const factory Houses({
    required String id,
    required String name,
    required String houseColours,
    required String founder,
    required String animal,
    required String element,
    required String ghost,
    required String commonRoom,
    required List<Head> heads,
    required List<Trait> traits,
  }) = _Houses;

  factory Houses.fromJson(Map<String, dynamic> json) => _$HousesFromJson(json);
}

@freezed
class Trait with _$Trait {
  const factory Trait({
    required String id,
    required String name,
  }) = _Trait;

  factory Trait.fromJson(Map<String, dynamic> json) => _$TraitFromJson(json);
}

@Freezed()
class Head with _$Head {
  const factory Head({
    required String id,
    required String firstName,
    required String lastName,
  }) = _Head;

  factory Head.fromJson(Map<String, dynamic> json) => _$HeadFromJson(json);
}
