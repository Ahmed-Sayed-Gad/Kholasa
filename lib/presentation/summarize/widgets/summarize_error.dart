import 'package:flutter/material.dart';
import '../../../../l10n/app_localizations.dart';

class SummarizeErrorView extends StatelessWidget {
  final String message;

  const SummarizeErrorView({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error_outline,
              size: 48, color: Colors.red),
          const SizedBox(height: 12),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.red),
          ),
          const SizedBox(height: 12),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(AppLocalizations.of(context)!.goBack),
          ),
        ],
      ),
    );
  }
}
