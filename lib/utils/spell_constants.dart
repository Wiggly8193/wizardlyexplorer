import 'package:flutter/material.dart';

class SpellConstants {
  static Color getSpellLightColor(String light) {
    switch (light) {
      case 'Blue':
        return Colors.blueAccent;
      case 'IcyBlue':
        return Colors.lightBlueAccent;
      case 'Red':
        return Colors.redAccent;
      case 'Gold':
        return Colors.amber;
      case 'Purple':
        return Colors.purpleAccent;
      case 'White':
        return Colors.white;
      case 'Green':
        return Colors.greenAccent;
      case 'Orange':
        return Colors.orangeAccent;
      case 'Yellow':
        return Colors.yellowAccent;
      case 'BrightBlue':
        return Colors.cyanAccent;
      case 'Pink':
        return Colors.pinkAccent;
      case 'Violet':
        return Colors.deepPurpleAccent;
      case 'BlueishWhite':
        return Colors.blueGrey[100]!;
      case 'Silver':
        return Colors.grey;
      case 'Scarlet':
        return Colors.red;
      case 'Fire':
        return Colors.deepOrange;
      case 'FieryScarlet':
        return Colors.red[900]!;
      case 'Grey':
        return Colors.grey[600]!;
      case 'DarkRed':
        return Colors.red[800]!;
      case 'Turquoise':
        return Colors.tealAccent;
      case 'BrightYellow':
        return Colors.yellow;
      case 'BlackSmoke':
        return Colors.black54;
      case 'PsychedelicTransparentWave':
        return Colors.purple[100]!;
      default:
        return Colors.grey;
    }
  }

  List<String> spellTypes = [
    'None',
    'Charm',
    'Conjuration',
    'Spell',
    'Transfiguration',
    'HealingSpell',
    'DarkCharm',
    'Jinx',
    'Curse',
    'MagicalTransportation',
    'Hex',
    'CounterSpell',
    'DarkArts',
    'CounterJinx',
    'CounterCharm',
    'Untransfiguration',
    'BindingMagicalContract',
    'Vanishment'
  ];

  List<String> spellLights = [
    'None',
    'Blue',
    'IcyBlue',
    'Red',
    'Gold',
    'Purple',
    'Transparent',
    'White',
    'Green',
    'Orange',
    'Yellow',
    'BrightBlue',
    'Pink',
    'Violet',
    'BlueishWhite',
    'Silver',
    'Scarlet',
    'Fire',
    'FieryScarlet',
    'Grey',
    'DarkRed',
    'Turquoise',
    'PsychedelicTransparentWave',
    'BrightYellow',
    'BlackSmoke'
  ];
}
