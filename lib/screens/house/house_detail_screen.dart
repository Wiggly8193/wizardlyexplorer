import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wizardly_explorer/utils/color_utils.dart';
import 'package:wizardly_explorer/utils/custom_background.dart';

import '../../models/houses/houses.dart';
import '../../providers/house_provider/house_provider.dart';
import '../../widgets/loading_widget.dart';

class HouseDetailScreen extends ConsumerWidget {
  final String houseId;

  const HouseDetailScreen({super.key, required this.houseId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final houseAsyncValue = ref.watch(getHousesByIdProvider(houseId));

    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      body: houseAsyncValue.when(
        data: (house) => Stack(
          children: [
            const CustomBackground(),
            _buildHouseDetails(house, context),
          ],
        ),
        loading: () => const Center(
          child: LoadingWidget(
            loadingMessage: 'Sorting the Houses...',
            type: "house",
          ),
        ),
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
                  icon: const Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
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
                _buildFounderQuote(house.founder),
                const SizedBox(height: 20),
                _buildHouseHeadsCarousel(house, primaryColor),
                const SizedBox(height: 20),
                _buildTraits(house.traits, primaryColor),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHouseCrest(String houseName) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(
            _getHouseImage(houseName),
          ),
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

  Widget _buildFounderQuote(String founder) {
    const founderQuotes = {
      'Godric Gryffindor':
          '"Daring, nerve, and chivalry set Gryffindors apart!"',
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
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

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
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 15.sp,
                ),
              ),
              backgroundColor: Colors.amber.withOpacity(0.9),
            );
          }).toList(),
        ),
      ],
    );
  }

  String _getHouseImage(String houseName) {
    switch (houseName) {
      case 'Gryffindor':
        return 'assets/images/gryffindor.jpeg';
      case 'Slytherin':
        return 'assets/images/slytherin.jpeg';
      case 'Hufflepuff':
        return 'assets/images/hufflepuff.jpeg';
      case 'Ravenclaw':
        return 'assets/images/ravenclaw.jpeg';
      default:
        return 'assets/images/gryffindor.png'; // Default to Gryffindor
    }
  }
}
