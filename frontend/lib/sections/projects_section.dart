import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../screens/project_detail_screen.dart';
import '../theme/app_theme.dart';
import '../widgets/project_card.dart';
import '../widgets/section_shell.dart';
import '../widgets/section_title.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            eyebrow: 'Flagship Projects',
            title: 'Four projects. Four different engineering stories.',
            description:
                'Each project is presented as a case study: what the system does, what I built, which technologies matter, and where the engineering can evolve next.',
          ),
          const SizedBox(height: 34),
          LayoutBuilder(
            builder: (context, constraints) {
              final twoColumns = constraints.maxWidth >= 820;
              final width = twoColumns
                  ? (constraints.maxWidth - 18) / 2
                  : constraints.maxWidth;

              return Wrap(
                spacing: 18,
                runSpacing: 18,
                children: projects.map((project) {
                  return SizedBox(
                    width: width,
                    height: 414,
                    child: ProjectCard(
                      project: project,
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => ProjectDetailScreen(project: project),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
          const SizedBox(height: 22),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: AppTheme.cyan.withValues(alpha: 0.045),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: AppTheme.cyan.withValues(alpha: 0.10),
              ),
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.auto_awesome_rounded, color: AppTheme.cyan, size: 20),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'All four projects are treated as flagship work. Their technical emphasis differs: MLOps and ML, mobile application engineering, RAG/GenAI, and broader LLM/agent systems.',
                    style: TextStyle(
                      color: Colors.white60,
                      height: 1.5,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
