import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wizardly_explorer/models/houses/houses.dart';

import '../utils/api_constants.dart';
import '../utils/toast_handler.dart';

class HousesApiService {
  Future<List<Houses>> fetchHouses() async {
    try {
      final response = await http.get(Uri.parse(ApiConstants.kGetHouses));

      if (response.statusCode == 200) {
        final List<dynamic> houseList = jsonDecode(response.body);
        return houseList.map((json) => Houses.fromJson(json)).toList();
      } else {
        ToastHandler().showWizardError(response.body);
        throw Exception('Failed to load houses');
      }
    } catch (exception) {
      ToastHandler().showWizardError(exception.toString());
      throw Exception('Failed to fetch houses: ${exception.toString()}');
    }
  }

  Future<Houses> fetchHouseById(String houseId) async {
    try {
      final response =
          await http.get(Uri.parse('${ApiConstants.kGetHouseById}$houseId'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> houseJson = jsonDecode(response.body);
        return Houses.fromJson(houseJson);
      } else {
        ToastHandler().showWizardError(response.body);
        throw Exception('Failed to load house with id $houseId');
      }
    } catch (exception) {
      ToastHandler().showWizardError(exception.toString());
      throw Exception('Failed to fetch house: ${exception.toString()}');
    }
  }
}
