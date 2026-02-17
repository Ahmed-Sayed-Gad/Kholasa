import 'package:injectable/injectable.dart';

import '../../../api/auth/request/Reset Password.dart';
import '../../../core/errors/result/results.dart';
import '../../../domain/auth/repositories/Reset_password_reposetories.dart';
import '../data_source/ResetPasswordRemoteDataSource.dart';
@Injectable(as: ResetPasswordReposetories)
class ResetPasswordRepoImp  implements ResetPasswordReposetories{

  final ResetPasswordRemoteDataSource _resetPasswordRemoteDataSource;
  ResetPasswordRepoImp(this._resetPasswordRemoteDataSource);

  @override
  Future<Result<void>> resetPassword(Reset_Password request) {
    return _resetPasswordRemoteDataSource.resetPassword(request);
  }


}