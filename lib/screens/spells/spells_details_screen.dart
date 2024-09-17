import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wizardly_explorer/models/spell/spell.dart';

import '../../utils/spell_constants.dart';

class SpellDetailScreen extends StatelessWidget {
  const SpellDetailScreen({super.key, required this.spell});

  final Spell spell;

  @override
  Widget build(BuildContext context) {
    final spellLightColor = SpellConstants.getSpellLightColor(spell.light);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_left,
            size: 30,
          ),
          color: Colors.yellow,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/spells.jpeg', // Background image path
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.7), // Overlay for readability
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Text(
                  "✨ ${spell.name} ✨", // Display spell name
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
                          spellLightColor
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
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
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
