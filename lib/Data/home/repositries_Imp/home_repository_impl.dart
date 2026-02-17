import 'package:injectable/injectable.dart';

import '../../../core/errors/result/results.dart';
import '../../../domain/home/entities/home_banner.dart';
import '../../../domain/home/entities/recent_Items.dart';
import '../../../domain/home/repositories/home_repository.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {

  @override
  Future<Result<List<HomeBanner>>> getHomeBanners() async {
    await Future.delayed(const Duration(seconds: 1));

    return Success([
      HomeBanner(
        title: "3 Tasks Pending",
        subtitle: "Stay on track with your goals",
        badge: "Active",
        type: BannerType.schedule,
      ),
      HomeBanner(
        title: "486 Questions Generated",
        subtitle: "You're learning faster with AI",
        badge: "Achievement",
        type: BannerType.achievement,
      ),
    ]);
  }

  @override
  Future<Result<List<RecentItem>>> getRecentItems() async {
    await Future.delayed(const Duration(milliseconds: 500));

    return Success([
      RecentItem(
        title: "Chemistry Assignment",
        category: "Academic",
        isHighPriority: true,
        dueDate: DateTime.now().add(const Duration(hours: 23)),
      ),
      RecentItem(
        title: "Physics Notes",
        category: "Academic",
        isHighPriority: false,
        dueDate: DateTime.now().add(const Duration(days: 2)),
      ),
    ]);
  }
}
