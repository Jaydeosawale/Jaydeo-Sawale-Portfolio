import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/section_shell.dart';
import '../widgets/section_title.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            eyebrow: 'Professional Profile',
            title: 'Mobile experience. Expanding into AI engineering.',
            description:
                'A practical engineering journey that combines a professional foundation in Android and Flutter development with independently built backend, Machine Learning, Generative AI, and MLOps projects.',
          ),
          const SizedBox(height: 34),
          LayoutBuilder(
            builder: (context, constraints) {
              final wide = constraints.maxWidth > 820;
              final cards = [
                _ProfileCard(
                  icon: Icons.phone_android_rounded,
                  number: '01',
                  title: 'Professional mobile engineering',
                  description:
                      '5+ years of Android development experience and 6+ months of Flutter development, focused on frontend application experiences, UI implementation, reusable components, and product flows.',
                  tags: const ['Android', 'Flutter', 'Dart', 'Mobile UI'],
                ),
                _ProfileCard(
                  icon: Icons.layers_rounded,
                  number: '02',
                  title: 'Independent software engineering',
                  description:
                      'Hands-on project work extending beyond the mobile layer into Python backend services, REST APIs, testing, Docker, CI/CD, and deployment-oriented workflows.',
                  tags: const ['Python', 'FastAPI', 'REST APIs', 'Docker', 'Pytest'],
                ),
                _ProfileCard(
                  icon: Icons.auto_awesome_rounded,
                  number: '03',
                  title: 'AI / ML engineering direction',
                  description:
                      'Building practical systems around Machine Learning, Deep Learning, LLM applications, RAG, retrieval, evaluation, and MLOps practices.',
                  tags: const ['ML', 'Deep Learning', 'LLMs', 'RAG', 'MLOps'],
                ),
              ];

              if (wide) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: cards[0]),
                    const SizedBox(width: 16),
                    Expanded(child: cards[1]),
                    const SizedBox(width: 16),
                    Expanded(child: cards[2]),
                  ],
                );
              }

              return Column(
                children: [
                  for (var i = 0; i < cards.length; i++) ...[
                    cards[i],
                    if (i != cards.length - 1) const SizedBox(height: 16),
                  ],
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ProfileCard extends StatefulWidget {
  final IconData icon;
  final String number;
  final String title;
  final String description;
  final List<String> tags;

  const _ProfileCard({
    required this.icon,
    required this.number,
    required this.title,
    required this.description,
    required this.tags,
  });

  @override
  State<_ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<_ProfileCard> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        transform: Matrix4.translationValues(0, hovered ? -5 : 0, 0),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppTheme.panel.withValues(alpha: 0.88),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: hovered ? AppTheme.cyan.withValues(alpha: 0.24) : Colors.white.withValues(alpha: 0.08),
          ),
          boxShadow: hovered
              ? [BoxShadow(color: AppTheme.cyan.withValues(alpha: 0.08), blurRadius: 30, spreadRadius: 2)]
              : const [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: AppTheme.cyan.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Icon(widget.icon, color: AppTheme.cyan, size: 21),
                ),
                Text(widget.number, style: const TextStyle(color: Colors.white24, fontWeight: FontWeight.w900, fontSize: 14)),
              ],
            ),
            const SizedBox(height: 22),
            Text(widget.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
            const SizedBox(height: 12),
            Text(widget.description, style: const TextStyle(color: AppTheme.muted, height: 1.6, fontSize: 14)),
            const SizedBox(height: 18),
            Wrap(
              spacing: 7,
              runSpacing: 7,
              children: widget.tags
                  .map((tag) => Chip(
                        label: Text(tag),
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        side: BorderSide(color: Colors.white.withValues(alpha: 0.06)),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
