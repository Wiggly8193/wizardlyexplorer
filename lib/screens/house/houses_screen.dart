import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/house_provider/house_provider.dart';
import '../../utils/wizard_slide_transition.dart';
import '../../widgets/house_card.dart';
import '../../widgets/loading_widget.dart';
import 'house_detail_screen.dart';

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
