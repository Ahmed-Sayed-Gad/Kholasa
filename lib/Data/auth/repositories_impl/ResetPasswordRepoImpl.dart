import 'package:injectable/injectable.dart';

import '../../../api/auth/request/reset_password.dart';
import '../../../core/errors/result/results.dart';
import '../../../domain/auth/repositories/Reset_password_reposetories.dart';
import '../data_source/ResetPasswordRemoteDataSource.dart';

@Injectable(as: ResetPasswordRepositories)
class ResetPasswordRepoImpl implements ResetPasswordRepositories {
  final ResetPasswordRemoteDataSource _remote;

  ResetPasswordRepoImpl(this._remote);

  @override
  Future<Result<void>> resetPassword(Reset_Password request) async {
    final result = await _remote.resetPassword(request);

    return result.fold(
      onSuccess: (_) => const Success(null),
      onFailure: (failure) => Failure(failure),
    );
  }
}