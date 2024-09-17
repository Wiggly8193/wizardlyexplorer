import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wizardly_explorer/screens/elixirs/elixirs.dart';

import '../../providers/house_provider/house_provider.dart';
import '../../utils/wizard_slide_transition.dart';
import '../../widgets/house_card.dart';
import '../../widgets/loading_widget.dart';
import '../spells/spells_screen.dart';
import 'house_detail_screen.dart';

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
    const Center(
      child: ElixirScreen(),
    ),
    const Center(
      child: SpellsScreen(),
    ),
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
            color: Colors.amberAccent,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color.fromRGBO(41, 41, 41, 1),
        elevation: 5,
        shadowColor: Colors.black54,
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
            icon: ImageIcon(
              AssetImage('assets/icons/houses_icon.png'),
            ),
            label: 'Houses',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/elixirs_icon.png'),
            ),
            label: 'Elixirs',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/spell_icon.png'),
            ),
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
      backgroundColor: const Color(0xFF1A1A2E),
      body: housesAsyncValue.when(
        data: (houses) {
          return ListView.builder(
            itemCount: houses.length,
            itemBuilder: (context, index) {
              final house = houses[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    WizardSlideTransition(
                      page: HouseDetailScreen(
                        houseId: house.id,
                      ),
                    ),
                  );
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
          child: LoadingWidget(
            loadingMessage: 'Sorting the Houses',
            type: "house",
          ),
        ),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
