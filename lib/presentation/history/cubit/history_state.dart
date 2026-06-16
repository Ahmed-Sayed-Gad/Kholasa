import '../../../domain/history/entities/history_item.dart';

sealed class HistoryState {}

class HistoryInitial extends HistoryState {}

class HistoryLoaded extends HistoryState {
  final List<HistoryItem> allItems;
  final List<HistoryItem> filteredItems;

  final String searchQuery;
  final String filterType;
  final String language; // 🔥 ده كان ناقص

  HistoryLoaded({
    required this.allItems,
    required this.filteredItems,
    this.searchQuery = "",
    this.filterType = "all",
    this.language = "all", // default
  });

  HistoryLoaded copyWith({
    List<HistoryItem>? allItems,
    List<HistoryItem>? filteredItems,
    String? searchQuery,
    String? filterType,
    String? language,
  }) {
    return HistoryLoaded(
      allItems: allItems ?? this.allItems,
      filteredItems: filteredItems ?? this.filteredItems,
      searchQuery: searchQuery ?? this.searchQuery,
      filterType: filterType ?? this.filterType,
      language: language ?? this.language,
    );
  }
}

class HistoryError extends HistoryState {
  final String message;
  HistoryError(this.message);
}