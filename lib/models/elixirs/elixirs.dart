import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/enums.dart';

part 'elixirs.freezed.dart';
part 'elixirs.g.dart'; // For JSON serialization

@Freezed()
class Elixirs with _$Elixirs {
  const factory Elixirs({
    required String id,
    required String name,
    required String? effect,
    required String? sideEffects,
    required String? characteristics,
    required String? time,
    required ElixirDifficulty difficulty,
    required List<Ingredient>? ingredients,
    required List<Inventor>? inventors,
    required String? manufacturer,
  }) = _Elixirs;

  factory Elixirs.fromJson(Map<String, dynamic> json) =>
      _$ElixirsFromJson(json);
}

@Freezed()
class Ingredient with _$Ingredient {
  const factory Ingredient({
    required String id,
    required String? name,
  }) = _Ingredient;

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);
}

@Freezed()
class Inventor with _$Inventor {
  const factory Inventor({
    required String id,
    required String? firstName,
    required String? lastName,
  }) = _Inventor;

  factory Inventor.fromJson(Map<String, dynamic> json) =>
      _$InventorFromJson(json);
}
