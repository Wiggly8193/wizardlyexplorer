import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wizardly_explorer/models/spell/spell.dart';
import 'package:wizardly_explorer/services/spells_api_service.dart';

part 'spell_provider.g.dart'; // This will generate the necessary code

@riverpod
Future<List<Spell>> getSpells(GetSpellsRef ref) async {
  return SpellsApiService().fetchSpells();
}

@riverpod
Future<Spell> getSpellById(GetSpellByIdRef ref, String spellId) async {
  return SpellsApiService().fetchSpellById(spellId);
}
