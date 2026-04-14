import '../../../api/home/request/change_password_request.dart';
import '../../../api/home/response/change_profile_password_response.dart';
import '../../../core/errors/result/results.dart';

abstract class ChangePasswordRepository {
  Future<Result<ChangeProfilePasswordResponse>> changePassword(
      String token,
      ChangePasswordRequest request,
      );
}