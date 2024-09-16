import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wizardly_explorer/services/houses_api_service.dart';

import '../../models/houses/houses.dart';

part 'house_provider.g.dart';

@riverpod
Future<List<Houses>> getHouses(GetHousesRef ref) async {
  return HousesApiService().fetchHouses();
}

@riverpod
Future<Houses> getHousesById(GetHousesByIdRef ref, String houseId) async {
  return HousesApiService().fetchHouseById(houseId);
}
