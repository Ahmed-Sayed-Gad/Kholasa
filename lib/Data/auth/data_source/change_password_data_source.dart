

import '../../../api/auth/request/change_password_request.dart';
import '../../../api/auth/response/change_profile_password_response.dart';
import '../../../core/errors/result/results.dart';

abstract class ChangePasswordDataSource {
  Future<Result<ChangeProfilePasswordResponse>> changePassword(String token, ChangePasswordRequest request);
}