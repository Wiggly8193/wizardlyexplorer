import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget(
      {super.key, required this.loadingMessage, required this.type});

  final String loadingMessage;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: const AlwaysStoppedAnimation(45 / 360),
            builder: (context, child) => RotationTransition(
              turns: const AlwaysStoppedAnimation(45 / 360),
              child: ImageIcon(
                _getImageIcon(),
                size: 50,
                color: Colors.yellow,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$loadingMessage  ",
                style: GoogleFonts.cinzel(
                    fontSize: 20,
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold),
              ),
              LoadingAnimationWidget.prograssiveDots(
                color: Colors.white,
                size: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }

  AssetImage _getImageIcon() {
    switch (type) {
      case 'house':
        return const AssetImage('assets/icons/houses_icon.png');
      case 'spells':
        return const AssetImage('assets/icons/spell_icon.png');
      case 'elixirs':
        return const AssetImage('assets/icons/elixirs_icon.png');
      default:
        return const AssetImage('assets/icons/default_icon.png');
    }
  }
}
