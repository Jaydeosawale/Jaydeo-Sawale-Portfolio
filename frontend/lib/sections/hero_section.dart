import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/section_shell.dart';

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
    final screenWidth = MediaQuery.sizeOf(context).width;

    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 950;

    return SectionShell(
      child: Padding(
        padding: EdgeInsets.only(
          top: isMobile ? 42 : 70,
          bottom: isMobile ? 48 : 80,
        ),
        child: isMobile
            ? _MobileHero(
                onProjects: onProjects,
                onExperience: onExperience,
              )
            : _DesktopHero(
                isTablet: isTablet,
                onProjects: onProjects,
                onExperience: onExperience,
              ),
      ),
    );
  }
}

//
// ============================================================
// MOBILE HERO
// ============================================================
//

class _MobileHero extends StatelessWidget {
  final VoidCallback onProjects;
  final VoidCallback onExperience;

  const _MobileHero({
    required this.onProjects,
    required this.onExperience,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _HeroBadge(),

        const SizedBox(height: 28),

        const Text(
          'Jaydeo Sawale',
          style: TextStyle(
            fontSize: 48,
            height: 1.05,
            fontWeight: FontWeight.w900,
            letterSpacing: -2,
          ),
        ),

        const SizedBox(height: 14),

        const Text(
          'AI/ML & GenAI Engineer',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w800,
            color: AppTheme.cyan,
          ),
        ),

        const SizedBox(height: 24),

        const Text(
          'Building intelligent and production-ready systems with a strong foundation in Native Android (Kotlin) and Flutter Multiplatform development.',
          style: TextStyle(
            fontSize: 18,
            height: 1.55,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),

        const SizedBox(height: 22),

        const Text(
          'Software engineer with professional experience in Native Android development using Kotlin and Flutter Multiplatform development, now building end-to-end systems across Machine Learning, Deep Learning, Generative AI, RAG, LLM applications, backend APIs, MLOps, testing, containerization, and deployment workflows.',
          style: TextStyle(
            fontSize: 16,
            height: 1.7,
            color: AppTheme.muted,
          ),
        ),

        const SizedBox(height: 28),

        const _SkillHighlights(),

        const SizedBox(height: 32),

        _HeroButtons(
          onProjects: onProjects,
          onExperience: onExperience,
          mobile: true,
        ),

        const SizedBox(height: 40),

        const _StatsSection(),

        const SizedBox(height: 42),

        const Center(
          child: _ProfileImage(),
        ),
      ],
    );
  }
}

//
// ============================================================
// DESKTOP / TABLET HERO
// ============================================================
//

class _DesktopHero extends StatelessWidget {
  final bool isTablet;
  final VoidCallback onProjects;
  final VoidCallback onExperience;

  const _DesktopHero({
    required this.isTablet,
    required this.onProjects,
    required this.onExperience,
  });

  @override
  Widget build(BuildContext context) {
    final imageSize = isTablet ? 300.0 : 380.0;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _HeroBadge(),

              const SizedBox(height: 28),

              Text(
                'Jaydeo Sawale',
                style: TextStyle(
                  fontSize: isTablet ? 58 : 72,
                  height: 1.05,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -2.5,
                ),
              ),

              const SizedBox(height: 16),

              Text(
                'AI/ML & GenAI Engineer',
                style: TextStyle(
                  fontSize: isTablet ? 28 : 34,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.cyan,
                ),
              ),

              const SizedBox(height: 26),

              Text(
                'Building intelligent and production-ready systems with a strong foundation in Native Android (Kotlin) and Flutter Multiplatform development.',
                style: TextStyle(
                  fontSize: isTablet ? 20 : 24,
                  height: 1.45,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Software engineer with professional experience in Native Android development using Kotlin and Flutter Multiplatform development, now building end-to-end systems across Machine Learning, Deep Learning, Generative AI, RAG, LLM applications, backend APIs, MLOps, testing, containerization, and deployment workflows.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.7,
                  color: AppTheme.muted,
                ),
              ),

              const SizedBox(height: 28),

              const _SkillHighlights(),

              const SizedBox(height: 34),

              _HeroButtons(
                onProjects: onProjects,
                onExperience: onExperience,
              ),

              const SizedBox(height: 42),

              const _StatsSection(),
            ],
          ),
        ),

        SizedBox(width: isTablet ? 35 : 65),

        Expanded(
          flex: 4,
          child: Center(
            child: _ProfileImage(
              size: imageSize,
            ),
          ),
        ),
      ],
    );
  }
}

//
// ============================================================
// HERO BADGE
// ============================================================
//

class _HeroBadge extends StatelessWidget {
  const _HeroBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: AppTheme.cyan.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: AppTheme.cyan.withValues(alpha: 0.25),
        ),
      ),
      child: const Text(
        'AI / ML • GENAI • MOBILE ENGINEERING',
        style: TextStyle(
          color: AppTheme.cyan,
          fontSize: 12,
          fontWeight: FontWeight.w900,
          letterSpacing: 2,
        ),
      ),
    );
  }
}

//
// ============================================================
// SKILLS
// ============================================================
//

class _SkillHighlights extends StatelessWidget {
  const _SkillHighlights();

  @override
  Widget build(BuildContext context) {
    const skills = [
      'Kotlin',
      'Native Android',
      'Flutter Multiplatform',
      'Python',
      'Machine Learning',
      'Deep Learning',
      'GenAI',
      'RAG',
      'MLOps',
    ];

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: skills.map((skill) {
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 9,
          ),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.04),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.10),
            ),
          ),
          child: Text(
            skill,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        );
      }).toList(),
    );
  }
}

//
// ============================================================
// BUTTONS
// ============================================================
//

class _HeroButtons extends StatelessWidget {
  final VoidCallback onProjects;
  final VoidCallback onExperience;
  final bool mobile;

  const _HeroButtons({
    required this.onProjects,
    required this.onExperience,
    this.mobile = false,
  });

  @override
  Widget build(BuildContext context) {
    final projectButton = ElevatedButton.icon(
      onPressed: onProjects,
      icon: const Icon(Icons.arrow_forward_rounded),
      label: const Text('Explore flagship projects'),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.cyan,
        foregroundColor: Colors.black,
        padding: EdgeInsets.symmetric(
          horizontal: mobile ? 22 : 24,
          vertical: 19,
        ),
        textStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w800,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    );

    final experienceButton = OutlinedButton.icon(
      onPressed: onExperience,
      icon: const Icon(Icons.work_outline_rounded),
      label: const Text('View experience'),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: BorderSide(
          color: Colors.white.withValues(alpha: 0.25),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: mobile ? 22 : 24,
          vertical: 19,
        ),
        textStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w800,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    );

    if (mobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          projectButton,
          const SizedBox(height: 14),
          experienceButton,
        ],
      );
    }

    return Wrap(
      spacing: 14,
      runSpacing: 14,
      children: [
        projectButton,
        experienceButton,
      ],
    );
  }
}

//
// ============================================================
// STATS
// ============================================================
//

class _StatsSection extends StatelessWidget {
  const _StatsSection();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 14,
      runSpacing: 14,
      children: const [
        _StatCard(
          value: '5+ yrs',
          label: 'Native Android • Kotlin',
        ),
        _StatCard(
          value: '6+ mos',
          label: 'Flutter Multiplatform',
        ),
        _StatCard(
          value: '4',
          label: 'Flagship AI projects',
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;

  const _StatCard({
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.035),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.09),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: const TextStyle(
              color: AppTheme.cyan,
              fontSize: 27,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white60,
              fontSize: 13,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

//
// ============================================================
// PROFILE IMAGE
// ============================================================
//

class _ProfileImage extends StatelessWidget {
  final double? size;

  const _ProfileImage({
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    final imageSize = size ?? 310.0;

    return Container(
      width: imageSize + 36,
      height: imageSize + 36,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppTheme.cyan.withValues(alpha: 0.35),
          width: 1.5,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppTheme.cyan.withValues(alpha: 0.60),
            width: 2,
          ),
        ),
        child: ClipOval(
          child: Image.asset(
            'assets/images/profile.jpg',
            width: imageSize,
            height: imageSize,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}