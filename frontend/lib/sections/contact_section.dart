import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme/app_theme.dart';
import '../widgets/section_shell.dart';
import '../widgets/section_title.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  static const String email = 'jaydeep.sawale97@gmail.com';
  static const String phone = '+919850031115';
  static const String githubUrl = 'https://github.com/Jaydeosawale';

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);

    final launched = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );

    if (!launched) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _sendEmail() async {
    final uri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        'subject': 'Portfolio Contact',
      },
    );

    final launched = await launchUrl(uri);

    if (!launched) {
      throw Exception('Could not open email application');
    }
  }

  Future<void> _callPhone() async {
    final uri = Uri(
      scheme: 'tel',
      path: phone,
    );

    final launched = await launchUrl(uri);

    if (!launched) {
      throw Exception('Could not open phone application');
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 600;

    return SectionShell(
      child: Container(
        padding: EdgeInsets.all(isMobile ? 22 : 34),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(isMobile ? 24 : 30),
          gradient: LinearGradient(
            colors: [
              AppTheme.cyan.withValues(alpha: 0.08),
              AppTheme.violet.withValues(alpha: 0.07),
            ],
          ),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.08),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(
              eyebrow: 'Contact',
              title: 'Open to meaningful engineering opportunities.',
              description:
                  'Interested in opportunities where Native Android and Flutter Multiplatform experience can combine with software engineering, Machine Learning, Generative AI, RAG, and production AI systems.',
            ),

            SizedBox(height: isMobile ? 22 : 28),

            LayoutBuilder(
              builder: (context, constraints) {
                if (isMobile) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _ContactButton(
                        label: 'Email',
                        icon: Icons.email_outlined,
                        onPressed: _sendEmail,
                      ),
                      const SizedBox(height: 10),
                      _ContactButton(
                        label: 'Call',
                        icon: Icons.phone_outlined,
                        onPressed: _callPhone,
                      ),
                      const SizedBox(height: 10),
                      _ContactButton(
                        label: 'GitHub',
                        icon: Icons.code_rounded,
                        onPressed: () => _openUrl(githubUrl),
                      ),
                    ],
                  );
                }

                return Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    _ContactButton(
                      label: 'Email',
                      icon: Icons.email_outlined,
                      onPressed: _sendEmail,
                    ),
                    _ContactButton(
                      label: 'Call',
                      icon: Icons.phone_outlined,
                      onPressed: _callPhone,
                    ),
                    _ContactButton(
                      label: 'GitHub',
                      icon: Icons.code_rounded,
                      onPressed: () => _openUrl(githubUrl),
                    ),
                  ],
                );
              },
            ),

            SizedBox(height: isMobile ? 20 : 26),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(isMobile ? 16 : 18),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.035),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.07),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'GET IN TOUCH',
                    style: TextStyle(
                      color: AppTheme.cyan,
                      fontSize: 11,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.8,
                    ),
                  ),

                  const SizedBox(height: 14),

                  SelectableText(
                    email,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isMobile ? 13 : 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 8),

                  SelectableText(
                    '+91 9850031115',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: isMobile ? 13 : 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: isMobile ? 18 : 20),

            const Text(
              'Available for opportunities in AI/ML, Generative AI, Native Android, Flutter Multiplatform, and software engineering.',
              style: TextStyle(
                color: Colors.white54,
                fontSize: 12,
                height: 1.5,
              ),
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

  const _ContactButton({
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 18,
      ),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(0, 52),
        alignment: Alignment.center,
        foregroundColor: Colors.white,
        side: BorderSide(
          color: Colors.white.withValues(alpha: 0.24),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }
}