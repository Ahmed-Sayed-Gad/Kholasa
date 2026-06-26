import 'package:flutter/material.dart';
import '../../../../l10n/app_localizations.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.privacyPolicy),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Text(
          '''
Privacy Policy

Last Updated: June 2026

Welcome to Kholasa.

Your privacy is important to us. This Privacy Policy explains how Kholasa collects, uses, and protects your information.

1. Information We Collect

Kholasa may collect:

• Account information such as name and email address.
• Uploaded documents, images, and links used for summarization.
• Application settings and preferences.
• Usage statistics to improve the application.

2. How We Use Information

Collected information is used to:

• Generate AI-powered summaries.
• Improve application performance.
• Personalize user experience.
• Provide technical support.

3. File Processing

Files uploaded for summarization are processed only for generating summaries and related AI features.

4. Data Security

We take reasonable measures to protect user information from unauthorized access, modification, disclosure, or destruction.

5. Third-Party Services

Kholasa may use third-party services and APIs for AI processing and analytics.

6. User Rights

Users may request deletion of their stored information where applicable.

7. Changes to This Policy

This policy may be updated periodically. Continued use of the application indicates acceptance of any updates.

8. Contact

For questions regarding this Privacy Policy, please contact the Kholasa development team.

© 2026 Kholasa AI Summarization System
''',
          style: TextStyle(
            height: 1.6,
            fontSize: 11,
          ),
        ),
      ),
    );
  }
}