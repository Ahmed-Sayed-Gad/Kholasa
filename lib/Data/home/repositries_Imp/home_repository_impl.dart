import 'package:injectable/injectable.dart';

import '../../../core/errors/result/results.dart';
import '../../../domain/history/repositories/history_repository.dart';
import '../../../domain/home/entities/home_banner.dart';
import '../../../domain/home/entities/recent_Items.dart';
import '../../../domain/home/repositories/home_repository.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HistoryRepository historyRepository;

  HomeRepositoryImpl(this.historyRepository);

  @override
  Future<Result<List<HomeBanner>>> getHomeBanners() async {
    return Success([
      HomeBanner(
        title: "AI Powered",
        subtitle: "Generate summaries faster",
        badge: "Active",
        type: BannerType.schedule,
      ),
      HomeBanner(
        title: "Smart Learning",
        subtitle: "Upload, Scan and Summarize",
        badge: "Ready",
        type: BannerType.achievement,
      ),
    ]);
  }

  @override
  Future<Result<List<RecentItem>>> getRecentItems() async {
    final history = historyRepository.getAll();

    final recentItems = history
        .map(
          (item) => RecentItem(
        id: item.id,
        title: item.title,
        summary: item.summary,
        category: item.type.toUpperCase(),
        isHighPriority: false,
        dueDate: item.createdAt,
      ),
    )
        .toList();

    return Success(recentItems);
  }
}