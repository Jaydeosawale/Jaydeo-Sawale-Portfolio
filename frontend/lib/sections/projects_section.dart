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
            title: 'Four projects. Four engineering stories.',
            description:
                'A portfolio of practical systems spanning Machine Learning, MLOps, Generative AI, RAG, backend engineering, and Flutter Multiplatform application development. Each project is presented as a case study covering the problem, architecture, technologies, engineering decisions, and future evolution.',
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
                    child: ProjectCard(
                      project: project,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) =>
                                ProjectDetailScreen(project: project),
                          ),
                        );
                      },
                    ),
                  );
                }).toList(),
              );
            },
          ),

          const SizedBox(height: 22),

          _ProjectsInfoCard(),
        ],
      ),
    );
  }
}

class _ProjectsInfoCard extends StatelessWidget {
  const _ProjectsInfoCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppTheme.cyan.withValues(alpha: 0.045),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppTheme.cyan.withValues(alpha: 0.10),
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 500;

          if (isMobile) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.auto_awesome_rounded,
                  color: AppTheme.cyan,
                  size: 20,
                ),
                SizedBox(height: 12),
                Text(
                  'The projects represent different areas of modern software and AI engineering: Machine Learning and MLOps, message safety systems, Generative AI and RAG, and Flutter Multiplatform applications integrated with backend and AI technologies.',
                  style: TextStyle(
                    color: Colors.white60,
                    height: 1.5,
                    fontSize: 12,
                  ),
                ),
              ],
            );
          }

          return const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.auto_awesome_rounded,
                color: AppTheme.cyan,
                size: 20,
              ),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'The projects represent different areas of modern software and AI engineering: Machine Learning and MLOps, message safety systems, Generative AI and RAG, and Flutter Multiplatform applications integrated with backend and AI technologies.',
                  style: TextStyle(
                    color: Colors.white60,
                    height: 1.5,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}