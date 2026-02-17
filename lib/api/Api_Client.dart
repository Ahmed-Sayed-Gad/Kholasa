import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'auth/request/Forgot_Password_Request.dart';
import 'auth/request/Reset Password.dart';
import 'auth/request/SignUpRequest.dart';
import 'auth/request/Verify_Reset_password.dart';
import 'auth/request/sign_in_request.dart';
import 'home/request/change_password_request.dart';
import 'auth/response/sign_in_response.dart';
import 'home/response/change_profile_password_response.dart';
part 'Api_Client.g.dart';

@RestApi(baseUrl: "https://exam.elevateegy.com/api/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST("v1/views/signUp")
  Future<dynamic> signUp(@Body() SignUpRequest request);

  @POST("v1/views/signIn")
  Future<SignInResponse> signIn(@Body() SignInRequest request);

  @POST("v1/views/forgotPassword")
  Future<void> forgotPassword(@Body() ForgotPasswordRequest request);

  @POST("v1/views/verifyResetCode")
  Future<void> verifyResetCode(@Body() Verify_reset_password request);

  @PUT("v1/views/resetPassword")
  Future<void> resetPassword(@Body() Reset_Password request);

  @PATCH("v1/views/changePassword")
  Future<ChangeProfilePasswordResponse> changePassword(
    @Header("token") String token,
    @Body() ChangePasswordRequest request,
  );
}
