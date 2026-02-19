import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Data/summarize/data_source/summarize_fake_data_source.dart';
import '../../../Data/summarize/repositories_impl/summarize_repository_impl.dart';
import '../../../domain/summarize/use_case/generate_summary_use_case.dart';
import '../cubit/summarize_cubit.dart';
import 'summarize_body.dart';

class SummarizeView extends StatelessWidget {
  final File file;

  const SummarizeView({super.key, required this.file});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SummarizeCubit(
        GenerateSummaryUseCase(
          SummarizeRepositoryImpl(
            SummarizeFakeDataSource(),
          ),
        ),
      )..init(file),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Summary'),
        ),
        body: const SummarizeBody(),
      ),
    );
  }
}
