import 'package:shared_preferences/shared_preferences.dart';

class FavoritesManager {
  static const String _favoritesElixirsKey = 'favorites_elixirs';
  static const String _favoritesSpellsKey = 'favorites_spells';

  Future<void> addFavoriteElixir(String elixirId) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> favorites =
        prefs.getStringList(_favoritesElixirsKey) ?? [];
    if (!favorites.contains(elixirId)) {
      favorites.add(elixirId);
      await prefs.setStringList(_favoritesElixirsKey, favorites);
    }
  }

  Future<void> removeFavoriteElixir(String elixirId) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> favorites =
        prefs.getStringList(_favoritesElixirsKey) ?? [];
    favorites.remove(elixirId);
    await prefs.setStringList(_favoritesElixirsKey, favorites);
  }

  Future<List<String>> getFavoriteElixirs() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_favoritesElixirsKey) ?? [];
  }

  Future<bool> isFavoriteElixir(String elixirId) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> favorites =
        prefs.getStringList(_favoritesElixirsKey) ?? [];
    return favorites.contains(elixirId);
  }

  Future<void> addFavoriteSpell(String spellId) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> favorites =
        prefs.getStringList(_favoritesSpellsKey) ?? [];
    if (!favorites.contains(spellId)) {
      favorites.add(spellId);
      await prefs.setStringList(_favoritesSpellsKey, favorites);
    }
  }

  Future<void> removeFavoriteSpell(String spellId) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> favorites =
        prefs.getStringList(_favoritesSpellsKey) ?? [];
    favorites.remove(spellId);
    await prefs.setStringList(_favoritesSpellsKey, favorites);
  }

  Future<List<String>> getFavoriteSpells() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_favoritesSpellsKey) ?? [];
  }

  Future<bool> isFavoriteSpell(String spellId) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> favorites =
        prefs.getStringList(_favoritesSpellsKey) ?? [];
    return favorites.contains(spellId);
  }
}
