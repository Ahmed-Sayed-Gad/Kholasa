import 'package:injectable/injectable.dart';

import '../../../core/errors/failures/server_failures.dart';
import '../../../core/errors/result/results.dart';
import '../../../domain/history/repositories/history_repository.dart';
import '../../../domain/profile/entities/profile_entity.dart';
import '../../../domain/profile/repositories/profile_repository.dart';
import '../data_source/profile_local_data_source.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileLocalDataSource dataSource;
  final HistoryRepository historyRepository;

  ProfileRepositoryImpl(
      this.dataSource,
      this.historyRepository,
      );

  @override
  Future<Result<ProfileEntity>> getProfile() async {
    try {
      final data = await dataSource.getProfile();

      final history = historyRepository.getAll();

      final now = DateTime.now();

      final todayCount = history.where((item) {
        return item.createdAt.year == now.year &&
            item.createdAt.month == now.month &&
            item.createdAt.day == now.day;
      }).length;

      final yesterdayCount = history.where((item) {
        final yesterday =
        now.subtract(const Duration(days: 1));

        return item.createdAt.year == yesterday.year &&
            item.createdAt.month == yesterday.month &&
            item.createdAt.day == yesterday.day;
      }).length;

      final weekCount = history.where((item) {
        return now.difference(item.createdAt).inDays <= 7;
      }).length;

      final monthCount = history.where((item) {
        return item.createdAt.year == now.year &&
            item.createdAt.month == now.month;
      }).length;

      final savedCount =
          history.where((e) => e.isSaved).length;

      return Success(
        ProfileEntity(
          id: '',
          name: data["name"] ?? '',
          email: data["email"] ?? '',
          role: 'User',
          createdAt: DateTime.now(),

          totalSummaries: history.length,
          savedSummaries: savedCount,

          todayCount: todayCount,
          yesterdayCount: yesterdayCount,
          weekCount: weekCount,
          monthCount: monthCount,
        ),
      );
    } catch (_) {
      return Failure(
        ServerFailure(
          message: '',
          userFriendlyMessage:
          "Failed To Load Profile",
        ),
      );
    }
  }
}