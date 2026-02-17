import '../../../core/errors/result/results.dart';
import '../entities/home_banner.dart';
import '../entities/recent_Items.dart';

abstract class HomeRepository {
  Future<Result<List<HomeBanner>>> getHomeBanners();
  Future<Result<List<RecentItem>>> getRecentItems();
}
