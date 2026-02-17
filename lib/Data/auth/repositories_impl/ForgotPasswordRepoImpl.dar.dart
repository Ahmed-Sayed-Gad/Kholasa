
import 'package:injectable/injectable.dart';

import '../../../api/auth/request/Forgot_Password_Request.dart';
import '../../../core/errors/result/results.dart';
import '../../../domain/auth/repositories/forgot_password_reposetories.dart';
import '../data_source/ForgotPasswordRemoteDataSource.dart';

@Injectable(as: ForgotPasswordReposetories)
class ForgotPasswordRepoImpl  implements ForgotPasswordReposetories{

  final ForgotPasswordRemoteDataSource _forgotPasswordRemoteDataSource;
  ForgotPasswordRepoImpl(this._forgotPasswordRemoteDataSource);

  @override
  Future<Result<void>> forgotPasswordSendCode(ForgotPasswordRequest request) {
    return _forgotPasswordRemoteDataSource.forgotPasswordSendCode(request);
  }
}
