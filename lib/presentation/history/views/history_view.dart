import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/history_cubit.dart';
import '../cubit/history_state.dart';
import '../widgets/filter_chips.dart';
import '../widgets/history_card.dart';
import '../widgets/language_chips.dart';
import '../widgets/search_field.dart';
import '../../widget/reduced_font_theme.dart';
import '../../../../l10n/app_localizations.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    }

  @override
  Widget build(BuildContext context) {
    return ReducedFontTheme(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
  
  // 🔹 Title
                Text(
                  AppLocalizations.of(context)!.history,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),

              const SizedBox(height: 4),

              Text(
                AppLocalizations.of(context)!.historyDesc,
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                ),
              ),

              const SizedBox(height: 20),

// 🔹 Search
              SearchField(),

              const SizedBox(height: 16),

// 🔹 Filters
              FilterRow(),

              const SizedBox(height: 16),

// 🔹 Languages
              LanguageRow(),

              const SizedBox(height: 20),

// 🔹 List
              Expanded(
                child: BlocBuilder<HistoryCubit, HistoryState>(
                  builder: (context, state) {
                    if (state is HistoryInitial) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state is HistoryLoaded) {
                      final items = state.filteredItems;

                      if (items.isEmpty) {
                        return Center(child: Text(AppLocalizations.of(context)!.noHistory));
                      }

                      return ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return HistoryCard(item: items[index]);
                        },
                      );
                    }

                    return const SizedBox();
                  },
                ),
              )            ],
          ),
        ),
      ),
    ),);
  }
}