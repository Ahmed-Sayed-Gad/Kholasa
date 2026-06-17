import 'package:injectable/injectable.dart';

import '../../../Data/auth/data_source/register_Data_Source.dart';
import '../../../core/errors/handlers/auth_error_handler.dart';
import '../../../core/errors/result/results.dart';
import '../../api_client.dart';
import '../request/register_request.dart';

@Injectable(as: RegisterDataSource)
class RegisterDataSourceImp implements RegisterDataSource {
  final ApiClient _apiClient;
  final AuthErrorHandler errorHandler;

  RegisterDataSourceImp(this._apiClient, this.errorHandler);

  @override
  Future<Result<void>> register(RegisterRequest request) async {
    try {
      await _apiClient.register(request);
      return const Success(null);
    } catch (e) {
      return errorHandler.handleSignUpError(e as Exception);
    }
  }
}
