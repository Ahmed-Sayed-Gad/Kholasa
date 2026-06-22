import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../l10n/app_localizations.dart';

import '../../language/cubit/language_cubit.dart';

class LanguageTile extends StatelessWidget {
  const LanguageTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.language),
      title: Text(AppLocalizations.of(context)!.language),
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (_) {
            return SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: Text(AppLocalizations.of(context)!.english),
                    onTap: () {
                      context.read<LanguageCubit>().changeLanguage('en');
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text(AppLocalizations.of(context)!.arabic),
                    onTap: () {
                      context.read<LanguageCubit>().changeLanguage('ar');
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}