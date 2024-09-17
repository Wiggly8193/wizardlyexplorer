import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/elixirs/elixirs.dart';
import '../../providers/elixir_provider/elixir_provider.dart';
import 'booked_marked_elixir.dart';
import 'elixirs_details.dart';

class ElixirScreen extends ConsumerStatefulWidget {
  const ElixirScreen({super.key});

  @override
  ElixirScreenState createState() => ElixirScreenState();
}

class ElixirScreenState extends ConsumerState<ElixirScreen> {
  String searchQuery = "";
  String selectedDifficulty = "All";
  String selectedSortOption = "Name";

  // Filtering and sorting elixirs
  List<Elixirs> _filterAndSortElixirs(List<Elixirs> elixirs) {
    // Apply search filter
    List<Elixirs> filteredElixirs = elixirs.where((elixir) {
      final query = searchQuery.toLowerCase();
      return elixir.name.toLowerCase().contains(query) ||
          (elixir.effect?.toLowerCase().contains(query) ?? false);
    }).toList();

    // Apply sorting
    if (selectedSortOption == "Name") {
      filteredElixirs.sort((a, b) => a.name.compareTo(b.name));
    } else if (selectedSortOption == "Difficulty") {
      filteredElixirs.sort(
          (a, b) => a.difficulty.toString().compareTo(b.difficulty.toString()));
    }

    return filteredElixirs;
  }

  @override
  Widget build(BuildContext context) {
    final elixirsAsyncValue = ref.watch(getElixirsProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search elixirs...',
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.search, color: Colors.amberAccent),
                filled: true,
                fillColor: const Color(0xFF0F0F1A),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DropdownButtonFormField<String>(
              value: selectedSortOption,
              dropdownColor: const Color(0xFF1A1A2E),
              icon: const Icon(Icons.arrow_downward, color: Colors.amberAccent),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFF0F0F1A),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
              items: <String>['Name', 'Difficulty'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child:
                      Text(value, style: const TextStyle(color: Colors.white)),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedSortOption = value!;
                });
              },
            ),
          ),
          Expanded(
            child: elixirsAsyncValue.when(
              data: (elixirs) {
                final filteredAndSortedElixirs = _filterAndSortElixirs(elixirs);
                if (filteredAndSortedElixirs.isEmpty) {
                  return const Center(
                    child: Text(
                      'No elixirs found.',
                      style: TextStyle(color: Colors.white70),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: filteredAndSortedElixirs.length,
                  itemBuilder: (context, index) {
                    final elixir = filteredAndSortedElixirs[index];
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
                                style: GoogleFonts.cinzel(
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
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(
                  child: Text('Error: $err',
                      style: const TextStyle(color: Colors.red))),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BookmarkedElixirsScreen(),
            ),
          );
        },
        backgroundColor: Colors.amberAccent,
        child: const Icon(Icons.bookmark, color: Colors.white),
      ),
    );
  }
}
