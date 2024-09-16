import 'package:freezed_annotation/freezed_annotation.dart';

part 'spell.freezed.dart';
part 'spell.g.dart';

@Freezed()
class Spell with _$Spell {
  const factory Spell({
    required String id,
    required String name,
    String? incantation,
    required String effect,
    bool? canBeVerbal,
    required String type,
    required String light,
    String? creator,
  }) = _Spell;

  factory Spell.fromJson(Map<String, dynamic> json) => _$SpellFromJson(json);
}
