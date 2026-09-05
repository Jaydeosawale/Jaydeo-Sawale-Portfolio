import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/project.dart';
import '../theme/app_theme.dart';

class ProjectDetailScreen extends StatelessWidget {
  final Project project;

  const ProjectDetailScreen({super.key, required this.project});

  Future<void> _open(String? value) async {
    if (value == null || value.isEmpty) return;
    final uri = Uri.tryParse(value);
    if (uri == null) return;
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final compact = MediaQuery.sizeOf(context).width < 720;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          tooltip: 'Back',
          onPressed: () => Navigator.of(context).maybePop(),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        title: Text(project.name),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(24, 24, 24, compact ? 64 : 90),
        children: [
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1080),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Badge(text: project.stage),
                  const SizedBox(height: 18),
                  Text(
                    project.name,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontSize: compact ? 40 : 56,
                        ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    project.category,
                    style: const TextStyle(
                      color: AppTheme.cyan,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.1,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    project.tagline,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 19,
                      height: 1.55,
                    ),
                  ),
                  const SizedBox(height: 24),
                  _ActionBar(project: project, onOpen: _open),
                  const SizedBox(height: 22),
                  _InfoPanel(title: 'My role', content: project.role),
                  const SizedBox(height: 18),
                  _Section(
                    title: 'Overview',
                    child: Text(project.overview, style: _bodyStyle()),
                  ),
                  const SizedBox(height: 18),
                  _Section(
                    title: 'What I built',
                    child: _BulletList(items: project.outcomes),
                  ),
                  const SizedBox(height: 18),
                  _Section(
                    title: 'System architecture',
                    child: _Architecture(items: project.architecture),
                  ),
                  const SizedBox(height: 18),
                  _Section(
                    title: 'Technology stack',
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: project.technologies
                          .map((x) => Chip(label: Text(x)))
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 18),
                  _Section(
                    title: 'Engineering approach',
                    child: _BulletList(items: project.approach),
                  ),
                  const SizedBox(height: 18),
                  _Section(
                    title: 'Challenges & lessons',
                    child: _BulletList(items: project.challenges),
                  ),
                  const SizedBox(height: 18),
                  _Section(
                    title: 'Roadmap',
                    child: _BulletList(items: project.roadmap),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextStyle _bodyStyle() => const TextStyle(
        color: AppTheme.muted,
        height: 1.7,
        fontSize: 15,
      );
}

class _ActionBar extends StatelessWidget {
  final Project project;
  final Future<void> Function(String?) onOpen;

  const _ActionBar({required this.project, required this.onOpen});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        _ActionButton(
          label: 'Web',
          icon: Icons.public_rounded,
          enabled: project.webUrl != null,
          onPressed: () => onOpen(project.webUrl),
        ),
        _ActionButton(
          label: 'Android APK',
          icon: Icons.android_rounded,
          enabled: project.androidUrl != null,
          onPressed: () => onOpen(project.androidUrl),
        ),
        _ActionButton(
          label: 'iOS',
          icon: Icons.apple,
          enabled: project.iosUrl != null,
          onPressed: () => onOpen(project.iosUrl),
        ),
        _ActionButton(
          label: 'GitHub',
          icon: Icons.code_rounded,
          enabled: project.githubUrl != null,
          onPressed: () => onOpen(project.githubUrl),
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool enabled;
  final VoidCallback onPressed;

  const _ActionButton({
    required this.label,
    required this.icon,
    required this.enabled,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: enabled ? onPressed : null,
      icon: Icon(icon, size: 17),
      label: Text(enabled ? label : '$label • coming soon'),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: BorderSide(
          color: enabled ? AppTheme.cyan.withValues(alpha: 0.28) : Colors.white12,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String text;
  const _Badge({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppTheme.cyan.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppTheme.cyan.withValues(alpha: 0.18)),
      ),
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(
          color: AppTheme.cyan,
          fontSize: 11,
          fontWeight: FontWeight.w900,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

class _InfoPanel extends StatelessWidget {
  final String title;
  final String content;
  const _InfoPanel({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.035),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
      ),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: AppTheme.muted, height: 1.6),
          children: [
            TextSpan(
              text: '$title\n',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
            ),
            TextSpan(text: content),
          ],
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final Widget child;
  const _Section({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
        color: AppTheme.panel,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }
}

class _BulletList extends StatelessWidget {
  final List<String> items;
  const _BulletList({required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items
          .map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Icon(Icons.circle, size: 7, color: AppTheme.cyan),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      item,
                      style: const TextStyle(
                        color: AppTheme.muted,
                        height: 1.6,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class _Architecture extends StatelessWidget {
  final List<String> items;
  const _Architecture({required this.items});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      runSpacing: 10,
      spacing: 8,
      children: [
        for (var i = 0; i < items.length; i++) ...[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.035),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
            ),
            child: Text(
              items[i],
              style: const TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
          if (i != items.length - 1)
            const Icon(
              Icons.arrow_forward_rounded,
              color: Colors.white24,
              size: 18,
            ),
        ],
      ],
    );
  }
}
