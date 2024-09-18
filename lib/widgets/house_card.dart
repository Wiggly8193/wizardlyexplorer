import 'package:flutter/material.dart';

import '../models/houses/houses.dart';

class HouseCard extends StatelessWidget {
  final Houses house;

  const HouseCard({super.key, required this.house});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        gradient: LinearGradient(
          colors: _getHouseColors(house.houseColours),
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            spreadRadius: 5,
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // House Image
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              _getHouseImage(house.name),
              height: 150,
              width: 100,
            ),
          ),
          // House Details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    house.name,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    softWrap: true,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Founder: ${house.founder}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                    softWrap: true,
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Text(
                      'Traits: ${house.traits.map((trait) => trait.name).join(', ')}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Color> _getHouseColors(String houseColors) {
    final colorNames = houseColors.split(' and ');
    return colorNames.map((name) => _colorFromName(name.trim())).toList();
  }

  Color _colorFromName(String colorName) {
    switch (colorName.toLowerCase()) {
      case 'scarlet':
        return Colors.red[900] ?? Colors.red;
      case 'gold':
        return Colors.amber[700] ?? Colors.amber;
      case 'green':
        return Colors.green[800] ?? Colors.green;
      case 'silver':
        return Colors.grey[400] ?? Colors.grey;
      case 'blue':
        return Colors.blue[700] ?? Colors.blue;
      case 'yellow':
        return Colors.yellow[600] ?? Colors.yellow;
      case 'black':
        return Colors.black;
      default:
        return Colors.grey;
    }
  }

  String _getHouseImage(String houseName) {
    switch (houseName.toLowerCase()) {
      case 'gryffindor':
        return 'assets/images/gryffindor.jpeg';
      case 'hufflepuff':
        return 'assets/images/hufflepuff.jpeg';
      case 'ravenclaw':
        return 'assets/images/ravenclaw.jpeg';
      case 'slytherin':
        return 'assets/images/slytherin.jpeg';
      default:
        return 'assets/images/default_house.jpeg';
    }
  }
}
