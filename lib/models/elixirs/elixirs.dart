import 'package:freezed_annotation/freezed_annotation.dart';

import 'ingredient/ingredient.dart';
import 'inventor/inventor.dart';

part 'elixirs.freezed.dart';
part 'elixirs.g.dart';

@Freezed()
class Elixirs with _$Elixirs {
  const factory Elixirs({
    required String id,
    required String name,
    required String effect,
    required String sideEffects,
    required String characteristics,
    required String time,
    required String difficulty,
    required List<Ingredient> ingredients,
    required List<Inventor> inventors,
    required String manufacturer,
  }) = _Elixirs;

  factory Elixirs.fromJson(Map<String, dynamic> json) =>
      _$ElixirsFromJson(json);
}
