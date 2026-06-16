import 'package:injectable/injectable.dart';

import '../../../Data/auth/data_source/change_password_data_source.dart';
import '../../../core/errors/handlers/home_error_handler.dart';
import '../../../core/errors/result/results.dart';
import '../../api_client.dart';
import '../request/change_password_request.dart';
import '../response/change_profile_password_response.dart';


@Injectable(as: ChangePasswordDataSource)
class ChangePasswordDataSourceImpl implements ChangePasswordDataSource {
  final ApiClient apiClient;
  HomeErrorHandler errorHandler;
  ChangePasswordDataSourceImpl(this.apiClient, this.errorHandler);

  @override
  Future<Result<ChangeProfilePasswordResponse>> changePassword(String token, ChangePasswordRequest request) async {
    try {
      final response = await apiClient.changePassword(token, request);
      return Success(response);
    } catch (e) {
      return errorHandler.handleChangePasswordError(e as Exception);
    }
  }
}