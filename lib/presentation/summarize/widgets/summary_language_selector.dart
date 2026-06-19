import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          decoration: const InputDecoration(
            labelText: 'Language',
          ),
          items: const [
            DropdownMenuItem(
              value: 'ar',
              child: Text('Arabic'),
            ),
            DropdownMenuItem(
              value: 'en',
              child: Text('English'),
            ),
            DropdownMenuItem(
              value: 'both',
              child: Text('Both'),
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