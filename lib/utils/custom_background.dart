import 'dart:math';

import 'package:flutter/material.dart';

class CustomBackground extends StatefulWidget {
  const CustomBackground({super.key});

  @override
  _CustomBackgroundState createState() => _CustomBackgroundState();
}

class _CustomBackgroundState extends State<CustomBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Gradient Background
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF0F2027),
                Color(0xFF203A43),
                Color(0xFF2C5364),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        // Particle effect
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return CustomPaint(
              painter: _ParticlePainter(_controller.value),
            );
          },
        ),
      ],
    );
  }
}

class _ParticlePainter extends CustomPainter {
  final double progress;
  final Random random = Random();

  _ParticlePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    if (size.width <= 0 || size.height <= 0) {
      // If size is invalid, don't paint anything
      return;
    }

    final Paint paint = Paint()..color = Colors.amberAccent.withOpacity(0.5);

    for (int i = 0; i < 50; i++) {
      // Ensure particles stay within valid bounds
      final double dx = random.nextDouble() * size.width;
      final double dy =
          (random.nextDouble() * size.height * progress) % size.height;

      // Check for NaN or invalid offsets
      if (dx.isNaN || dy.isNaN) continue;

      canvas.drawCircle(Offset(dx, dy), random.nextDouble() * 3 + 1, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
