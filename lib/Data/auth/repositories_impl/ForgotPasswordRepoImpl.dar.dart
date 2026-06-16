import 'package:injectable/injectable.dart';

import '../../../api/auth/request/forgot_password_request.dart';
import '../../../core/errors/result/results.dart';
import '../../../domain/auth/repositories/forgot_password_reposetories.dart';
import '../data_source/ForgotPasswordRemoteDataSource.dart';

@Injectable(as: ForgotPasswordRepositories)
class ForgotPasswordRepoImpl implements ForgotPasswordRepositories {
  final ForgotPasswordRemoteDataSource _remote;

  ForgotPasswordRepoImpl(this._remote);

  @override
  Future<Result<void>> forgotPasswordSendCode(ForgotPasswordRequest request) async {
    final result = await _remote.forgotPasswordSendCode(request);

    return result.fold(
      onSuccess: (_) => const Success(null),
      onFailure: (failure) => Failure(failure),
    );
  }
}