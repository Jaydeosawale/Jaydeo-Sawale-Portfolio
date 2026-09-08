import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/section_shell.dart';
import '../widgets/section_title.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            eyebrow: 'Experience',
            title: 'A professional foundation in mobile engineering.',
            description:
                'My professional experience is rooted in Native Android development using Kotlin and Flutter Multiplatform development. Independent AI/ML, backend, GenAI, and MLOps projects are presented separately to clearly distinguish professional experience from personal engineering work.',
          ),

          const SizedBox(height: 38),

          const _ExperienceItem(
            index: '01',
            title: 'Native Android Development',
            company: 'eNyota Learning Pvt. Ltd.',
            duration: '5+ years',
            description:
                'Professional Native Android application development using Kotlin, focused on frontend implementation, mobile UI, application screens, user flows, feature delivery, reusable components, and maintainable client-side application code.',
            tags: [
              'Native Android',
              'Kotlin',
              'Android SDK',
              'Mobile UI',
              'Application Development',
              'Feature Delivery',
            ],
          ),

          const SizedBox(height: 18),

          const _ExperienceItem(
            index: '02',
            title: 'Flutter Multiplatform Development',
            company: 'eNyota Learning Pvt. Ltd.',
            duration: '6+ months',
            description:
                'Professional Flutter development focused on building multiplatform application experiences with responsive layouts, reusable widgets, structured application screens, and user-facing product flows.',
            tags: [
              'Flutter',
              'Dart',
              'Multiplatform',
              'Responsive UI',
              'Reusable Widgets',
              'Mobile Applications',
            ],
          ),

          const SizedBox(height: 18),

          const _CompanyProductsCard(),

          const SizedBox(height: 18),

          const _IndependentCard(),
        ],
      ),
    );
  }
}

// ============================================================
// EXPERIENCE ITEM
// ============================================================

class _ExperienceItem extends StatelessWidget {
  final String index;
  final String title;
  final String company;
  final String duration;
  final String description;
  final List<String> tags;

  const _ExperienceItem({
    required this.index,
    required this.title,
    required this.company,
    required this.duration,
    required this.description,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 900;

    final padding = isMobile ? 20.0 : 26.0;

    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: AppTheme.panel.withValues(alpha: 0.88),
        borderRadius: BorderRadius.circular(
          isMobile ? 22 : 26,
        ),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.07),
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final wide = constraints.maxWidth >= 760 && !isTablet;

          final header = _ExperienceHeader(
            index: index,
            title: title,
            company: company,
            duration: duration,
            isMobile: isMobile,
            showDurationInline: !wide,
          );

          final details = _ExperienceDetails(
            description: description,
            tags: tags,
            duration: duration,
            showDuration: wide,
            isMobile: isMobile,
          );

          // DESKTOP
          if (wide) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 240,
                  child: header,
                ),

                const SizedBox(width: 32),

                Expanded(
                  child: details,
                ),
              ],
            );
          }

          // MOBILE + TABLET
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header,

              SizedBox(height: isMobile ? 20 : 24),

              details,
            ],
          );
        },
      ),
    );
  }
}

// ============================================================
// EXPERIENCE HEADER
// ============================================================

class _ExperienceHeader extends StatelessWidget {
  final String index;
  final String title;
  final String company;
  final String duration;
  final bool isMobile;
  final bool showDurationInline;

  const _ExperienceHeader({
    required this.index,
    required this.title,
    required this.company,
    required this.duration,
    required this.isMobile,
    required this.showDurationInline,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // NUMBER + MOBILE DURATION

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              index,
              style: const TextStyle(
                color: AppTheme.cyan,
                fontSize: 12,
                fontWeight: FontWeight.w900,
                letterSpacing: 2,
              ),
            ),

            if (showDurationInline)
              Text(
                duration,
                style: const TextStyle(
                  color: AppTheme.cyan,
                  fontWeight: FontWeight.w900,
                  fontSize: 13,
                ),
              ),
          ],
        ),

        const SizedBox(height: 12),

        Text(
          title,
          style: TextStyle(
            fontSize: isMobile ? 22 : 26,
            fontWeight: FontWeight.w900,
            height: 1.15,
          ),
        ),

        const SizedBox(height: 9),

        Text(
          company,
          style: TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.w700,
            fontSize: isMobile ? 14 : 15,
          ),
        ),
      ],
    );
  }
}

// ============================================================
// EXPERIENCE DETAILS
// ============================================================

class _ExperienceDetails extends StatelessWidget {
  final String description;
  final List<String> tags;
  final String duration;
  final bool showDuration;
  final bool isMobile;

  const _ExperienceDetails({
    required this.description,
    required this.tags,
    required this.duration,
    required this.showDuration,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showDuration) ...[
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              duration,
              style: const TextStyle(
                color: AppTheme.cyan,
                fontWeight: FontWeight.w900,
                fontSize: 14,
              ),
            ),
          ),

          const SizedBox(height: 18),
        ],

        Text(
          description,
          style: TextStyle(
            color: AppTheme.muted,
            height: 1.65,
            fontSize: isMobile ? 14 : 15,
          ),
        ),

        SizedBox(height: isMobile ? 18 : 20),

        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: tags.map((tag) {
            return _ExperienceTag(
              label: tag,
              isMobile: isMobile,
            );
          }).toList(),
        ),
      ],
    );
  }
}

// ============================================================
// TAG
// ============================================================

class _ExperienceTag extends StatelessWidget {
  final String label;
  final bool isMobile;

  const _ExperienceTag({
    required this.label,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 10 : 12,
        vertical: isMobile ? 7 : 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.07),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white70,
          fontSize: isMobile ? 11 : 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

// ============================================================
// COMPANY PRODUCTS
// ============================================================

class _CompanyProductsCard extends StatelessWidget {
  const _CompanyProductsCard();

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 600;

    const products = [
      'ABARA LMS',
      'My LearningHub',
      'ABARA Lite',
      'Current Company Application',
    ];

    return Container(
      padding: EdgeInsets.all(isMobile ? 20 : 26),
      decoration: BoxDecoration(
        color: AppTheme.panel.withValues(alpha: 0.80),
        borderRadius: BorderRadius.circular(
          isMobile ? 22 : 26,
        ),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.07),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'SELECTED COMPANY PRODUCTS',
            style: TextStyle(
              color: Colors.white38,
              fontSize: 11,
              fontWeight: FontWeight.w900,
              letterSpacing: 2,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            'Professional application work',
            style: TextStyle(
              fontSize: isMobile ? 20 : 22,
              fontWeight: FontWeight.w900,
            ),
          ),

          const SizedBox(height: 16),

          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: products.map((name) {
              return Container(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 11 : 13,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.035),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.06),
                  ),
                ),
                child: Text(
                  name,
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w700,
                    fontSize: isMobile ? 11 : 12,
                  ),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 16),

          const Text(
            'These applications represent professional company work and are presented as part of my employment experience rather than as personal portfolio projects.',
            style: TextStyle(
              color: Colors.white38,
              height: 1.5,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// INDEPENDENT ENGINEERING
// ============================================================

class _IndependentCard extends StatelessWidget {
  const _IndependentCard();

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 600;

    return Container(
      padding: EdgeInsets.all(isMobile ? 20 : 26),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          isMobile ? 22 : 26,
        ),
        gradient: LinearGradient(
          colors: [
            AppTheme.cyan.withValues(alpha: 0.09),
            AppTheme.violet.withValues(alpha: 0.07),
          ],
        ),
        border: Border.all(
          color: AppTheme.cyan.withValues(alpha: 0.14),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'INDEPENDENT ENGINEERING',
            style: TextStyle(
              color: AppTheme.cyan,
              fontSize: 11,
              fontWeight: FontWeight.w900,
              letterSpacing: 2,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            'Expanding from mobile engineering into AI systems',
            style: TextStyle(
              fontSize: isMobile ? 21 : 24,
              fontWeight: FontWeight.w900,
              height: 1.2,
            ),
          ),

          const SizedBox(height: 14),

          Text(
            'Alongside professional mobile engineering experience, I independently design and build end-to-end projects across Python backend development, Machine Learning, Deep Learning foundations, Generative AI, RAG, LLM applications, testing, Docker, CI/CD, MLOps workflows, and deployment-oriented engineering.',
            style: TextStyle(
              color: AppTheme.muted,
              height: 1.65,
              fontSize: isMobile ? 14 : 15,
            ),
          ),
        ],
      ),
    );
  }
}