import '../../ui_models/recent_item_ui_model.dart';

sealed class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<RecentItemUiModel> items;
  final List<RecentItemUiModel> allItems;

  HomeSuccess({
    required this.items,
    required this.allItems,
  });
}

class HomeEmpty extends HomeState {}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
