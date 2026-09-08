import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/section_shell.dart';
import '../widgets/section_title.dart';

class EngineeringSection extends StatelessWidget {
  const EngineeringSection({super.key});

  @override
  Widget build(BuildContext context) {
    const steps = [
      _Step(
        '01',
        'Understand the problem',
        'Clarify users, constraints, inputs, outputs, and what success should mean.',
      ),
      _Step(
        '02',
        'Design the system',
        'Separate frontend, backend, data, model, and infrastructure responsibilities.',
      ),
      _Step(
        '03',
        'Build the smallest useful version',
        'Start with a simple baseline that can be measured and improved.',
      ),
      _Step(
        '04',
        'Validate behavior',
        'Use tests and measurable model/application signals to catch regressions.',
      ),
      _Step(
        '05',
        'Prepare for delivery',
        'Use Git, Docker, CI/CD, documentation, and deployment workflows to make delivery repeatable.',
      ),
    ];

    return SectionShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            eyebrow: 'Engineering Mindset',
            title: 'From idea to a system that can be tested and shipped.',
            description:
                'The goal is not just to make a model or screen work once. I focus on clear boundaries, measurable behavior, repeatable workflows, and gradual improvement.',
          ),

          const SizedBox(height: 32),

          ...steps.asMap().entries.map((entry) {
            final index = entry.key;
            final step = entry.value;

            return Padding(
              padding: EdgeInsets.only(
                bottom: index == steps.length - 1 ? 0 : 12,
              ),
              child: _StepCard(step: step),
            );
          }),
        ],
      ),
    );
  }
}

class _Step {
  final String number;
  final String title;
  final String description;

  const _Step(
    this.number,
    this.title,
    this.description,
  );
}

class _StepCard extends StatelessWidget {
  final _Step step;

  const _StepCard({
    required this.step,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;

        return Container(
          padding: EdgeInsets.all(isMobile ? 18 : 22),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.025),
            borderRadius: BorderRadius.circular(
              isMobile ? 18 : 20,
            ),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.06),
            ),
          ),
          child: isMobile
              ? _MobileStepLayout(step: step)
              : _DesktopStepLayout(step: step),
        );
      },
    );
  }
}

// ============================================================
// MOBILE LAYOUT
// ============================================================

class _MobileStepLayout extends StatelessWidget {
  final _Step step;

  const _MobileStepLayout({
    required this.step,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            color: AppTheme.cyan.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            step.number,
            style: const TextStyle(
              color: AppTheme.cyan,
              fontWeight: FontWeight.w900,
              fontSize: 12,
            ),
          ),
        ),

        const SizedBox(height: 14),

        Text(
          step.title,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w900,
            height: 1.2,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          step.description,
          style: const TextStyle(
            color: AppTheme.muted,
            height: 1.6,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

// ============================================================
// TABLET + DESKTOP LAYOUT
// ============================================================

class _DesktopStepLayout extends StatelessWidget {
  final _Step step;

  const _DesktopStepLayout({
    required this.step,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 52,
          child: Text(
            step.number,
            style: const TextStyle(
              color: AppTheme.cyan,
              fontWeight: FontWeight.w900,
              fontSize: 12,
            ),
          ),
        ),

        const SizedBox(width: 14),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                step.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),

              const SizedBox(height: 7),

              Text(
                step.description,
                style: const TextStyle(
                  color: AppTheme.muted,
                  height: 1.55,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}