import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wizardly_explorer/models/spell/spell.dart';
import 'package:wizardly_explorer/utils/favorite_manager.dart';
import 'package:wizardly_explorer/utils/spell_constants.dart';

import '../../providers/spell_provider/spell_provider.dart';

class SpellDetailScreen extends ConsumerStatefulWidget {
  const SpellDetailScreen({super.key, required this.spellId});

  final String spellId;

  @override
  _SpellDetailScreenState createState() => _SpellDetailScreenState();
}

class _SpellDetailScreenState extends ConsumerState<SpellDetailScreen> {
  final FavoritesManager _favoritesManager = FavoritesManager();
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _checkFavoriteStatus();
  }

  void _checkFavoriteStatus() async {
    final isFavorite = await _favoritesManager.isFavoriteSpell(widget.spellId);
    setState(() {
      _isFavorite = isFavorite;
    });
  }

  void _toggleFavorite() async {
    if (_isFavorite) {
      await _favoritesManager.removeFavoriteSpell(widget.spellId);
    } else {
      await _favoritesManager.addFavoriteSpell(widget.spellId);
    }
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    final spellAsyncValue = ref.watch(getSpellByIdProvider(widget.spellId));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Spell Details",
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
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: spellAsyncValue.when(
        data: (spell) => _buildSpellDetailContent(spell),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(
          child: Text('Error: $err'),
        ),
      ),
    );
  }

  Widget _buildSpellDetailContent(Spell spell) {
    final spellLightColor = SpellConstants.getSpellLightColor(spell.light);

    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/spells.jpeg',
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(0.7),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Text(
                "✨ ${spell.name} ✨",
                textAlign: TextAlign.center,
                style: GoogleFonts.cinzelDecorative(
                  fontSize: 38.sp,
                  color: Colors.amberAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 50.h),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.brown.withOpacity(0.5),
                  border: Border.all(color: Colors.amberAccent, width: 2),
                ),
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSpellDetail(
                        "Incantation", spell.incantation ?? 'Unknown'),
                    _buildSpellDetail("Effect", spell.effect),
                    _buildSpellDetail("Type", spell.type),
                    _buildSpellDetail("Light", spell.light),
                    _buildSpellDetail(
                        "Can be verbal",
                        spell.canBeVerbal != null && spell.canBeVerbal!
                            ? "Yes"
                            : "No"),
                    _buildSpellDetail("Creator", spell.creator ?? "Unknown"),
                  ],
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 10.h,
                  width: 200.w,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        spellLightColor.withOpacity(0.8),
                        spellLightColor,
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: spellLightColor.withOpacity(0.6),
                        blurRadius: 20,
                        spreadRadius: 5,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ],
    );
  }

  // Helper method to build the spell detail section
  Widget _buildSpellDetail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: RichText(
        text: TextSpan(
          style: GoogleFonts.cinzel(
            fontSize: 18.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
              text: "$label: ",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.amberAccent,
              ),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }
}
