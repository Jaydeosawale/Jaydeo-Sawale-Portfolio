import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/section_shell.dart';
import '../widgets/section_title.dart';
import '../widgets/skill_chip.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    const groups = [
      _SkillGroup(
        title: 'Mobile Engineering',
        note: 'Professional development experience',
        skills: [
          'Native Android',
          'Kotlin',
          'Android SDK',
          'Flutter',
          'Dart',
          'Flutter Multiplatform',
          'Mobile UI',
          'Reusable Components',
        ],
      ),
      _SkillGroup(
        title: 'Backend & APIs',
        note: 'Hands-on engineering projects',
        skills: [
          'Python',
          'FastAPI',
          'REST APIs',
          'Pydantic',
          'API Testing',
          'Backend Architecture',
        ],
      ),
      _SkillGroup(
        title: 'Machine Learning',
        note: 'Hands-on engineering and projects',
        skills: [
          'Scikit-learn',
          'Classification',
          'TF-IDF',
          'Logistic Regression',
          'Random Forest',
          'Model Training',
          'Model Evaluation',
        ],
      ),
      _SkillGroup(
        title: 'Deep Learning',
        note: 'Current learning and practical development',
        skills: [
          'Neural Networks',
          'Deep Learning Fundamentals',
          'Transformers',
          'Model Architectures',
          'Training Concepts',
        ],
      ),
      _SkillGroup(
        title: 'Generative AI & RAG',
        note: 'Hands-on project development',
        skills: [
          'LLMs',
          'Generative AI',
          'RAG',
          'Embeddings',
          'Vector Search',
          'Semantic Retrieval',
          'Prompt Engineering',
        ],
      ),
      _SkillGroup(
        title: 'MLOps & Delivery',
        note: 'Production-oriented project workflows',
        skills: [
          'MLflow',
          'Docker',
          'GitHub Actions',
          'CI/CD',
          'Pytest',
          'Model Tracking',
          'Data Validation',
          'Deployment',
        ],
      ),
      _SkillGroup(
        title: 'Engineering Practices',
        note: 'How I build systems',
        skills: [
          'Git',
          'GitHub',
          'Testing',
          'Documentation',
          'Separation of Concerns',
          'Reproducibility',
          'Iterative Development',
        ],
      ),
    ];

    return SectionShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            eyebrow: 'Technical Toolkit',
            title: 'Skills organized by engineering responsibility.',
            description:
                'My technical toolkit spans Native Android and Flutter Multiplatform development, backend engineering, Machine Learning, Deep Learning, Generative AI, RAG, and production-oriented MLOps workflows.',
          ),

          const SizedBox(height: 32),

          LayoutBuilder(
            builder: (context, constraints) {
              final twoColumns = constraints.maxWidth >= 760;

              final width = twoColumns
                  ? (constraints.maxWidth - 16) / 2
                  : constraints.maxWidth;

              return Wrap(
                spacing: 16,
                runSpacing: 16,
                children: groups.map((group) {
                  return SizedBox(
                    width: width,
                    child: _SkillCard(group: group),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _SkillGroup {
  final String title;
  final String note;
  final List<String> skills;

  const _SkillGroup({
    required this.title,
    required this.note,
    required this.skills,
  });
}

class _SkillCard extends StatelessWidget {
  final _SkillGroup group;

  const _SkillCard({
    required this.group,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 500;

        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(isMobile ? 18 : 22),
          decoration: BoxDecoration(
            color: AppTheme.panel,
            borderRadius: BorderRadius.circular(
              isMobile ? 20 : 22,
            ),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.07),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ==========================================================
              // CARD HEADER
              // ==========================================================

              if (isMobile)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.arrow_outward_rounded,
                      size: 18,
                      color: AppTheme.cyan,
                    ),

                    const SizedBox(height: 12),

                    Text(
                      group.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        height: 1.2,
                      ),
                    ),
                  ],
                )
              else
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        group.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          height: 1.2,
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    const Icon(
                      Icons.arrow_outward_rounded,
                      size: 18,
                      color: AppTheme.cyan,
                    ),
                  ],
                ),

              const SizedBox(height: 7),

              // ==========================================================
              // NOTE
              // ==========================================================

              Text(
                group.note,
                style: const TextStyle(
                  color: Colors.white38,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 16),

              // ==========================================================
              // SKILLS
              // ==========================================================

              Wrap(
                spacing: 7,
                runSpacing: 7,
                children: group.skills
                    .map(
                      (skill) => SkillChip(
                        label: skill,
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}