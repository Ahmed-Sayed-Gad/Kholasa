import 'package:injectable/injectable.dart';

import '../../../core/errors/failures/server_failures.dart';
import '../../../core/errors/result/results.dart';
import '../../../domain/profile/entities/profile_entity.dart';
import '../../../domain/profile/repositories/profile_repository.dart';
import '../data_source/profile_local_data_source.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl
    implements ProfileRepository {

  final ProfileLocalDataSource dataSource;

  ProfileRepositoryImpl(this.dataSource);

  @override
  Future<Result<ProfileEntity>> getProfile() async {

    try {

      final data =
      await dataSource.getProfile();

      return Success(
        ProfileEntity(
          id: '',
          name: data["name"] ?? '',
          email: data["email"] ?? '',
          role: 'User',
          createdAt: DateTime.now(),
        ),
      );

    } catch (_) {

      return Failure(
        ServerFailure(
          userFriendlyMessage:
          "Failed To Load Profile", message: '',
        ),
      );
    }
  }
}