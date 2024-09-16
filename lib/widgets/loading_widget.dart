import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, required this.loadingMessage});

  final String loadingMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const RotationTransition(
            turns: AlwaysStoppedAnimation(45 / 360),
            child: Icon(
              Icons.auto_fix_high,
              size: 50,
              color: Color.fromRGBO(204, 192, 161, 1),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("$loadingMessage  ",
                  style: GoogleFonts.cinzel(
                    fontSize: 18,
                    color: Colors.brown[700],
                  )),
              LoadingAnimationWidget.prograssiveDots(
                color: const Color.fromRGBO(204, 192, 161, 1),
                size: 75,
              ),
            ],
          ),
          // Text that represents magic being loaded
        ],
      ),
    );
  }
}
