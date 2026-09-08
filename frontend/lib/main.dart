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

class _PortfolioHomeState extends State<PortfolioHome>
    with SingleTickerProviderStateMixin {
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

  // ------------------------------------------------------------
  // RESPONSIVE SCROLL NAVIGATION
  // Keeps section headings below the pinned navigation bar.
  // ------------------------------------------------------------
  void _goTo(GlobalKey key) {
    final targetContext = key.currentContext;

    if (targetContext == null) return;

    final renderObject = targetContext.findRenderObject();

    if (renderObject == null) return;

    final viewport = RenderAbstractViewport.of(renderObject);

    if (viewport == null) return;

    final mediaQuery = MediaQuery.of(context);

    final topSafeArea = mediaQuery.padding.top;

    final navHeight = MediaQuery.sizeOf(context).width < 920
        ? 70.0 + topSafeArea
        : 70.0;

    final reveal = viewport.getOffsetToReveal(
      renderObject,
      0.0,
    );

    final targetOffset = (reveal.offset - navHeight - 16).clamp(
      0.0,
      _scrollController.position.maxScrollExtent,
    );

    _scrollController.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AnimatedBackground(
        child: FadeTransition(
          opacity: CurvedAnimation(
            parent: _navController,
            curve: Curves.easeOut,
          ),
          child: CustomScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            slivers: [
              // --------------------------------------------------
              // PINNED NAVIGATION
              // --------------------------------------------------
              SliverAppBar(
                pinned: true,
                automaticallyImplyLeading: false,
                toolbarHeight: 70,
                expandedHeight: 70,
                elevation: 0,
                scrolledUnderElevation: 0,
                backgroundColor: const Color(0xDD080D16),
                surfaceTintColor: Colors.transparent,
                shadowColor: Colors.transparent,
                titleSpacing: 0,
                title: const _NavBar(),
              ),

              // Small separation after pinned navigation.
              const SliverToBoxAdapter(
                child: SizedBox(height: 8),
              ),

              // --------------------------------------------------
              // HERO
              // --------------------------------------------------
              SliverToBoxAdapter(
                child: KeyedSubtree(
                  key: _homeKey,
                  child: HeroSection(
                    onProjects: () => _goTo(_globalProjectsKey),
                    onExperience: () => _goTo(_globalExperienceKey),
                  ),
                ),
              ),

              // --------------------------------------------------
              // PROFILE
              // --------------------------------------------------
              SliverToBoxAdapter(
                child: KeyedSubtree(
                  key: _globalProfileKey,
                  child: const ProfileSection(),
                ),
              ),

              // --------------------------------------------------
              // EXPERIENCE
              // --------------------------------------------------
              SliverToBoxAdapter(
                child: KeyedSubtree(
                  key: _globalExperienceKey,
                  child: const ExperienceSection(),
                ),
              ),

              // --------------------------------------------------
              // PROJECTS
              // --------------------------------------------------
              SliverToBoxAdapter(
                child: KeyedSubtree(
                  key: _globalProjectsKey,
                  child: const ProjectsSection(),
                ),
              ),

              // --------------------------------------------------
              // SKILLS
              // --------------------------------------------------
              SliverToBoxAdapter(
                child: KeyedSubtree(
                  key: _globalSkillsKey,
                  child: const SkillsSection(),
                ),
              ),

              // --------------------------------------------------
              // ENGINEERING
              // --------------------------------------------------
              const SliverToBoxAdapter(
                child: EngineeringSection(),
              ),

              // --------------------------------------------------
              // CURRENT FOCUS
              // --------------------------------------------------
              const SliverToBoxAdapter(
                child: _CurrentFocusSection(),
              ),

              // --------------------------------------------------
              // CONTACT
              // --------------------------------------------------
              SliverToBoxAdapter(
                child: KeyedSubtree(
                  key: _globalContactKey,
                  child: const ContactSection(),
                ),
              ),

              // --------------------------------------------------
              // FOOTER
              // --------------------------------------------------
              const SliverToBoxAdapter(
                child: _Footer(),
              ),

              // Bottom breathing room for mobile browsers.
              const SliverToBoxAdapter(
                child: SizedBox(height: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ================================================================
// NAVIGATION
// ================================================================

class _NavBar extends StatelessWidget {
  const _NavBar();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    final compact = width < 920;

    if (compact) {
      return const _MobileNavBar();
    }

    return const _DesktopNavBar();
  }
}

// ================================================================
// MOBILE NAVIGATION
// ================================================================

class _MobileNavBar extends StatelessWidget {
  const _MobileNavBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const _Brand(),

          PopupMenuButton<String>(
            tooltip: 'Open navigation',
            icon: const Icon(
              Icons.menu_rounded,
              size: 31,
              color: Colors.white,
            ),
            color: AppTheme.panel,
            elevation: 12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            onSelected: (value) {
              final map = <String, GlobalKey>{
                'About': _globalProfileKey,
                'Experience': _globalExperienceKey,
                'Projects': _globalProjectsKey,
                'Skills': _globalSkillsKey,
                'Contact': _globalContactKey,
              };

              final key = map[value];

              if (key == null) return;

              final state = context.findAncestorStateOfType<
                  _PortfolioHomeState>();

              state?._goTo(key);
            },
            itemBuilder: (context) {
              return const [
                PopupMenuItem(
                  value: 'About',
                  child: _MenuItem(
                    icon: Icons.person_outline_rounded,
                    label: 'About',
                  ),
                ),
                PopupMenuItem(
                  value: 'Experience',
                  child: _MenuItem(
                    icon: Icons.work_outline_rounded,
                    label: 'Experience',
                  ),
                ),
                PopupMenuItem(
                  value: 'Projects',
                  child: _MenuItem(
                    icon: Icons.folder_outlined,
                    label: 'Projects',
                  ),
                ),
                PopupMenuItem(
                  value: 'Skills',
                  child: _MenuItem(
                    icon: Icons.code_rounded,
                    label: 'Skills',
                  ),
                ),
                PopupMenuItem(
                  value: 'Contact',
                  child: _MenuItem(
                    icon: Icons.mail_outline_rounded,
                    label: 'Contact',
                  ),
                ),
              ];
            },
          ),
        ],
      ),
    );
  }
}

// ================================================================
// DESKTOP NAVIGATION
// ================================================================

class _DesktopNavBar extends StatelessWidget {
  const _DesktopNavBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          const _Brand(),

          const Spacer(),

          _NavItem(
            label: 'About',
            onPressed: () {
              final state =
                  context.findAncestorStateOfType<_PortfolioHomeState>();
              state?._goTo(_globalProfileKey);
            },
          ),

          _NavItem(
            label: 'Experience',
            onPressed: () {
              final state =
                  context.findAncestorStateOfType<_PortfolioHomeState>();
              state?._goTo(_globalExperienceKey);
            },
          ),

          _NavItem(
            label: 'Projects',
            onPressed: () {
              final state =
                  context.findAncestorStateOfType<_PortfolioHomeState>();
              state?._goTo(_globalProjectsKey);
            },
          ),

          _NavItem(
            label: 'Skills',
            onPressed: () {
              final state =
                  context.findAncestorStateOfType<_PortfolioHomeState>();
              state?._goTo(_globalSkillsKey);
            },
          ),

          _NavItem(
            label: 'Contact',
            onPressed: () {
              final state =
                  context.findAncestorStateOfType<_PortfolioHomeState>();
              state?._goTo(_globalContactKey);
            },
          ),
        ],
      ),
    );
  }
}

// ================================================================
// MENU ITEM
// ================================================================

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _MenuItem({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 19,
          color: AppTheme.cyan,
        ),
        const SizedBox(width: 12),
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

// ================================================================
// BRAND
// ================================================================

class _Brand extends StatelessWidget {
  const _Brand();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'JS.',
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w900,
        color: AppTheme.cyan,
        letterSpacing: -1.2,
      ),
    );
  }
}

// ================================================================
// DESKTOP NAV ITEM
// ================================================================

class _NavItem extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const _NavItem({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: Colors.white70,
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 10,
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

// ================================================================
// GLOBAL SECTION KEYS
// ================================================================

final _globalProfileKey = GlobalKey();
final _globalExperienceKey = GlobalKey();
final _globalProjectsKey = GlobalKey();
final _globalSkillsKey = GlobalKey();
final _globalContactKey = GlobalKey();

// ================================================================
// CURRENT FOCUS
// ================================================================

class _CurrentFocusSection extends StatelessWidget {
  const _CurrentFocusSection();

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.sizeOf(context).width < 600;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: mobile ? 16 : 24,
        vertical: mobile ? 52 : 72,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1180,
          ),
          child: Container(
            padding: EdgeInsets.all(
              mobile ? 22 : 30,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.025),
              borderRadius: BorderRadius.circular(
                mobile ? 22 : 28,
              ),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.07),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'CURRENT FOCUS',
                  style: TextStyle(
                    color: AppTheme.cyan,
                    fontSize: 11,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2,
                  ),
                ),

                const SizedBox(height: 13),

                Text(
                  'Growing from software engineering into AI engineering.',
                  style: TextStyle(
                    fontSize: mobile ? 24 : 30,
                    height: 1.15,
                    fontWeight: FontWeight.w900,
                  ),
                ),

                const SizedBox(height: 14),

                Text(
                  'Deepening foundations in Machine Learning and Deep Learning while building stronger capability in LLM applications, RAG, evaluation, MLOps, and production-oriented AI systems.',
                  style: TextStyle(
                    color: AppTheme.muted,
                    height: 1.7,
                    fontSize: mobile ? 14 : 16,
                  ),
                ),

                const SizedBox(height: 22),

                const Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
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

// ================================================================
// FOOTER
// ================================================================

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.sizeOf(context).width < 600;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        mobile ? 18 : 24,
        0,
        mobile ? 18 : 24,
        30,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1180,
          ),
          child: mobile
              ? const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jaydeo Sawale',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 7),
                    Text(
                      'Software Engineer • AI / ML • Mobile',
                      style: TextStyle(
                        color: Colors.white38,
                        fontSize: 11,
                      ),
                    ),
                  ],
                )
              : const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Jaydeo Sawale',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      'Software Engineer • AI / ML • Mobile',
                      style: TextStyle(
                        color: Colors.white38,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

// ================================================================
// MINI TAG
// ================================================================

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