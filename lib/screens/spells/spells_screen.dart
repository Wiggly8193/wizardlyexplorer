import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wizardly_explorer/screens/spells/spells_details_screen.dart';
import 'package:wizardly_explorer/utils/spell_constants.dart';

import '../../models/spell/spell.dart';
import '../../providers/spell_provider/spell_provider.dart';
import '../../utils/wizard_slide_transition.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/spell_card.dart';

class SpellsScreen extends ConsumerStatefulWidget {
  const SpellsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SpellsScreenState createState() => _SpellsScreenState();
}

class _SpellsScreenState extends ConsumerState<SpellsScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchSpellController = TextEditingController();

  List<Spell> filteredSpells = [];
  String searchQuery = "";
  int currentMax = 20;
  final int increment = 20;

  String? selectedType;
  String? selectedLight;
  bool? selectedVerbal;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        setState(() {
          if (currentMax < filteredSpells.length) {
            currentMax =
                (currentMax + increment).clamp(0, filteredSpells.length);
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final spellsAsyncValue = ref.watch(getSpellsProvider);

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(31, 31, 31, 1), // Dark background
        body: spellsAsyncValue.when(
          data: (spells) {
            if (filteredSpells.isEmpty && searchQuery.isEmpty) {
              filteredSpells = spells;
            }

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      // Search Bar
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(41, 41, 41, 1),
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 6,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: TextFormField(
                            controller: _searchSpellController,
                            onChanged: (value) {
                              setState(() {
                                searchQuery = value.toLowerCase();
                                filteredSpells = _applyFilters(spells);
                              });
                            },
                            style: GoogleFonts.cinzel(
                              fontSize: 18,
                              color: const Color.fromRGBO(204, 192, 161, 1),
                            ),
                            decoration: InputDecoration(
                              hintText: "Search for spells...",
                              hintStyle: GoogleFonts.cinzel(
                                color: Colors.grey[500],
                                fontStyle: FontStyle.italic,
                              ),
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Color.fromRGBO(204, 192, 161, 1),
                              ),
                              filled: true,
                              fillColor: Colors.transparent,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              ),
                              suffixIcon: IconButton(
                                icon: const Icon(
                                  Icons.clear,
                                  color: Color.fromRGBO(204, 192, 161, 1),
                                ),
                                onPressed: () {
                                  _searchSpellController.clear();
                                  setState(() {
                                    searchQuery = "";
                                    filteredSpells = spells;
                                    currentMax =
                                        (filteredSpells.length < increment)
                                            ? filteredSpells.length
                                            : increment;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Filter Button
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 12),
                          backgroundColor: const Color.fromRGBO(51, 51, 51, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          shadowColor: Colors.deepPurple.withOpacity(0.4),
                          elevation: 5,
                        ),
                        onPressed: () {
                          _showFilterBottomSheet(spells);
                        },
                        child: const Row(
                          children: [
                            Icon(
                              Icons.auto_awesome,
                              color: Colors.amberAccent,
                              size: 20,
                            ),
                            SizedBox(width: 6),
                            Text(
                              'Filter',
                              style: TextStyle(
                                color: Colors.amberAccent,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    controller: _scrollController,
                    itemCount: (currentMax < filteredSpells.length)
                        ? currentMax
                        : filteredSpells.length,
                    itemBuilder: (context, index) {
                      if (index >= filteredSpells.length) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Center(
                            child: LoadingWidget(
                              loadingMessage: "Casting spells...",
                              type: "spells",
                            ),
                          ),
                        );
                      }

                      final spell = filteredSpells[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SpellCard(
                          onTap: () {
                            Navigator.push(
                              context,
                              WizardSlideTransition(
                                page: SpellDetailScreen(spell: spell),
                              ),
                            );
                          },
                          spellName: spell.name,
                          type: spell.type,
                          incantation: spell.effect,
                          lightColor: spell.light,
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
          loading: () => const Center(
            child: LoadingWidget(
              loadingMessage: "Casting spells...",
              type: "spells",
            ),
          ),
          error: (err, stack) => Center(
            child: Text('Error: $err'),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _showFilterBottomSheet(List<Spell> spells) {
    showModalBottomSheet(
      backgroundColor: const Color.fromRGBO(51, 51, 51, 1),
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setStateBottomSheet) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Filter by Category",
                    style: GoogleFonts.cinzel(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.amberAccent,
                    ),
                  ),
                  const SizedBox(height: 10),
                  DropdownButton<String>(
                    dropdownColor: Colors.black,
                    value: selectedType,
                    hint: const Text(
                      "Select Spell Type",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: GoogleFonts.cinzel(
                      color: Colors.amberAccent,
                      fontSize: 16,
                    ),
                    items: SpellConstants()
                        .spellTypes
                        .map<DropdownMenuItem<String>>(
                            (type) => DropdownMenuItem<String>(
                                  value: type,
                                  child: Text(type),
                                ))
                        .toList(),
                    onChanged: (String? newValue) {
                      setStateBottomSheet(() {
                        selectedType = newValue;
                      });
                    },
                  ),
                  DropdownButton<String>(
                    dropdownColor: Colors.black,
                    style: GoogleFonts.cinzel(
                      color: Colors.amberAccent,
                      fontSize: 16,
                    ),
                    value: selectedLight,
                    hint: const Text(
                      "Select Light Color",
                      style: TextStyle(color: Colors.white),
                    ),
                    isExpanded: true,
                    items: SpellConstants()
                        .spellLights
                        .map<DropdownMenuItem<String>>(
                            (light) => DropdownMenuItem<String>(
                                  value: light,
                                  child: Text(light),
                                ))
                        .toList(),
                    onChanged: (String? newValue) {
                      setStateBottomSheet(() {
                        selectedLight = newValue;
                      });
                    },
                  ),
                  SwitchListTile(
                    activeColor: Colors.amberAccent,
                    title: Text(
                      "Verbal",
                      style: GoogleFonts.cinzel(
                        color: Colors.amberAccent,
                        fontSize: 16,
                      ),
                    ),
                    value: selectedVerbal ?? false,
                    onChanged: (bool value) {
                      setStateBottomSheet(() {
                        selectedVerbal = value;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amberAccent,
                          foregroundColor: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          setState(() {
                            filteredSpells = _applyFilters(spells);
                            currentMax = (filteredSpells.length < increment)
                                ? filteredSpells.length
                                : increment;
                          });
                        },
                        child: const Text("Apply Filters"),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.amberAccent,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          setState(() {
                            // Clear all filters
                            selectedType = null;
                            selectedLight = null;
                            selectedVerbal = null;
                            filteredSpells = spells;
                            currentMax = (filteredSpells.length < increment)
                                ? filteredSpells.length
                                : increment;
                          });
                        },
                        child: const Text("Clear Filters"),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  List<Spell> _applyFilters(List<Spell> spells) {
    return spells.where((spell) {
      final matchesSearch = spell.name.toLowerCase().contains(searchQuery) ||
          (spell.incantation?.toLowerCase().contains(searchQuery) ?? false) ||
          spell.effect.toLowerCase().contains(searchQuery) ||
          spell.type.toLowerCase().contains(searchQuery) ||
          spell.light.toLowerCase().contains(searchQuery) ||
          (spell.creator?.toLowerCase().contains(searchQuery) ?? false);

      final matchesType = selectedType == null || spell.type == selectedType;
      final matchesLight =
          selectedLight == null || spell.light == selectedLight;
      final matchesVerbal =
          selectedVerbal == null || spell.canBeVerbal == selectedVerbal;

      return matchesSearch && matchesType && matchesLight && matchesVerbal;
    }).toList();
  }
}
