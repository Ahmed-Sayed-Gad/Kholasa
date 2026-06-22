import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../l10n/app_localizations.dart';

import '../../../core/di/di.dart';
import '../../export/cubit/export_cubit.dart';
import '../cubit/summarize_cubit.dart';
import '../cubit/summarize_state.dart';
import 'summarize_body.dart';
import '../../history/cubit/history_cubit.dart';

class SummarizeView extends StatelessWidget {
  final File file;

  const SummarizeView({super.key, required this.file});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<SummarizeCubit>()..init(file),
        ),
        BlocProvider(
          create: (_) => getIt<ExportCubit>(),
        ),
      ],
      child: BlocListener<SummarizeCubit, SummarizeState>(
        listener: (context, state) {
          if (state is SummarizeSuccess) {
            // 🔥 هنا المكان الصح
            context.read<HistoryCubit>().loadHistory();
          }
        },
        child: Scaffold(
          appBar: AppBar(title: Text(AppLocalizations.of(context)!.summaryTitle)),
          body: const SummarizeBody(),
        ),
      ),
    );
  }
}