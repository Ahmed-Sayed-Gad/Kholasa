import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/di.dart';
import '../../../core/theme/color_manager.dart';
import '../cubit/history_cubit.dart';
import '../cubit/history_state.dart';
import '../widgets/filter_chips.dart';
import '../widgets/history_card.dart';
import '../widgets/language_chips.dart';
import '../widgets/search_field.dart';



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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

// 🔹 Title
              const Text(
                "History",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.textColor,
                ),
              ),

              const SizedBox(height: 4),

              const Text(
                "View all your past summaries",
                style: TextStyle(
                  color: ColorManager.textSecondary,
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
                        return const Center(child: Text("No history yet"));
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
    );
  }
}