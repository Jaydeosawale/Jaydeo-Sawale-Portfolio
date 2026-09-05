import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/section_shell.dart';
import '../widgets/section_title.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionShell(
      child: Container(
        padding: const EdgeInsets.all(34),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            colors: [
              AppTheme.cyan.withValues(alpha: 0.08),
              AppTheme.violet.withValues(alpha: 0.07),
            ],
          ),
          border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(
              eyebrow: 'Contact',
              title: 'Open to meaningful engineering opportunities.',
              description:
                  'Interested in opportunities where mobile application experience, software engineering, Machine Learning, and Generative AI can come together.',
            ),
            const SizedBox(height: 28),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _ContactButton(label: 'Email', icon: Icons.email_outlined, onPressed: () {}),
                _ContactButton(label: 'LinkedIn', icon: Icons.work_outline, onPressed: () {}),
                _ContactButton(label: 'GitHub', icon: Icons.code_rounded, onPressed: () {}),
                _ContactButton(label: 'Resume', icon: Icons.description_outlined, onPressed: () {}),
              ],
            ),
            const SizedBox(height: 18),
            const Text(
              'Links are placeholders until the final URLs are supplied.',
              style: TextStyle(color: Colors.white38, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  const _ContactButton({required this.label, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: const BorderSide(color: Colors.white24),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      ),
    );
  }
}
