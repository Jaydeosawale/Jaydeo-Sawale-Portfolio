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
        note: 'Professional experience',
        skills: ['Android', 'Flutter', 'Dart', 'Mobile UI', 'Responsive UI', 'Reusable Widgets'],
      ),
      _SkillGroup(
        title: 'Backend & APIs',
        note: 'Hands-on project experience',
        skills: ['Python', 'FastAPI', 'REST APIs', 'Pydantic', 'API Testing', 'Application Architecture'],
      ),
      _SkillGroup(
        title: 'Machine Learning',
        note: 'Hands-on engineering',
        skills: ['Scikit-learn', 'Classification', 'TF-IDF', 'Logistic Regression', 'Random Forest', 'Model Evaluation'],
      ),
      _SkillGroup(
        title: 'Generative AI',
        note: 'Hands-on project exploration',
        skills: ['LLMs', 'RAG', 'Embeddings', 'Vector Search', 'Semantic Retrieval', 'Prompt Engineering'],
      ),
      _SkillGroup(
        title: 'MLOps & Delivery',
        note: 'Project workflows',
        skills: ['MLflow', 'Docker', 'GitHub Actions', 'CI/CD', 'Pytest', 'Model Tracking', 'Deployment'],
      ),
      _SkillGroup(
        title: 'Engineering Practices',
        note: 'How I work',
        skills: ['Git', 'Testing', 'Documentation', 'Separation of Concerns', 'Reproducibility', 'Iterative Development'],
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
                'Rather than assigning arbitrary proficiency percentages, the portfolio groups technologies by where they are used and how they support the systems I build.',
          ),
          const SizedBox(height: 38),
          LayoutBuilder(
            builder: (context, constraints) {
              final twoColumns = constraints.maxWidth >= 760;
              final width = twoColumns ? (constraints.maxWidth - 16) / 2 : constraints.maxWidth;
              return Wrap(
                spacing: 16,
                runSpacing: 16,
                children: groups.map((group) {
                  return SizedBox(width: width, child: _SkillCard(group: group));
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
  const _SkillGroup({required this.title, required this.note, required this.skills});
}

class _SkillCard extends StatelessWidget {
  final _SkillGroup group;
  const _SkillCard({required this.group});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppTheme.panel,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(group.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
              const Icon(Icons.arrow_outward_rounded, size: 18, color: AppTheme.cyan),
            ],
          ),
          const SizedBox(height: 6),
          Text(group.note, style: const TextStyle(color: Colors.white38, fontSize: 11, fontWeight: FontWeight.w700)),
          const SizedBox(height: 16),
          Wrap(
            spacing: 7,
            runSpacing: 7,
            children: group.skills.map((skill) => SkillChip(label: skill)).toList(),
          ),
        ],
      ),
    );
  }
}
