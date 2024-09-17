import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wizardly_explorer/models/elixirs/elixirs.dart';
import 'package:wizardly_explorer/services/elixirs_api_service.dart';

part 'elixir_provider.g.dart';

@riverpod
Future<List<Elixirs>> getElixirs(GetElixirsRef ref) async {
  return ElixirsApiService().fetchElixirs();
}

@riverpod
Future<Elixirs> getElixirsById(GetElixirsByIdRef ref, String elixirId) async {
  return ElixirsApiService().fetchElixirById(elixirId);
}
