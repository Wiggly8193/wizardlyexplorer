import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wizardly_explorer/screens/house/houses_screen.dart';

import '../utils/wizard_slide_transition.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/splash.jpeg',
            width: 1.sw,
            height: 1.sh,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: 100.h,
            left: 0,
            right: 0,
            child: Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Welcome to Hogwarts\n",
                      style: theme.titleMedium?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                        text: "Home of Wizards\n", style: theme.titleSmall),
                    TextSpan(text: "and Wonders!", style: theme.titleSmall),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 45.h,
            left: 50.w,
            right: 50.w,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: const Color.fromRGBO(88, 100, 101, 1),
                backgroundColor: const Color.fromRGBO(204, 192, 161, 1),
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                side: const BorderSide(color: Colors.white, width: 2),
                shadowColor: Colors.white.withOpacity(0.5),
                elevation: 10,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  WizardSlideTransition(page: const HomeScreen()),
                );
              },
              child: const Text(
                'Continue',
                style: TextStyle(
                  fontSize: 18,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}