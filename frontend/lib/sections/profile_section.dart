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
            title: 'Mobile engineering foundation. Building production AI systems.',
            description:
                'A software engineering journey combining 5+ years of professional Native Android development with Kotlin, Flutter Multiplatform development, and independently built systems across backend engineering, Machine Learning, Deep Learning, Generative AI, RAG, and MLOps.',
          ),

          const SizedBox(height: 34),

          LayoutBuilder(
            builder: (context, constraints) {
              final desktop = constraints.maxWidth >= 900;
              final tablet =
                  constraints.maxWidth >= 600 && constraints.maxWidth < 900;

              final cards = [
                const _ProfileCard(
                  icon: Icons.phone_android_rounded,
                  number: '01',
                  title: 'Professional mobile engineering',
                  description:
                      '5+ years of professional experience in Native Android development using Kotlin, building mobile application experiences, UI implementations, reusable components, and complete product flows. Also experienced in Flutter Multiplatform development.',
                  tags: [
                    'Kotlin',
                    'Android',
                    'Flutter',
                    'Dart',
                    'Multiplatform',
                  ],
                ),

                const _ProfileCard(
                  icon: Icons.layers_rounded,
                  number: '02',
                  title: 'Software & backend engineering',
                  description:
                      'Hands-on engineering experience beyond the mobile layer, building Python backend services, REST APIs, automated tests, Dockerized applications, CI/CD workflows, and deployment-oriented systems.',
                  tags: [
                    'Python',
                    'FastAPI',
                    'REST APIs',
                    'Docker',
                    'Pytest',
                    'CI/CD',
                  ],
                ),

                const _ProfileCard(
                  icon: Icons.auto_awesome_rounded,
                  number: '03',
                  title: 'AI / ML engineering',
                  description:
                      'Building practical AI systems across Machine Learning, Deep Learning, LLM applications, Generative AI, RAG, retrieval, evaluation, model training, and production-oriented MLOps workflows.',
                  tags: [
                    'Machine Learning',
                    'Deep Learning',
                    'GenAI',
                    'LLMs',
                    'RAG',
                    'MLOps',
                  ],
                ),
              ];

              // DESKTOP — 3 columns
              if (desktop) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: cards[0]),
                    const SizedBox(width: 18),

                    Expanded(child: cards[1]),
                    const SizedBox(width: 18),

                    Expanded(child: cards[2]),
                  ],
                );
              }

              // TABLET — 2 columns where possible
              if (tablet) {
                final width = (constraints.maxWidth - 16) / 2;

                return Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    SizedBox(
                      width: width,
                      child: cards[0],
                    ),
                    SizedBox(
                      width: width,
                      child: cards[1],
                    ),
                    SizedBox(
                      width: width,
                      child: cards[2],
                    ),
                  ],
                );
              }

              // MOBILE — 1 column
              return Column(
                children: [
                  cards[0],
                  const SizedBox(height: 16),

                  cards[1],
                  const SizedBox(height: 16),

                  cards[2],
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
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    final isMobile = screenWidth < 600;
    final canHover = !isMobile;

    final padding = isMobile ? 20.0 : 24.0;
    final titleSize = isMobile ? 18.0 : 20.0;
    final descriptionSize = isMobile ? 13.5 : 14.0;

    return MouseRegion(
      onEnter: (_) {
        if (canHover) {
          setState(() => _hovered = true);
        }
      },
      onExit: (_) {
        if (canHover) {
          setState(() => _hovered = false);
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(
          0,
          _hovered ? -5 : 0,
          0,
        ),
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: AppTheme.panel.withValues(alpha: 0.88),
          borderRadius: BorderRadius.circular(
            isMobile ? 20 : 24,
          ),
          border: Border.all(
            color: _hovered
                ? AppTheme.cyan.withValues(alpha: 0.24)
                : Colors.white.withValues(alpha: 0.08),
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: AppTheme.cyan.withValues(alpha: 0.08),
                    blurRadius: 30,
                    spreadRadius: 2,
                  ),
                ]
              : const [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ICON + NUMBER

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: isMobile ? 40 : 42,
                  height: isMobile ? 40 : 42,
                  decoration: BoxDecoration(
                    color: AppTheme.cyan.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Icon(
                    widget.icon,
                    color: AppTheme.cyan,
                    size: isMobile ? 20 : 21,
                  ),
                ),

                Text(
                  widget.number,
                  style: const TextStyle(
                    color: Colors.white24,
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                  ),
                ),
              ],
            ),

            SizedBox(height: isMobile ? 18 : 22),

            // TITLE

            Text(
              widget.title,
              style: TextStyle(
                fontSize: titleSize,
                fontWeight: FontWeight.w800,
                height: 1.2,
              ),
            ),

            const SizedBox(height: 12),

            // DESCRIPTION

            Text(
              widget.description,
              style: TextStyle(
                color: AppTheme.muted,
                height: 1.6,
                fontSize: descriptionSize,
              ),
            ),

            SizedBox(height: isMobile ? 16 : 18),

            // TAGS

            Wrap(
              spacing: 7,
              runSpacing: 7,
              children: widget.tags.map((tag) {
                return _ProfileTag(label: tag);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileTag extends StatelessWidget {
  final String label;

  const _ProfileTag({
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 600;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 10 : 11,
        vertical: isMobile ? 7 : 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.035),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.07),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white60,
          fontSize: isMobile ? 11 : 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}