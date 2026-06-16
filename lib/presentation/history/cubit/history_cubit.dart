import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/history/entities/history_item.dart';
import '../../../domain/history/use_cases/get_history_use_case.dart';
import '../../../domain/history/use_cases/toggle_saved_use_case.dart';
import 'history_state.dart';


class HistoryCubit extends Cubit<HistoryState> {
  final GetHistoryUseCase getHistoryUseCase;
  final ToggleSavedUseCase toggleSavedUseCase;

  HistoryCubit(this.getHistoryUseCase, this.toggleSavedUseCase)
      : super(HistoryInitial());

  void loadHistory() {
    final items = getHistoryUseCase();

    emit(
      HistoryLoaded(
        allItems: items,
        filteredItems: items,
        language: "all", // 🔥 لازم تضيفها
        filterType: "all",
        searchQuery: "",
      ),
    );
  }

  void toggleSaved(String id) async {
    await toggleSavedUseCase(id);
    loadHistory();
  }

  // 🔍 SEARCH
  void search(String query) {
    final current = state;

    if (current is HistoryLoaded) {
      final filtered = _applyFilters(
        current.allItems,
        query: query,
        type: current.filterType,
        language: current.language,
      );

      emit(current.copyWith(
        filteredItems: filtered,
        searchQuery: query,
      ));
    }
  }

  // 📂 TYPE FILTER
  void changeType(String type) {
    final current = state;

    if (current is HistoryLoaded) {
      final filtered = _applyFilters(
        current.allItems,
        query: current.searchQuery,
        type: type,
        language: current.language,
      );

      emit(current.copyWith(
        filteredItems: filtered,
        filterType: type,
      ));
    }
  }

  // 🌍 LANGUAGE FILTER
  void changeLanguage(String lang) {
    final current = state;

    if (current is HistoryLoaded) {
      final filtered = _applyFilters(
        current.allItems,
        query: current.searchQuery,
        type: current.filterType,
        language: lang,
      );

      emit(current.copyWith(
        filteredItems: filtered,
        language: lang,
      ));
    }
  }

  // 🧠 CORE FILTER LOGIC
  List<HistoryItem> _applyFilters(
      List<HistoryItem> items, {
        required String query,
        required String type,
        required String language,
      }) {
    return items.where((item) {
      final matchesSearch =
      item.title.toLowerCase().contains(query.toLowerCase());

      final matchesType =
      type == "all" ? true : item.type == type;

      final matchesLang =
      language == "all" ? true : item.language == language;

      return matchesSearch && matchesType && matchesLang;
    }).toList().reversed.toList();
  }
}