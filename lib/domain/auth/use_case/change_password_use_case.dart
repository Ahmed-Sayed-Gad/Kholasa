import 'package:injectable/injectable.dart';

import '../../../api/home/request/change_password_request.dart';
import '../../../api/home/response/change_profile_password_response.dart';
import '../../../core/errors/result/results.dart';
import '../repositories/change_password_repository.dart';

@injectable
class ChangePasswordUseCase {
  final ChangePasswordRepository repository;

  ChangePasswordUseCase(this.repository);

  Future<Result<ChangeProfilePasswordResponse>> call(
      String token,
      ChangePasswordRequest request,
      ) {
    return repository.changePassword(token, request);
  }
}