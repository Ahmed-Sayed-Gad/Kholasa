import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/services/notification_manager.dart';
import '../../../domain/history/entities/history_item.dart';
import '../../../domain/history/use_cases/get_history_use_case.dart';
import '../../../domain/history/use_cases/delete_item_use_case.dart';
import '../../../domain/history/use_cases/toggle_saved_use_case.dart';
import 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final GetHistoryUseCase getHistoryUseCase;
  final ToggleSavedUseCase toggleSavedUseCase;
  final DeleteItemUseCase deleteItemUseCase;
  final NotificationManager notificationManager;

  HistoryCubit(
    this.getHistoryUseCase,
    this.toggleSavedUseCase,
    this.deleteItemUseCase,
    this.notificationManager,
  ) : super(HistoryInitial());

  void loadHistory() {
    final items = getHistoryUseCase();

    emit(
      HistoryLoaded(
        allItems: items,
        filteredItems: items,
        language: "all",
        filterType: "all",
        searchQuery: "",
      ),
    );
  }

  void toggleSaved(String id) async {
    final current = state;
    if (current is HistoryLoaded) {
      final items = current.allItems;
      final matchIndex = items.indexWhere((element) => element.id == id);
      if (matchIndex != -1) {
        final item = items[matchIndex];
        final wasSaved = item.isSaved;

        await toggleSavedUseCase(id);
        loadHistory();

        if (wasSaved) {
          notificationManager.favoriteRemoved(item.title, item.sessionId);
        } else {
          notificationManager.favoriteAdded(item.title, item.sessionId);
        }
      }
    }
  }

  Future<void> deleteItem(String id) async {
    await deleteItemUseCase(id);
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