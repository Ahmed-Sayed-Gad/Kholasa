import 'package:flutter/material.dart';
import '../../../../l10n/app_localizations.dart';

class TermsOfUseView extends StatelessWidget {
  const TermsOfUseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.terms),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Text(
          '''
Terms of Use

Last Updated: June 2026

Welcome to Kholasa.

By using this application, you agree to the following terms:

1. Acceptance of Terms

Using Kholasa means that you agree to comply with these Terms of Use.

2. Application Purpose

Kholasa is designed to assist users in generating AI-powered summaries from documents, images, and web content.

3. User Responsibilities

Users agree not to:

• Upload illegal or harmful content.
• Attempt to disrupt application services.
• Use the application for unlawful activities.
• Misuse AI-generated content.

4. AI Generated Content

Summaries are generated using artificial intelligence and may contain inaccuracies. Users are responsible for verifying important information.

5. Intellectual Property

All trademarks, logos, and software components belong to their respective owners.

6. Limitation of Liability

The Kholasa development team is not responsible for any direct or indirect damages resulting from the use of generated summaries.

7. Service Availability

Application features may change, be modified, or become unavailable without prior notice.

8. Termination

Access may be restricted for users who violate these terms.

9. Updates

These terms may be updated periodically. Continued use of the application indicates acceptance of future updates.

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