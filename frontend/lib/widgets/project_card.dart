import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/project.dart';
import '../theme/app_theme.dart';

class ProjectCard extends StatefulWidget {
  final Project project;
  final VoidCallback onTap;

  const ProjectCard({
    super.key,
    required this.project,
    required this.onTap,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool hovered = false;

  Future<void> _open(String? value) async {
    if (value == null || value.isEmpty) return;
    final uri = Uri.tryParse(value);
    if (uri == null) return;
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        transform: Matrix4.translationValues(0, hovered ? -5 : 0, 0),
        height: 390,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppTheme.panel.withValues(alpha: 0.95),
          borderRadius: BorderRadius.circular(26),
          border: Border.all(
            color: hovered
                ? AppTheme.cyan.withValues(alpha: 0.32)
                : Colors.white.withValues(alpha: 0.08),
          ),
          boxShadow: hovered
              ? [
                  BoxShadow(
                    color: AppTheme.cyan.withValues(alpha: 0.09),
                    blurRadius: 34,
                    spreadRadius: 1,
                  ),
                ]
              : const [],
        ),
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.project.number,
                    style: const TextStyle(
                      color: Colors.white24,
                      fontSize: 13,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  AnimatedRotation(
                    turns: hovered ? 0.03 : 0,
                    duration: const Duration(milliseconds: 180),
                    child: const Icon(
                      Icons.arrow_outward_rounded,
                      color: AppTheme.cyan,
                      size: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 17),
              Text(
                widget.project.name,
                style: const TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 7),
              Text(
                widget.project.category,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppTheme.cyan,
                  fontSize: 11,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.9,
                ),
              ),
              const SizedBox(height: 13),
              Text(
                widget.project.tagline,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppTheme.muted,
                  height: 1.55,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 13),
              Expanded(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Wrap(
                    spacing: 7,
                    runSpacing: 7,
                    children: widget.project.technologies
                        .take(6)
                        .map((item) => _Tag(label: item))
                        .toList(),
                  ),
                ),
              ),
              const Divider(height: 1, color: Colors.white10),
              const SizedBox(height: 11),
              Wrap(
                spacing: 7,
                runSpacing: 7,
                children: [
                  _ProjectLink(
                    label: 'Web',
                    tooltipLabel: 'Live website',
                    icon: Icons.language_rounded,
                    color: const Color(0xFF42D9FF),
                    url: widget.project.webUrl,
                    onOpen: _open,
                  ),
                  _ProjectLink(
                    label: 'Android APK',
                    tooltipLabel: 'Android APK',
                    icon: Icons.android_rounded,
                    color: const Color(0xFF7CDB55),
                    url: widget.project.androidUrl,
                    onOpen: _open,
                  ),
                  _ProjectLink(
                    label: 'iOS',
                    tooltipLabel: 'iOS app',
                    icon: Icons.apple,
                    color: const Color(0xFFE7ECF5),
                    url: widget.project.iosUrl,
                    onOpen: _open,
                  ),
                  _ProjectLink(
                    label: 'GitHub',
                    tooltipLabel: 'Source code',
                    icon: Icons.code_rounded,
                    color: const Color(0xFFE9EDF5),
                    url: widget.project.githubUrl,
                    onOpen: _open,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Open case study →',
                style: TextStyle(
                  color: hovered ? Colors.white : Colors.white54,
                  fontWeight: FontWeight.w800,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProjectLink extends StatelessWidget {
  final String label;
  final String tooltipLabel;
  final IconData icon;
  final Color color;
  final String? url;
  final Future<void> Function(String?) onOpen;

  const _ProjectLink({
    required this.label,
    required this.tooltipLabel,
    required this.icon,
    required this.color,
    required this.url,
    required this.onOpen,
  });

  @override
  Widget build(BuildContext context) {
    final enabled = url != null && url!.isNotEmpty;

    return Tooltip(
      message: enabled ? 'Open $tooltipLabel' : '$tooltipLabel not added yet',
      child: InkWell(
        onTap: enabled ? () => onOpen(url) : null,
        borderRadius: BorderRadius.circular(11),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            color: color.withValues(alpha: enabled ? 0.11 : 0.055),
            borderRadius: BorderRadius.circular(11),
            border: Border.all(
              color: color.withValues(alpha: enabled ? 0.30 : 0.16),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 15,
                color: enabled ? color : color.withValues(alpha: 0.65),
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  fontSize: label == 'Android APK' ? 9.5 : 10.5,
                  fontWeight: FontWeight.w800,
                  color: enabled ? Colors.white : Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  final String label;

  const _Tag({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 10,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
