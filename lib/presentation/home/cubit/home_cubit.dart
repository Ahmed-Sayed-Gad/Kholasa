import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';

import '../../../domain/home/UsaCase/get_home_banners_use_case.dart';
import '../../../domain/home/UsaCase/get_recent_items_use_case.dart';
import '../../mappers/home_ui_mapper.dart';
import 'home_cubit_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetHomeBannersUseCase getHomeBanners;
  final GetRecentItemsUseCase getRecentItems;

  Timer? _searchDebounce;

  HomeCubit(
      this.getHomeBanners,
      this.getRecentItems,
      ) : super(HomeInitial());

  // ========================
  // Load Home
  // ========================
  Future<void> loadHome() async {
    emit(HomeLoading());

    final bannersResult = await getHomeBanners();
    final itemsResult = await getRecentItems();

    bannersResult.fold(
      onFailure: (f) {
        emit(HomeError(f.userFriendlyMessage));
      },
      onSuccess: (bannersDomain) {
        itemsResult.fold(
          onFailure: (f) {
            emit(HomeError(f.userFriendlyMessage));
          },
          onSuccess: (itemsDomain) {
            final bannersUi =
            bannersDomain.map(HomeUiMapper.mapBanner).toList();

            final itemsUi =
            itemsDomain.map(HomeUiMapper.mapRecentItem).toList();

            if (itemsUi.isEmpty) {
              emit(HomeEmpty());
            } else {
              emit(
                HomeSuccess(
                  banners: bannersUi,
                  items: itemsUi,
                  allItems: itemsUi,
                ),
              );
            }
          },
        );
      },
    );
  }

  // ========================
  // Search
  // ========================
  void search(String query) {
    _searchDebounce?.cancel();
    _searchDebounce =
        Timer(const Duration(milliseconds: 300), () {
          _applySearch(query);
        });
  }

  void _applySearch(String query) {
    if (state is! HomeSuccess) return;

    final current = state as HomeSuccess;

    if (query.isEmpty) {
      emit(
        HomeSuccess(
          banners: current.banners,
          items: current.allItems,
          allItems: current.allItems,
        ),
      );
      return;
    }

    final filtered = current.allItems.where((item) {
      return item.title.toLowerCase().contains(query.toLowerCase()) ||
          item.category.toLowerCase().contains(query.toLowerCase());
    }).toList();

    if (filtered.isEmpty) {
      emit(HomeEmpty());
    } else {
      emit(
        HomeSuccess(
          banners: current.banners,
          items: filtered,
          allItems: current.allItems,
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _searchDebounce?.cancel();
    return super.close();
  }
}
