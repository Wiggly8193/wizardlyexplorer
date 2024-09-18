import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:wizardly_explorer/models/spell/spell.dart';
import 'package:wizardly_explorer/services/spells_api_service.dart';
import 'package:wizardly_explorer/utils/api_constants.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late SpellsApiService spellsApiService;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    spellsApiService = SpellsApiService();
  });

  group('SpellsApiService', () {
    final spellJson = {
      "id": "fbd3cb46-c174-4843-a07e-fd83545dce58",
      "name": "Opening Charm",
      "incantation": "Aberto",
      "effect": "Opens doors",
      "canBeVerbal": true,
      "type": "Charm",
      "light": "Blue",
      "creator": null
    };

    final spell = Spell.fromJson(spellJson);

    group('fetchSpells', () {
      test('returns a list of spells when the http call completes successfully',
          () async {
        // Arrange
        final List<dynamic> mockResponseData = [
          spellJson,
          spellJson,
          spellJson
        ]; // Simulate multiple spells
        when(() => mockHttpClient.get(Uri.parse(ApiConstants.kGetSpells)))
            .thenAnswer(
                (_) async => http.Response(jsonEncode(mockResponseData), 200));

        // Act
        final result = await spellsApiService.fetchSpells();

        // Assert
        expect(result, isA<List<Spell>>());
        expect(
            result.length,
            mockResponseData
                .length); // Adjust to match the length of the mock response
        expect(result.first, spell); // Optionally, check the first spell
      });

      test('throws an exception when the http call fails', () async {
        // Arrange
        when(() => mockHttpClient.get(Uri.parse(ApiConstants.kGetSpells)))
            .thenAnswer((_) async => http.Response('Not Found', 404));

        // Act & Assert
        expect(
            () async => await spellsApiService.fetchSpells(), throwsException);
      });
    });

    group('fetchSpellById', () {
      test('returns a specific spell when the http call completes successfully',
          () async {
        // Arrange
        const String spellId = "fbd3cb46-c174-4843-a07e-fd83545dce58";
        when(() => mockHttpClient
                .get(Uri.parse('${ApiConstants.kGetSpellById}$spellId')))
            .thenAnswer((_) async => http.Response(jsonEncode(spellJson), 200));

        // Act
        final result = await spellsApiService.fetchSpellById(spellId);

        // Assert
        expect(result, isA<Spell>());
        expect(result.id, spell.id);
        expect(result.name, spell.name);
      });

      test('throws an exception when the http call for specific spell fails',
          () async {
        // Arrange
        const String spellId = "fbd3cb46-c174-4843-a07e-fd83545dce58";
        when(() => mockHttpClient
                .get(Uri.parse('${ApiConstants.kGetSpellById}$spellId')))
            .thenAnswer((_) async => http.Response('Not Found', 404));

        // Act & Assert
        expect(() async => await spellsApiService.fetchSpellById(spellId),
            throwsException);
      });
    });
  });
}
