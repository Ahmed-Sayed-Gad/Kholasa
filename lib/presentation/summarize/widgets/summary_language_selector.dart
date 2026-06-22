import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../l10n/app_localizations.dart';

import '../cubit/summarize_cubit.dart';
import '../cubit/summarize_state.dart';

class SummaryLanguageSelector extends StatelessWidget {
  const SummaryLanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SummarizeCubit, SummarizeState>(
      builder: (context, state) {
        return DropdownButtonFormField<String>(
          value: state.language,
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context)!.language,
          ),
          items: [
            DropdownMenuItem(
              value: 'ar',
              child: Text(AppLocalizations.of(context)!.arabic),
            ),
            DropdownMenuItem(
              value: 'en',
              child: Text(AppLocalizations.of(context)!.english),
            ),
            DropdownMenuItem(
              value: 'both',
              child: Text(AppLocalizations.of(context)!.both),
            ),
          ],
          onChanged: (value) {
            if (value == null) return;

            context
                .read<SummarizeCubit>()
                .changeLanguage(value);
          },
        );
      },
    );
  }
}