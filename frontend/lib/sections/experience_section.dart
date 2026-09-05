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
                'Professional experience is presented separately from independent AI/ML and backend project work so the scope of each area is clear.',
          ),
          const SizedBox(height: 38),
          const _ExperienceItem(
            index: '01',
            title: 'Android Development',
            company: 'eNyota Learning Pvt. Ltd.',
            duration: '5+ years',
            description:
                'Professional Android application development with a focus on frontend implementation, mobile UI, application screens, user flows, feature delivery, and maintainable client-side code.',
            tags: ['Android', 'Mobile UI', 'Frontend Development', 'Application Development'],
          ),
          const SizedBox(height: 18),
          const _ExperienceItem(
            index: '02',
            title: 'Flutter Development',
            company: 'eNyota Learning Pvt. Ltd.',
            duration: '6+ months',
            description:
                'Professional Flutter development focused on cross-platform frontend experiences, responsive layouts, reusable widgets, application screens, and user-facing product flows.',
            tags: ['Flutter', 'Dart', 'Cross-platform', 'Reusable UI'],
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
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(26),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final wide = constraints.maxWidth > 760;
            final left = Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(index, style: const TextStyle(color: AppTheme.cyan, fontSize: 12, fontWeight: FontWeight.w900, letterSpacing: 2)),
                const SizedBox(height: 10),
                Text(title, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w900)),
                const SizedBox(height: 7),
                Text(company, style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.w700)),
              ],
            );
            final right = Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Text(duration, style: const TextStyle(color: AppTheme.cyan, fontWeight: FontWeight.w900)),
                ),
                const SizedBox(height: 18),
                Text(description, style: const TextStyle(color: AppTheme.muted, height: 1.65)),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: tags.map((tag) => Chip(label: Text(tag))).toList(),
                ),
              ],
            );

            if (wide) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 250, child: left),
                  const SizedBox(width: 30),
                  Expanded(child: right),
                ],
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                left,
                const SizedBox(height: 20),
                right,
              ],
            );
          },
        ),
      ),
    );
  }
}


class _CompanyProductsCard extends StatelessWidget {
  const _CompanyProductsCard();

  @override
  Widget build(BuildContext context) {
    const products = [
      'ABARA LMS',
      'My LearningHub',
      'ABARA Lite',
      'Current Company Application',
    ];

    return Container(
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
        color: AppTheme.panel.withValues(alpha: 0.80),
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'SELECTED COMPANY PRODUCTS',
            style: TextStyle(color: Colors.white38, fontSize: 11, fontWeight: FontWeight.w900, letterSpacing: 2),
          ),
          const SizedBox(height: 12),
          const Text(
            'Professional application work',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: products.map((name) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.035),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
                ),
                child: Text(name, style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.w700, fontSize: 12)),
              );
            }).toList(),
          ),
          const SizedBox(height: 14),
          const Text(
            'These are company projects shown as part of professional experience, not personal portfolio projects.',
            style: TextStyle(color: Colors.white38, height: 1.45, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _IndependentCard extends StatelessWidget {
  const _IndependentCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        gradient: LinearGradient(
          colors: [AppTheme.cyan.withValues(alpha: 0.09), AppTheme.violet.withValues(alpha: 0.07)],
        ),
        border: Border.all(color: AppTheme.cyan.withValues(alpha: 0.14)),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('INDEPENDENT ENGINEERING', style: TextStyle(color: AppTheme.cyan, fontSize: 11, fontWeight: FontWeight.w900, letterSpacing: 2)),
          SizedBox(height: 12),
          Text('AI, backend and MLOps project work', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
          SizedBox(height: 12),
          Text(
            'Independently designed and built projects beyond the mobile frontend layer, including Python backend services, Machine Learning workflows, Generative AI applications, testing, Docker, CI/CD, model workflows, and cloud deployment.',
            style: TextStyle(color: AppTheme.muted, height: 1.65),
          ),
        ],
      ),
    );
  }
}
