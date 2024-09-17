import 'package:flutter/material.dart';

class ColorUtils {
  List<Color> getHouseColors(String houseColors) {
    final colorNames = houseColors.split(' and ');
    return colorNames.map((color) => _colorFromName(color.trim())).toList();
  }

  Color _colorFromName(String colorName) {
    switch (colorName.toLowerCase()) {
      case 'scarlet':
        return Colors.red[900]!;
      case 'gold':
        return Colors.amber;
      case 'green':
        return Colors.green[800]!;
      case 'silver':
        return Colors.grey[400]!;
      case 'blue':
        return Colors.blue[700]!;
      case 'yellow':
        return Colors.yellow[600]!;
      case 'black':
        return Colors.black;
      default:
        return Colors.grey;
    }
  }
}
