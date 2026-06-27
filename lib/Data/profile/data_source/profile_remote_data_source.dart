import '../../../api/profile/response/dashboard_response.dart';
import '../../../core/errors/result/results.dart';

abstract class ProfileRemoteDataSource {
  Future<Result<DashboardDataResponse>> getDashboard();
}
