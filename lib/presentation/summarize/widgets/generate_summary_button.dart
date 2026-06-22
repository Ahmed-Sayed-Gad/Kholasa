import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../l10n/app_localizations.dart';
import '../cubit/summarize_cubit.dart';

class GenerateSummaryButton extends StatelessWidget {
  const GenerateSummaryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<SummarizeCubit>().generateSummary();
      },
      child: Text(AppLocalizations.of(context)!.generateAISummary),
    );
  }
}
