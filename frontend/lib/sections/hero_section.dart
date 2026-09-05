import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onProjects;
  final VoidCallback onExperience;

  const HeroSection({
    super.key,
    required this.onProjects,
    required this.onExperience,
  });

  @override
  Widget build(BuildContext context) {
    final compact = MediaQuery.sizeOf(context).width < 900;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        24,
        compact ? 58 : 90,
        24,
        84,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1180),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final wide = constraints.maxWidth >= 900;

              if (!wide) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _copy(context, true),
                    const SizedBox(height: 34),
                    const Center(
                      child: _HeroVisual(),
                    ),
                  ],
                );
              }

              // Keep the original professional desktop composition:
              // text on the left, personal photo on the right.
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 11,
                    child: _copy(context, false),
                  ),
                  const SizedBox(width: 30),
                  const Expanded(
                    flex: 9,
                    child: _HeroVisual(),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _copy(BuildContext context, bool compact) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 9,
          ),
          decoration: BoxDecoration(
            color: AppTheme.cyan.withValues(alpha: 0.07),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(
              color: AppTheme.cyan.withValues(alpha: 0.22),
            ),
          ),
          child: const Text(
            'SOFTWARE ENGINEER • AI / ML • MOBILE',
            style: TextStyle(
              color: AppTheme.cyan,
              fontSize: 11,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.65,
            ),
          ),
        ),
        const SizedBox(height: 26),

        Text(
          'Jaydeo Sawale',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: compact ? 44 : 68,
                height: 0.98,
                fontWeight: FontWeight.w900,
              ),
        ),

        const SizedBox(height: 12),

        const Text(
          'AI / ML Engineer',
          style: TextStyle(
            color: AppTheme.cyan,
            fontSize: 20,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.2,
          ),
        ),

        const SizedBox(height: 20),

        Text(
          'Building intelligent systems with a professional foundation in Android and Flutter application development.',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: compact ? 22 : 28,
                height: 1.25,
                fontWeight: FontWeight.w800,
              ),
        ),

        const SizedBox(height: 18),

        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 780),
          child: Text(
            'Professional mobile development experience combined with hands-on independent engineering across Machine Learning, backend APIs, Generative AI, RAG, MLOps, testing, containerization, and deployment workflows.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: compact ? 15 : 17,
                  height: 1.72,
                ),
          ),
        ),

        const SizedBox(height: 26),

        Wrap(
          spacing: 9,
          runSpacing: 9,
          children: const [
            _Pill('Android'),
            _Pill('Flutter'),
            _Pill('Python'),
            _Pill('Machine Learning'),
            _Pill('GenAI'),
            _Pill('RAG'),
            _Pill('MLOps'),
          ],
        ),

        const SizedBox(height: 30),

        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            FilledButton.icon(
              onPressed: onProjects,
              icon: const Icon(Icons.arrow_forward_rounded),
              label: const Text('Explore flagship projects'),
              style: FilledButton.styleFrom(
                backgroundColor: AppTheme.cyan,
                foregroundColor: AppTheme.background,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 17,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),

            OutlinedButton.icon(
              onPressed: onExperience,
              icon: const Icon(Icons.work_outline_rounded),
              label: const Text('View experience'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(
                  color: Colors.white24,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 17,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 34),

        const Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _Proof(
              '5+ yrs',
              'Professional Android',
            ),
            _Proof(
              '6+ mos',
              'Professional Flutter',
            ),
            _Proof(
              '4',
              'Flagship AI projects',
            ),
          ],
        ),
      ],
    );
  }
}

class _Pill extends StatelessWidget {
  final String label;

  const _Pill(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.035),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.08),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: Colors.white70,
        ),
      ),
    );
  }
}

class _Proof extends StatelessWidget {
  final String value;
  final String label;

  const _Proof(
    this.value,
    this.label,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 188,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.035),
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.07),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: const TextStyle(
              color: AppTheme.cyan,
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white54,
              fontSize: 12,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroVisual extends StatefulWidget {
  const _HeroVisual();

  @override
  State<_HeroVisual> createState() => _HeroVisualState();
}

class _HeroVisualState extends State<_HeroVisual>
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
    final width = MediaQuery.sizeOf(context).width;
    final compact = width < 700;

    final photoSize = compact ? 250.0 : 365.0;
    final visualHeight = compact ? 330.0 : 560.0;
    final outerOrbit = compact ? 300.0 : 450.0;
    final middleOrbit = compact ? 260.0 : 380.0;
    final innerOrbit = compact ? 225.0 : 325.0;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final angle = _controller.value * 2 * math.pi;

        return SizedBox(
          height: visualHeight,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              _orbit(
                outerOrbit,
                AppTheme.cyan.withValues(alpha: 0.16),
                angle,
              ),

              _orbit(
                middleOrbit,
                AppTheme.violet.withValues(alpha: 0.18),
                -angle * 0.8,
              ),

              _orbit(
                innerOrbit,
                AppTheme.cyan.withValues(alpha: 0.20),
                angle * 0.65,
              ),

              // Outer halo around the portrait.
              Container(
                width: photoSize + 24,
                height: photoSize + 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.background,
                  border: Border.all(
                    color: AppTheme.cyan.withValues(alpha: 0.28),
                    width: 1.4,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.cyan.withValues(alpha: 0.12),
                      blurRadius: 70,
                      spreadRadius: 8,
                    ),
                  ],
                ),
              ),

              // Your original photo.
              // The scale and alignment deliberately keep the face
              // centered while cropping out the lower body and hand.
              Container(
                width: photoSize,
                height: photoSize,
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF1A2633),
                      Color(0xFF0B111A),
                    ],
                  ),
                  border: Border.all(
                    color: AppTheme.cyan.withValues(alpha: 0.48),
                    width: 1.6,
                  ),
                ),
                 child: ClipOval(
  child: Transform.scale(
    scale: compact ? 1.03 : 1.08,
    alignment: Alignment.center,
    child: Image.asset(
      'assets/images/jaydeo_profile.jpg',
      fit: BoxFit.cover,
      alignment: Alignment.center,
      filterQuality: FilterQuality.high,
    ),
  ),
),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _orbit(
    double size,
    Color color,
    double angle,
  ) {
    return Transform.rotate(
      angle: angle,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: color,
            width: 1.1,
          ),
        ),
      ),
    );
  }
}