import 'package:flutter/material.dart';
import 'sections/contact_section.dart';
import 'sections/engineering_section.dart';
import 'sections/experience_section.dart';
import 'sections/hero_section.dart';
import 'sections/profile_section.dart';
import 'sections/projects_section.dart';
import 'sections/skills_section.dart';
import 'theme/app_theme.dart';
import 'widgets/animated_background.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jaydeo Sawale — Software Engineer | AI/ML & Mobile',
      theme: AppTheme.dark(),
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  final _homeKey = GlobalKey();
    late final AnimationController _navController;

  @override
  void initState() {
    super.initState();
    _navController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..forward();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _navController.dispose();
    super.dispose();
  }

  void _goTo(GlobalKey key) {
    final target = key.currentContext;
    if (target == null) return;
    Scrollable.ensureVisible(
      target,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeOutCubic,
      alignment: 0.08,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
        child: FadeTransition(
          opacity: CurvedAnimation(parent: _navController, curve: Curves.easeOut),
          child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverAppBar(
                  pinned: true,
                  toolbarHeight: 70,
                  automaticallyImplyLeading: false,
                  titleSpacing: 24,
                  title: _NavBar(onNavigate: _goTo),
                ),
                SliverToBoxAdapter(
                  child: KeyedSubtree(
                    key: _homeKey,
                    child: HeroSection(
                      onProjects: () => _goTo(_globalProjectsKey),
                      onExperience: () => _goTo(_globalExperienceKey),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: KeyedSubtree(key: _globalProfileKey, child: const ProfileSection()),
                ),
                SliverToBoxAdapter(
                  child: KeyedSubtree(key: _globalExperienceKey, child: const ExperienceSection()),
                ),
                SliverToBoxAdapter(
                  child: KeyedSubtree(key: _globalProjectsKey, child: const ProjectsSection()),
                ),
                SliverToBoxAdapter(
                  child: KeyedSubtree(key: _globalSkillsKey, child: const SkillsSection()),
                ),
                SliverToBoxAdapter(child: const EngineeringSection()),
                SliverToBoxAdapter(child: const _CurrentFocusSection()),
                SliverToBoxAdapter(
                  child: KeyedSubtree(key: _globalContactKey, child: const ContactSection()),
                ),
                const SliverToBoxAdapter(child: _Footer()),
              ],
            ),
        ),
      ),
    );
  }
}

class _NavBar extends StatelessWidget {
  final void Function(GlobalKey key) onNavigate;

  const _NavBar({required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final compact = MediaQuery.sizeOf(context).width < 920;

    if (compact) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const _Brand(),
          PopupMenuButton<String>(
            tooltip: 'Navigation',
            icon: const Icon(Icons.menu_rounded),
            onSelected: (value) {
              final map = <String, GlobalKey>{
                'About': _globalProfileKey,
                'Experience': _globalExperienceKey,
                'Projects': _globalProjectsKey,
                'Skills': _globalSkillsKey,
                'Contact': _globalContactKey,
              };
              final key = map[value];
              if (key != null) onNavigate(key);
            },
            itemBuilder: (context) => const [
              PopupMenuItem(value: 'About', child: Text('About')),
              PopupMenuItem(value: 'Experience', child: Text('Experience')),
              PopupMenuItem(value: 'Projects', child: Text('Projects')),
              PopupMenuItem(value: 'Skills', child: Text('Skills')),
              PopupMenuItem(value: 'Contact', child: Text('Contact')),
            ],
          ),
        ],
      );
    }

    return Row(
      children: [
        const _Brand(),
        const Spacer(),
        _NavItem(label: 'About', onPressed: () => onNavigate(_globalProfileKey)),
        _NavItem(label: 'Experience', onPressed: () => onNavigate(_globalExperienceKey)),
        _NavItem(label: 'Projects', onPressed: () => onNavigate(_globalProjectsKey)),
        _NavItem(label: 'Skills', onPressed: () => onNavigate(_globalSkillsKey)),
        _NavItem(label: 'Contact', onPressed: () => onNavigate(_globalContactKey)),
      ],
    );
  }
}

final _globalProfileKey = GlobalKey();
final _globalExperienceKey = GlobalKey();
final _globalProjectsKey = GlobalKey();
final _globalSkillsKey = GlobalKey();
final _globalContactKey = GlobalKey();

class _Brand extends StatelessWidget {
  const _Brand();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'JS.',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w900,
        color: AppTheme.cyan,
        letterSpacing: -1,
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const _NavItem({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(foregroundColor: Colors.white70),
      child: Text(label),
    );
  }
}

class _CurrentFocusSection extends StatelessWidget {
  const _CurrentFocusSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 72),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1180),
          child: Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.025),
              borderRadius: BorderRadius.circular(28),
              border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('CURRENT FOCUS', style: TextStyle(color: AppTheme.cyan, fontSize: 11, fontWeight: FontWeight.w900, letterSpacing: 2)),
                const SizedBox(height: 13),
                const Text('Growing from software engineering into AI engineering.', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900)),
                const SizedBox(height: 14),
                const Text(
                  'Deepening foundations in Machine Learning and Deep Learning while building stronger capability in LLM applications, RAG, evaluation, MLOps, and production-oriented AI systems.',
                  style: TextStyle(color: AppTheme.muted, height: 1.7),
                ),
                const SizedBox(height: 22),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: const [
                    _MiniTag('Machine Learning'),
                    _MiniTag('Deep Learning'),
                    _MiniTag('Transformers'),
                    _MiniTag('LLMs'),
                    _MiniTag('RAG'),
                    _MiniTag('MLOps'),
                    _MiniTag('Evaluation'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 36),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1180),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Jaydeo Sawale', style: TextStyle(fontWeight: FontWeight.w800)),
              Text('Software Engineer • AI / ML • Mobile', style: TextStyle(color: Colors.white38, fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}
class _MiniTag extends StatelessWidget {
  final String label;

  const _MiniTag(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.10),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}