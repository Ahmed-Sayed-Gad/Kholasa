import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/color_manager.dart';
import '../cubit/history_cubit.dart';
import '../cubit/history_state.dart';

class LanguageRow extends StatelessWidget {
  const LanguageRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubit, HistoryState>(
      builder: (context, state) {
        if (state is! HistoryLoaded) return const SizedBox();

        return Row(
          children: [
            _chip(context, "All", "all", state.language),
            _chip(context, "English", "en", state.language),
            _chip(context, "Arabic", "ar", state.language),
          ],
        );
      },
    );
  }

  Widget _chip(
      BuildContext context,
      String text,
      String value,
      String selected,
      ) {
    final isSelected = selected == value;

    return GestureDetector(
      onTap: () {
        context.read<HistoryCubit>().changeLanguage(value);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected
                ? ColorManager.primary.withOpacity(.2)
                : ColorManager.surfaceDark,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: isSelected
                  ? ColorManager.primary
                  : ColorManager.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}