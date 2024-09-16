import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/spell_constants.dart';

class SpellCard extends StatefulWidget {
  const SpellCard({
    super.key,
    required this.spellName,
    required this.type,
    required this.incantation,
    required this.onTap,
    required this.lightColor,
  });

  final String spellName;
  final String type;
  final String incantation;
  final String lightColor;
  final Function onTap;

  @override
  State<SpellCard> createState() => _SpellCardState();
}

class _SpellCardState extends State<SpellCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onTap(),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(41, 41, 41, 1),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: SpellConstants.getSpellLightColor(widget.lightColor)
                  .withOpacity(0.5), // Light glow effect
              blurRadius: 8,
              spreadRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
          border: Border.all(
            color: SpellConstants.getSpellLightColor(widget.lightColor),
            width: 2,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Spell Icon/Light
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: SpellConstants.getSpellLightColor(widget.lightColor)
                    .withOpacity(0.2),
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: SpellConstants.getSpellLightColor(widget.lightColor)
                        .withOpacity(0.7),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Icon(
                Icons.auto_awesome, // Can be replaced with magical icons
                color: SpellConstants.getSpellLightColor(widget.lightColor),
                size: 40,
              ),
            ),
            const SizedBox(width: 20),
            // Spell Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Spell Name
                  Text(
                    widget.spellName,
                    style: GoogleFonts.cinzel(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.amberAccent,
                    ),
                  ),
                  const SizedBox(height: 6),
                  // Spell Type
                  Text(
                    widget.type,
                    style: GoogleFonts.cinzel(
                      fontSize: 14,
                      color: Colors.grey[400],
                    ),
                  ),
                  const SizedBox(height: 6),
                  // Incantation
                  widget.incantation.isNotEmpty
                      ? Text(
                          '"${widget.incantation}"',
                          style: GoogleFonts.cinzel(
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                            color: Colors.grey[300],
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
