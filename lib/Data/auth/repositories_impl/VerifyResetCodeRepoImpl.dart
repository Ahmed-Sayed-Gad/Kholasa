import 'package:injectable/injectable.dart';

import '../../../api/auth/request/Verify_Reset_password.dart';
import '../../../core/errors/result/results.dart';
import '../../../domain/auth/repositories/verify_reset_code.dart';
import '../data_source/verifyResetCodeDataSource.dart';

@Injectable(as: VerifyResetCodeRepositories)
class VerifyResetCodeRepoImpl implements VerifyResetCodeRepositories {
  final VerifyResetCodeRemoteDataSource _remote;

  VerifyResetCodeRepoImpl(this._remote);

  @override
  Future<Result<void>> verifyResetCode(Verify_reset_password request) async {
    final result = await _remote.verifyResetCode(request);

    return result.fold(
      onSuccess: (_) => const Success(null),
      onFailure: (failure) => Failure(failure),
    );
  }
}