import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/elixirs/elixirs.dart';
import '../utils/api_constants.dart';
import '../utils/toast_handler.dart';

class ElixirsApiService {
  Future<List<Elixirs>> fetchElixirs() async {
    try {
      final response = await http.get(Uri.parse(ApiConstants.kGetElixirs));

      if (response.statusCode == 200) {
        final List<dynamic> elixirList = jsonDecode(response.body);
        return elixirList.map((json) => Elixirs.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load elixirs');
      }
    } catch (exception) {
      ToastHandler().showWizardError(exception.toString());
      throw Exception('Failed to fetch elixirs: ${exception.toString()}');
    }
  }

  Future<Elixirs> fetchElixirById(String elixirId) async {
    try {
      final response =
          await http.get(Uri.parse('${ApiConstants.kGetElixirById}$elixirId'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> elixirJson = jsonDecode(response.body);
        return Elixirs.fromJson(elixirJson);
      } else {
        throw Exception('Failed to load elixir with id $elixirId');
      }
    } catch (exception) {
      ToastHandler().showWizardError(exception.toString());
      throw Exception('Failed to fetch elixir: ${exception.toString()}');
    }
  }
}
