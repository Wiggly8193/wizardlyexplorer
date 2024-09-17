import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wizardly_explorer/providers/spell_provider/spell_provider.dart';
import 'package:wizardly_explorer/screens/spells/spells_details_screen.dart';
import 'package:wizardly_explorer/widgets/spell_card.dart';

import '../../utils/favorite_manager.dart';
import '../../utils/wizard_slide_transition.dart';

class BookmarkedSpellScreen extends ConsumerStatefulWidget {
  const BookmarkedSpellScreen({super.key});

  @override
  BookmarkedSpellScreenState createState() => BookmarkedSpellScreenState();
}

class BookmarkedSpellScreenState extends ConsumerState<BookmarkedSpellScreen> {
  final FavoritesManager _favoritesManager = FavoritesManager();
  List<String> _bookmarkedSpellIds = [];

  @override
  void initState() {
    super.initState();
    _loadBookmarkedSpells();
  }

  void _loadBookmarkedSpells() async {
    final ids = await _favoritesManager.getFavoriteSpells();
    setState(() {
      _bookmarkedSpellIds = ids;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      appBar: AppBar(
        title: const Text(
          "Bookmarked Spells",
          style: TextStyle(color: Colors.amberAccent),
        ),
        backgroundColor: Colors.black,
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
      ),
      body: _bookmarkedSpellIds.isEmpty
          ? const Center(
              child: Text(
                'No bookmarked Spells.',
                style: TextStyle(color: Colors.white70),
              ),
            )
          : ListView.builder(
              itemCount: _bookmarkedSpellIds.length,
              itemBuilder: (context, index) {
                final spellId = _bookmarkedSpellIds[index];
                final spellAsyncValue =
                    ref.watch(getSpellByIdProvider(spellId));

                return spellAsyncValue.when(
                  data: (spell) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          WizardSlideTransition(
                            page: SpellDetailScreen(spellId: spellId),
                          ),
                        );
                      },
                      child: SpellCard(
                        spellName: spell.name,
                        type: spell.type,
                        incantation: spell.incantation ?? 'Unknown',
                        lightColor: spell.light,
                        onTap: () {
                          Navigator.push(
                            context,
                            WizardSlideTransition(
                              page: SpellDetailScreen(spellId: spell.id),
                            ),
                          );
                        },
                      ),
                    );
                  },
                  loading: () => const ShimmerLoadingCard(),
                  error: (err, stack) => Center(
                    child: Text(
                      'Error loading Spells: $err',
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
