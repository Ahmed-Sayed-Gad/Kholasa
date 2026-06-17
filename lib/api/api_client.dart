import 'package:dio/dio.dart';
import 'package:project_one_c3_team/api/profile/response/profile_response.dart';
import 'package:retrofit/retrofit.dart';

import 'auth/request/change_password_request.dart';
import 'auth/request/forgot_password_request.dart';
import 'auth/request/reset_password.dart';
import 'auth/request/login_request.dart';
import 'auth/request/register_request.dart';
import 'auth/request/verify_reset_password.dart';
import 'auth/response/change_profile_password_response.dart';
import 'auth/response/login_response.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://moahmmed24-001-site1.ctempurl.com/api/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  @POST("Auth/register")
  Future<void> register(@Body() RegisterRequest request);

  @POST("Auth/login")
  Future<LoginResponse> login(@Body() LoginRequest request);

  @POST("v1/views/forgotPassword")
  Future<void> forgotPassword(@Body() ForgotPasswordRequest request);

  @POST("v1/views/verifyResetCode")
  Future<void> verifyResetCode(@Body() VerifyResetPassword request);

  @GET("Auth/users")
  Future<List<ProfileResponse>> getUsers(
      @Header("Authorization") String token,
      );
  @PUT("v1/views/resetPassword")
  Future<void> resetPassword(@Body() Reset_Password request);

  @PATCH("v1/views/changePassword")
  Future<ChangeProfilePasswordResponse> changePassword(
    @Header("token") String token,
    @Body() ChangePasswordRequest request,
  );
}
