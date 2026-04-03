import 'package:injectable/injectable.dart';

import '../../../api/home/request/change_password_request.dart';
import '../../../api/home/response/change_profile_password_response.dart';
import '../../../core/errors/result/results.dart';
import '../../../domain/auth/repositories/change_password_repository.dart';
import '../data_source/change_password_data_source.dart';

@Injectable(as: ChangePasswordRepository)
class ChangePasswordRepositoryImpl implements ChangePasswordRepository {
  final ChangePasswordDataSource _dataSource;

  ChangePasswordRepositoryImpl(this._dataSource);

  @override
  Future<Result<ChangeProfilePasswordResponse>> changePassword(
      String token,
      ChangePasswordRequest request,
      ) async {
    final result = await _dataSource.changePassword(token, request);

    return result.fold(
      onSuccess: (data) => Success(data),
      onFailure: (failure) => Failure(failure),
    );
  }
}