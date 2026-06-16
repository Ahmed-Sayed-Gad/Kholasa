
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'auth/request/change_password_request.dart';
import 'auth/request/forgot_password_request.dart';
import 'auth/request/reset_password.dart';
import 'auth/request/sign_in_request.dart';
import 'auth/request/sign_up_request.dart';
import 'auth/request/verify_reset_password.dart';
import 'auth/response/change_profile_password_response.dart';
import 'auth/response/sign_in_response.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://exam.elevateegy.com/api/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  @POST("v1/views/signUp")
  Future<void> signUp(@Body() SignUpRequest request); // <-- was Future<dynamic>

  @POST("v1/views/signIn")
  Future<SignInResponse> signIn(@Body() SignInRequest request);

  @POST("v1/views/forgotPassword")
  Future<void> forgotPassword(@Body() ForgotPasswordRequest request);

  @POST("v1/views/verifyResetCode")
  Future<void> verifyResetCode(@Body() VerifyResetPassword request);

  @PUT("v1/views/resetPassword")
  Future<void> resetPassword(@Body() Reset_Password request);

  @PATCH("v1/views/changePassword")
  Future<ChangeProfilePasswordResponse> changePassword(
      @Header("token") String token,
      @Body() ChangePasswordRequest request,
      );
}