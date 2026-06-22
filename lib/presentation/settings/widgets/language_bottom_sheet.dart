import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../l10n/app_localizations.dart';

import '../../language/cubit/language_cubit.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Wrap(
          children: [
            Text(
              AppLocalizations.of(context)!.languagePreference,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            ListTile(
              leading: const Icon(Icons.language),
              title: Text(AppLocalizations.of(context)!.english),
              onTap: () {
                context.read<LanguageCubit>().changeLanguage('en');
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.language),
              title: Text(AppLocalizations.of(context)!.arabic),
              onTap: () {
                context.read<LanguageCubit>().changeLanguage('ar');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
