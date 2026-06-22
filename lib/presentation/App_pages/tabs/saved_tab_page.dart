import 'package:flutter/material.dart';
import '../../../../l10n/app_localizations.dart';

class SavedTabPage extends StatelessWidget {
  const SavedTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(AppLocalizations.of(context)!.saved)),
    );
  }
}
