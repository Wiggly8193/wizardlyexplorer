import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wizardly_explorer/models/spell/spell.dart';

import '../utils/api_constants.dart';
import '../utils/toast_handler.dart';

class SpellsApiService {
  Future<List<Spell>> fetchSpells() async {
    try {
      final response = await http.get(Uri.parse(ApiConstants.kGetSpells));

      if (response.statusCode == 200) {
        final List<dynamic> houseList = jsonDecode(response.body);
        return houseList.map((json) => Spell.fromJson(json)).toList();
      } else {
        ToastHandler().showWizardError(response.body);
        throw Exception('Failed to load spells');
      }
    } catch (exception) {
      ToastHandler().showWizardError(exception.toString());
      throw Exception('Failed to fetch spells: ${exception.toString()}');
    }
  }

  Future<Spell> fetchSpellById(String spellId) async {
    try {
      final response =
          await http.get(Uri.parse('${ApiConstants.kGetSpellById}$spellId'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> houseJson = jsonDecode(response.body);
        return Spell.fromJson(houseJson);
      } else {
        ToastHandler().showWizardError(response.body);
        throw Exception('Failed to load specific spell');
      }
    } catch (exception) {
      ToastHandler().showWizardError(exception.toString());
      throw Exception('Failed to fetch spell: ${exception.toString()}');
    }
  }
}
