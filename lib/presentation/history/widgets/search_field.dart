import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/color_manager.dart';
import '../cubit/history_cubit.dart';

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        context.read<HistoryCubit>().search(value);
      },
      decoration: InputDecoration(
        hintText: "Search history...",
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: ColorManager.surfaceDark,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}