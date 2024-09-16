import 'package:freezed_annotation/freezed_annotation.dart';

part 'trait.freezed.dart';
part 'trait.g.dart';

@freezed
class Trait with _$Trait {
  const factory Trait({
    required String id,
    required String name,
  }) = _Trait;

  factory Trait.fromJson(Map<String, dynamic> json) => _$TraitFromJson(json);
}
