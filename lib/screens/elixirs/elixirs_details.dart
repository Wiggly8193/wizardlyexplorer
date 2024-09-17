import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wizardly_explorer/widgets/loading_widget.dart';

import '../../providers/elixir_provider/elixir_provider.dart';
import '../../utils/custom_background.dart';
import '../../utils/favorite_manager.dart';

class ElixirDetailScreen extends ConsumerStatefulWidget {
  final String elixirId;

  const ElixirDetailScreen({super.key, required this.elixirId});

  @override
  _ElixirDetailScreenState createState() => _ElixirDetailScreenState();
}

class _ElixirDetailScreenState extends ConsumerState<ElixirDetailScreen> {
  final FavoritesManager _favoritesManager = FavoritesManager();
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _checkFavoriteStatus();
  }

  void _checkFavoriteStatus() async {
    final isFavorite =
        await _favoritesManager.isFavoriteElixir(widget.elixirId);
    setState(() {
      _isFavorite = isFavorite;
    });
  }

  void _toggleFavorite() async {
    if (_isFavorite) {
      await _favoritesManager.removeFavoriteElixir(widget.elixirId);
    } else {
      await _favoritesManager.addFavoriteElixir(widget.elixirId);
    }
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    final elixirAsyncValue = ref.watch(getElixirsByIdProvider(widget.elixirId));

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFF1A1A2E),
      appBar: AppBar(
        title: Text(
          "Elixir Details",
          style: GoogleFonts.cinzel(fontSize: 24, color: Colors.amberAccent),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_left,
            size: 30,
            color: Colors.amberAccent,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              _isFavorite ? Icons.bookmark : Icons.bookmark_border,
              color: Colors.amberAccent,
            ),
            onPressed: _toggleFavorite,
          )
        ],
      ),
      body: Stack(
        children: [
          const CustomBackground(),
          elixirAsyncValue.when(
            data: (elixir) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 80),
                      _buildElixirCard(elixir),
                      const SizedBox(height: 16),
                      if (elixir.sideEffects != null)
                        _buildSideEffectsCard(elixir.sideEffects!),
                      const SizedBox(height: 16),
                      _buildIngredientsCard(elixir),
                      const SizedBox(height: 16),
                      _buildBrewingCard(elixir),
                    ],
                  ),
                ),
              );
            },
            loading: () => const Center(
              child: LoadingWidget(
                loadingMessage: 'Brewing Elixirs',
                type: "elixirs",
              ),
            ),
            error: (err, stack) => Center(child: Text('Error: $err')),
          ),
        ],
      ),
    );
  }

  Widget _buildElixirCard(elixir) {
    return Card(
      color: Colors.black.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("Effect"),
            const SizedBox(height: 8),
            Text(
              elixir.effect ?? 'No effect information available',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle("Difficulty"),
            const SizedBox(height: 8),
            Text(
              elixir.difficulty.toString().split('.').last,
              style: const TextStyle(color: Colors.white70, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSideEffectsCard(String sideEffects) {
    return Card(
      color: Colors.black.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("Side Effects"),
            const SizedBox(height: 8),
            Text(
              sideEffects,
              style: const TextStyle(color: Colors.white70, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIngredientsCard(elixir) {
    return Card(
      color: Colors.black.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("Ingredients"),
            const SizedBox(height: 8),
            elixir.ingredients?.isNotEmpty == true
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // Map each ingredient to a widget
                    children: elixir.ingredients!
                        .map<Widget>(
                          (ingredient) => Text(
                            "• ${ingredient.name}",
                            style: const TextStyle(
                                color: Colors.white70, fontSize: 16),
                          ),
                        )
                        .toList(), // Convert to List<Widget>
                  )
                : const Text(
                    'No ingredients available.',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildBrewingCard(elixir) {
    return Card(
      color: Colors.black.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("Brewing Time"),
            const SizedBox(height: 8),
            Text(
              elixir.time ?? 'Unknown brewing time',
              style: const TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle("Instructions"),
            const SizedBox(height: 8),
            const Text(
              'Follow the specific brewing instructions for this elixir.',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.cinzel(
        fontSize: 20,
        color: Colors.amberAccent,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
