import 'package:dio/dio.dart';
import 'package:project_one_c3_team/api/profile/response/profile_response.dart';
import 'package:project_one_c3_team/api/quiz/response/quiz_response.dart';
import 'package:project_one_c3_team/api/summarize/response/summarize_response.dart';
import 'package:project_one_c3_team/api/compare/request/compare_request.dart';
import 'package:project_one_c3_team/api/compare/response/compare_response.dart';
import 'package:retrofit/retrofit.dart';
import 'auth/request/change_password_request.dart';
import 'auth/request/forgot_password_request.dart';
import 'auth/request/reset_password.dart';
import 'auth/request/login_request.dart';
import 'auth/request/register_request.dart';
import 'auth/request/verify_reset_password.dart';
import 'auth/response/change_profile_password_response.dart';
import 'auth/response/login_response.dart';
import 'chat/response/chat_response.dart';
import 'home/link/response/summarize_url_response.dart';
import 'profile/response/dashboard_response.dart';
import 'saved/response/saved_response.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://moahmmed24-001-site1.ctempurl.com/api/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  @POST("Auth/register")
  Future<void> register(@Body() RegisterRequest request);

  @POST("Auth/login")
  Future<LoginResponse> login(@Body() LoginRequest request);

  @POST("Auth/forgot-password")
  Future<void> forgotPassword(@Body() ForgotPasswordRequest request);

  @POST("Auth/verify-otp")
  Future<void> verifyResetCode(@Body() VerifyResetPassword request);

  @GET("Auth/users")
  Future<List<ProfileResponse>> getUsers(@Header("Authorization") String token);

  @POST("Auth/logout")
  Future<void> logout(@Header("Authorization") String token);

  @POST("Auth/reset-password")
  Future<void> resetPassword(@Body() Reset_Password request);

  @GET("Profile/dashboard")
  Future<DashboardResponse> getDashboard();
  @MultiPart()
  @POST("Documents/summarize-url")
  Future<SummarizeUrlResponse> summarizeUrl(
    @Part(name: "url") String url,
    @Part(name: "language") String language,
    @Part(name: "format") String format,
    @Part(name: "length") String length,
    @Part(name: "session_id") String sessionId,
  );
  @MultiPart()
  @POST("Documents/chat")
  Future<ChatResponse> chat(
    @Part(name: "sessionId") String sessionId,
    @Part(name: "session_id") String sessionId2,
    @Part(name: "message") String message,
  );
  @PATCH("v1/views/changePassword")
  Future<ChangeProfilePasswordResponse> changePassword(
    @Header("token") String token,
    @Body() ChangePasswordRequest request,
  );
  @MultiPart()
  @POST("Documents/summarize")
  Future<SummarizeResponse> summarizeDocument(
    @Part(name: "file") MultipartFile file,
    @Part(name: "language") String language,
    @Part(name: "format") String format,
    @Part(name: "length") String length,
    @Part(name: "session_id") String sessionId,
  );

  @MultiPart()
  @POST("Documents/quiz")
  Future<QuizResponse> getQuiz(
      @Part(name: "session_id") String sessionId,
      @Part(name: "language") String language,
      );

  @POST("Documents/compare-topics")
  Future<CompareResponse> compareDocuments(
      @Body() CompareRequest request,
      );

  @GET("Documents/favorites")
  Future<SavedListResponse> getFavorites();
}
