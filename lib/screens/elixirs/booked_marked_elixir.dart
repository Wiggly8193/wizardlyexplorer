import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../providers/elixir_provider/elixir_provider.dart';
import '../../utils/favorite_manager.dart';
import 'elixirs_details.dart';

class BookmarkedElixirsScreen extends ConsumerStatefulWidget {
  const BookmarkedElixirsScreen({super.key});

  @override
  BookmarkedElixirsScreenState createState() => BookmarkedElixirsScreenState();
}

class BookmarkedElixirsScreenState
    extends ConsumerState<BookmarkedElixirsScreen> {
  final FavoritesManager _favoritesManager = FavoritesManager();
  List<String> _bookmarkedElixirIds = [];

  @override
  void initState() {
    super.initState();
    _loadBookmarkedElixirs();
  }

  // Load bookmarked elixir IDs from SharedPreferences
  void _loadBookmarkedElixirs() async {
    final ids = await _favoritesManager.getFavorites();
    setState(() {
      _bookmarkedElixirIds = ids;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      appBar: AppBar(
        title: const Text(
          "Bookmarked Elixirs",
          style: TextStyle(color: Colors.amberAccent),
        ),
        backgroundColor: Colors.black,
      ),
      body: _bookmarkedElixirIds.isEmpty
          ? const Center(
              child: Text(
                'No bookmarked elixirs.',
                style: TextStyle(color: Colors.white70),
              ),
            )
          : ListView.builder(
              itemCount: _bookmarkedElixirIds.length,
              itemBuilder: (context, index) {
                final elixirId = _bookmarkedElixirIds[index];
                final elixirAsyncValue =
                    ref.watch(getElixirsByIdProvider(elixirId));

                return elixirAsyncValue.when(
                  data: (elixir) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ElixirDetailScreen(elixirId: elixir.id),
                          ),
                        );
                      },
                      child: Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        color: const Color(0xFF162447),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                elixir.name,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amberAccent,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                elixir.effect ??
                                    'No effect information available',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white70,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Difficulty: ${elixir.difficulty.toString().split('.').last}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  loading: () => const ShimmerLoadingCard(),
                  error: (err, stack) => Center(
                    child: Text(
                      'Error loading elixir: $err',
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class ShimmerLoadingCard extends StatelessWidget {
  const ShimmerLoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[800]!,
      highlightColor: Colors.grey[500]!,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: const Color(0xFF162447),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 20,
                width: 150,
                color: Colors.white,
              ),
              const SizedBox(height: 8),
              Container(
                height: 16,
                width: 200,
                color: Colors.white,
              ),
              const SizedBox(height: 8),
              Container(
                height: 14,
                width: 100,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
