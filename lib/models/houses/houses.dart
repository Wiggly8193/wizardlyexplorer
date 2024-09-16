import 'package:freezed_annotation/freezed_annotation.dart';

import 'head/head.dart';
import 'trait/trait.dart';

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
