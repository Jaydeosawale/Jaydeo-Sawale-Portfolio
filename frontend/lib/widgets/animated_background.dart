import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AnimatedBackground extends StatefulWidget {
  final Widget child;

  const AnimatedBackground({super.key, required this.child});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 18),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final t = _controller.value * math.pi * 2;
        return Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(painter: _GridPainter(t)),
            ),
            Positioned(
              top: -180 + math.sin(t) * 40,
              right: -120 + math.cos(t) * 30,
              child: _orb(AppTheme.cyan, 420),
            ),
            Positioned(
              bottom: -230 + math.cos(t * 0.8) * 50,
              left: -160 + math.sin(t * 0.6) * 40,
              child: _orb(AppTheme.violet, 520),
            ),
            widget.child,
          ],
        );
      },
    );
  }

  Widget _orb(Color color, double size) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withValues(alpha: 0.05),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.18),
              blurRadius: 130,
              spreadRadius: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  final double time;

  _GridPainter(this.time);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.018)
      ..strokeWidth = 1;

    const spacing = 42.0;
    final offset = (time * 6) % spacing;

    for (double x = -spacing + offset; x < size.width + spacing; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = -spacing + offset; y < size.height + spacing; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _GridPainter oldDelegate) {
    return oldDelegate.time != time;
  }
}
