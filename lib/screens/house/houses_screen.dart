import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wizardly_explorer/screens/spells_screen.dart';

import '../../providers/house_provider/house_provider.dart';
import '../../widgets/house_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<String> _titles = [
    'Houses',
    'Elixirs',
    'Spells',
  ];

  final List<Widget> _pages = [
    const Center(
      child: HousesScreen(),
    ),
    const Center(child: Text('Elixirs')),
    const Center(child: SpellsScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titles[_currentIndex],
          style: GoogleFonts.cinzel(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.amberAccent,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_left,
            size: 30,
            color: Colors.amberAccent, // Use matching color for consistency
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor:
            const Color.fromRGBO(41, 41, 41, 1), // Dark mystical background
        elevation: 5, // Adds a subtle shadow for depth
        shadowColor: Colors.black54, // Shadow color for the app bar
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black87,
        selectedItemColor: Colors.amberAccent,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit_rounded),
            label: 'Houses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit_rounded),
            label: 'Elixirs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit_rounded),
            label: 'Spells',
          ),
        ],
      ),
    );
  }
}

class HousesScreen extends ConsumerWidget {
  const HousesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final housesAsyncValue = ref.watch(getHousesProvider);

    return Scaffold(
      body: Stack(
        children: [
          // Background image and overlay
          Positioned.fill(
            child: Image.asset(
              'assets/images/hogwarts_background.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.6),
            ),
          ),
          // Handle the different states of the provider
          housesAsyncValue.when(
            data: (houses) {
              return ListView.builder(
                itemCount: houses.length,
                itemBuilder: (context, index) {
                  final house = houses[index];
                  return GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (_) => HouseDetailScreen(house: house),
                      //   ),
                      // );
                    },
                    child: Hero(
                      tag: house.name,
                      child: HouseCard(house: house),
                    ),
                  );
                },
              );
            },
            loading: () => const Center(
                child: CircularProgressIndicator()), // Show loading indicator
            error: (error, stackTrace) =>
                Center(child: Text('Error: $error')), // Handle error state
          ),
        ],
      ),
    );
  }
}
