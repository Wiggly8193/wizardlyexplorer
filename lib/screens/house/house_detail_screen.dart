import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wizardly_explorer/utils/color_utils.dart';
import 'package:wizardly_explorer/utils/custom_background.dart';

import '../../models/houses/houses.dart';
import '../../providers/house_provider/house_provider.dart';

class HouseDetailScreen extends ConsumerWidget {
  final String houseId;

  const HouseDetailScreen({super.key, required this.houseId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final houseAsyncValue = ref.watch(getHousesByIdProvider(houseId));

    return Scaffold(
      body: houseAsyncValue.when(
        data: (house) => Stack(
          children: [
            const CustomBackground(), // Add background with subtle particles
            _buildHouseDetails(house, context),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }

  Widget _buildHouseDetails(Houses house, BuildContext context) {
    final houseColors = ColorUtils().getHouseColors(house.houseColours);
    final primaryColor = houseColors[0];
    final secondaryColor = houseColors[1];

    return SingleChildScrollView(
      child: Column(
        children: [
          // Crest and House Name
          Stack(
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [primaryColor, secondaryColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: _buildHouseCrest(house.name),
                ),
              ),
              Positioned(
                top: 40,
                left: 10,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // House Details Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle('House Details', primaryColor),
                _buildDetailRow('Founder', house.founder),
                _buildDetailRow('Animal', house.animal),
                _buildDetailRow('Element', house.element),
                _buildDetailRow('Ghost', house.ghost),
                _buildDetailRow('Common Room', house.commonRoom),
                const SizedBox(height: 20),
                // Founder Quote
                _buildFounderQuote(house.founder),
                const SizedBox(height: 20),
                // Heads of House Carousel
                _buildHouseHeadsCarousel(house, primaryColor),
                const SizedBox(height: 20),
                // House Traits
                _buildTraits(house.traits, primaryColor),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Build House Crest Widget
  Widget _buildHouseCrest(String houseName) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: const DecorationImage(
          image: AssetImage('assets/images/hufflepuff_crest.jpeg'),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.amberAccent.withOpacity(0.5),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 5),
          ),
        ],
      ),
    );
  }

  // Founder Quote Section
  Widget _buildFounderQuote(String founder) {
    const founderQuotes = {
      'Godric Gryffindor':
          '"Daring, nerve, and chivalry set Gryffindors apart!"',
      // Add other founders' quotes here
    };

    return Center(
      child: Text(
        founderQuotes[founder] ?? '',
        textAlign: TextAlign.center,
        style: GoogleFonts.cinzel(
          fontStyle: FontStyle.italic,
          color: Colors.amberAccent,
          fontSize: 18,
        ),
      ),
    );
  }

  // Section Title
  Widget _buildSectionTitle(String title, Color color) {
    return Text(
      title,
      style: GoogleFonts.cinzel(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 18, color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget _buildHouseHeadsCarousel(Houses house, Color primaryColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Heads of House', primaryColor),
        const SizedBox(height: 10),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: house.heads.length,
            itemBuilder: (context, index) {
              final head = house.heads[index];
              return _buildHeadCard(head);
            },
          ),
        ),
      ],
    );
  }

  // Build Head Card
  Widget _buildHeadCard(Head head) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      color: Colors.black45,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Icon(Icons.person, color: Colors.amberAccent, size: 40),
            const SizedBox(height: 10),
            Text(
              '${head.firstName} ${head.lastName}',
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  // Build House Traits
  Widget _buildTraits(List<Trait> traits, Color primaryColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Traits', primaryColor),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          children: traits.map((trait) {
            return Chip(
              label: Text(
                trait.name,
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.amber.withOpacity(0.7),
            );
          }).toList(),
        ),
      ],
    );
  }
}
