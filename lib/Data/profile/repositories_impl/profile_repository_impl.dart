import 'package:injectable/injectable.dart';

import '../../../core/errors/failures/server_failures.dart';
import '../../../core/errors/result/results.dart';
import '../../../domain/profile/entities/profile_entity.dart';
import '../../../domain/profile/repositories/profile_repository.dart';
import '../data_source/profile_local_data_source.dart';
import '../data_source/profile_remote_data_source.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileLocalDataSource localDataSource;
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl(
    this.localDataSource,
    this.remoteDataSource,
  );

  @override
  Future<Result<ProfileEntity>> getProfile() async {
    try {
      final localData = await localDataSource.getProfile();
      final remoteResult = await remoteDataSource.getDashboard();

      return remoteResult.fold(
        onSuccess: (dashboardData) {
          return Success(
            ProfileEntity(
              id: '',
              name: localData['name'] ?? '',
              email: localData['email'] ?? '',
              role: 'User',
              createdAt: DateTime.now(),
              totalDocuments: dashboardData.counters.totalDocuments,
              totalSummaries: dashboardData.counters.totalSummaries,
              totalFavorites: dashboardData.counters.totalFavorites,
              hoursSaved: dashboardData.counters.hoursSaved,
              todayCount: dashboardData.activity.today,
              yesterdayCount: dashboardData.activity.yesterday,
              weekCount: dashboardData.activity.thisWeek,
              monthCount: dashboardData.activity.thisMonth,
              achievements: dashboardData.achievements,
            ),
          );
        },
        onFailure: (failure) {
          return Failure(failure);
        },
      );
    } catch (e) {
      return Failure(
        ServerFailure(
          message: e.toString(),
          userFriendlyMessage: 'Failed To Load Profile',
        ),
      );
    }
  }
}