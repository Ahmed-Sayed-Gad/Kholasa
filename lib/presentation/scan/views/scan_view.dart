import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widget/reduced_font_theme.dart';

import '../cubit/scan_cubit.dart';
import '../cubit/scan_state.dart';
import '../../summarize/widgets/summarize_result.dart';
import '../../../../l10n/app_localizations.dart';

class ScanView extends StatelessWidget {
  const ScanView({super.key});

  @override
  Widget build(BuildContext context) {
    return ReducedFontTheme(
      child: Scaffold(
      backgroundColor:
      Theme.of(context).scaffoldBackgroundColor,

      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.scanImage),
      ),

      body: BlocBuilder<ScanCubit, ScanState>(
        builder: (context, state) {
          if (state is ScanLoading) {
            return const Center(
              child:
              CircularProgressIndicator(),
            );
          }

          if (state is ScanSuccess) {
            return SummarizeResult(
              summary: state.text,
              fileTitle: state.image.path.split(RegExp(r'[/\\]')).last,
            );
          }

          if (state is ScanFailure) {
            return Center(
              child: Text(
                state.message,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            );
          }

          return Center(
            child: ElevatedButton(
              onPressed: () {
                context
                    .read<ScanCubit>()
                    .scanImage();
              },
              child: const Text(
                "Choose Image",
              ),
            ),
          );
        },
      ),
    ),);
  }
}