import 'package:flutter/material.dart';

class WizardSlideTransition extends PageRouteBuilder {
  final Widget page;

  WizardSlideTransition({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const beginOffset = Offset(1.0, 0.0);
            const endOffset = Offset.zero;
            const curve = Curves.easeInOut;

            var slideTween = Tween(begin: beginOffset, end: endOffset)
                .chain(CurveTween(curve: curve));

            var scaleTween =
                Tween(begin: 0.9, end: 1.0).chain(CurveTween(curve: curve));
            var fadeTween =
                Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(slideTween),
              child: ScaleTransition(
                scale: animation.drive(scaleTween),
                child: FadeTransition(
                  opacity: animation.drive(fadeTween),
                  child: child,
                ),
              ),
            );
          },
        );
}
