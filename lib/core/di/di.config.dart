// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:hive_ce/hive.dart' as _i738;
import 'package:hive_ce_flutter/hive_flutter.dart' as _i919;
import 'package:injectable/injectable.dart' as _i526;
import 'package:project_one_c3_team/api/api_client.dart' as _i777;
import 'package:project_one_c3_team/api/auth/data_source_impl/change_password_data_source_impl.dart'
    as _i763;
import 'package:project_one_c3_team/api/auth/data_source_impl/ForgotPasswordRemoteDataSourceImpl.dart'
    as _i876;
import 'package:project_one_c3_team/api/auth/data_source_impl/login_remote_data_source_impl.dart'
    as _i597;
import 'package:project_one_c3_team/api/auth/data_source_impl/logout_remote_data_source_impl.dart'
    as _i712;
import 'package:project_one_c3_team/api/auth/data_source_impl/register_Data_Source_Imp.dart'
    as _i615;
import 'package:project_one_c3_team/api/auth/data_source_impl/ResetPasswordRemoteDataSourceImpl.dart'
    as _i112;
import 'package:project_one_c3_team/api/auth/data_source_impl/VerifyResetCodeDataSourceImpl.dart'
    as _i811;
import 'package:project_one_c3_team/api/chat/data_source_impl/chat_remote_data_source_impl.dart'
    as _i701;
import 'package:project_one_c3_team/api/compare/data_sources_impl/compare_remote_data_source_impl.dart'
    as _i788;
import 'package:project_one_c3_team/api/home/link/data_source_impl/summarize_url_remote_data_source_impl.dart'
    as _i116;
import 'package:project_one_c3_team/api/profile/data_source_impl/profile_remote_data_source_impl.dart'
    as _i705;
import 'package:project_one_c3_team/api/quiz/data_sources_impl/quiz_remote_data_source_impl.dart'
    as _i300;
import 'package:project_one_c3_team/api/saved/data_source_impl/saved_remote_data_source_impl.dart'
    as _i494;
import 'package:project_one_c3_team/api/summarize/data_source_impl/summarize_remote_data_source_impl.dart'
    as _i318;
import 'package:project_one_c3_team/core/di/app_module.dart' as _i961;
import 'package:project_one_c3_team/core/di/shared_prefs_module.dart' as _i823;
import 'package:project_one_c3_team/core/errors/handlers/auth_error_handler.dart'
    as _i1070;
import 'package:project_one_c3_team/core/errors/handlers/home_error_handler.dart'
    as _i564;
import 'package:project_one_c3_team/core/errors/utils/error_handler.dart'
    as _i345;
import 'package:project_one_c3_team/core/services/notification_manager.dart'
    as _i1017;
import 'package:project_one_c3_team/Data/auth/data_source/change_password_data_source.dart'
    as _i827;
import 'package:project_one_c3_team/Data/auth/data_source/ForgotPasswordRemoteDataSource.dart'
    as _i939;
import 'package:project_one_c3_team/Data/auth/data_source/login_remote_data_source.dart'
    as _i754;
import 'package:project_one_c3_team/Data/auth/data_source/logout_remote_data_source.dart'
    as _i681;
import 'package:project_one_c3_team/Data/auth/data_source/register_Data_Source.dart'
    as _i233;
import 'package:project_one_c3_team/Data/auth/data_source/ResetPasswordRemoteDataSource.dart'
    as _i928;
import 'package:project_one_c3_team/Data/auth/data_source/verifyResetCodeDataSource.dart'
    as _i347;
import 'package:project_one_c3_team/Data/auth/repositories_impl/change_password_repository_impl.dart'
    as _i921;
import 'package:project_one_c3_team/Data/auth/repositories_impl/ForgotPasswordRepoImpl.dar.dart'
    as _i448;
import 'package:project_one_c3_team/Data/auth/repositories_impl/login_repo_Impl.dart'
    as _i734;
import 'package:project_one_c3_team/Data/auth/repositories_impl/logout_repository_impl.dart'
    as _i899;
import 'package:project_one_c3_team/Data/auth/repositories_impl/register_repo_impl.dart'
    as _i336;
import 'package:project_one_c3_team/Data/auth/repositories_impl/remember_me_repository_impl.dart'
    as _i563;
import 'package:project_one_c3_team/Data/auth/repositories_impl/ResetPasswordRepoImpl.dart'
    as _i127;
import 'package:project_one_c3_team/Data/auth/repositories_impl/VerifyResetCodeRepoImpl.dart'
    as _i586;
import 'package:project_one_c3_team/Data/chat/datasource/chat_remote_data_source.dart'
    as _i281;
import 'package:project_one_c3_team/Data/chat/repository/chat_repository_impl.dart'
    as _i914;
import 'package:project_one_c3_team/Data/compare/data_sources/compare_remote_data_source.dart'
    as _i740;
import 'package:project_one_c3_team/Data/compare/repositories_impl/compare_repository_impl.dart'
    as _i875;
import 'package:project_one_c3_team/Data/history/models/history_model.dart'
    as _i1007;
import 'package:project_one_c3_team/Data/home/repositries_Imp/home_repository_impl.dart'
    as _i990;
import 'package:project_one_c3_team/Data/link/data_source/summarize_url_remote_data_source.dart'
    as _i655;
import 'package:project_one_c3_team/Data/link/repositories_impl/summarize_url_remote_data_source_impl.dart'
    as _i1045;
import 'package:project_one_c3_team/Data/notification/data_sources/notification_local_data_source.dart'
    as _i410;
import 'package:project_one_c3_team/Data/notification/models/notification_model.dart'
    as _i175;
import 'package:project_one_c3_team/Data/notification/repositories_impl/notification_repository_impl.dart'
    as _i621;
import 'package:project_one_c3_team/Data/profile/data_source/profile_local_data_source.dart'
    as _i874;
import 'package:project_one_c3_team/Data/profile/data_source/profile_remote_data_source.dart'
    as _i117;
import 'package:project_one_c3_team/Data/profile/repositories_impl/profile_repository_impl.dart'
    as _i256;
import 'package:project_one_c3_team/Data/quiz/data_sources/quiz_remote_data_source.dart'
    as _i439;
import 'package:project_one_c3_team/Data/quiz/models/quiz_attempt_model.dart'
    as _i433;
import 'package:project_one_c3_team/Data/quiz/repositories_impl/quiz_repository_impl.dart'
    as _i518;
import 'package:project_one_c3_team/Data/saved/data_sources/saved_remote_data_source.dart'
    as _i391;
import 'package:project_one_c3_team/Data/saved/repositories_impl/saved_repository_impl.dart'
    as _i49;
import 'package:project_one_c3_team/Data/scan/repositories_impl/scan_repository_impl.dart'
    as _i1048;
import 'package:project_one_c3_team/Data/settings/data_source/settings_local_data_source.dart'
    as _i387;
import 'package:project_one_c3_team/Data/settings/repositories_impl/settings_repository_impl.dart'
    as _i788;
import 'package:project_one_c3_team/Data/summarize/data_source/summarize_remote_data_source.dart'
    as _i39;
import 'package:project_one_c3_team/Data/summarize/data_source/tts_local_data_source.dart'
    as _i262;
import 'package:project_one_c3_team/Data/summarize/repositories_impl/summarize_repository_impl.dart'
    as _i1066;
import 'package:project_one_c3_team/Data/summarize/repositories_impl/tts_repository_impl.dart'
    as _i635;
import 'package:project_one_c3_team/Data/upload/data_sources/file_picker_data_source.dart'
    as _i827;
import 'package:project_one_c3_team/domain/auth/repositories/change_password_repository.dart'
    as _i847;
import 'package:project_one_c3_team/domain/auth/repositories/forgot_password_reposetories.dart'
    as _i140;
import 'package:project_one_c3_team/domain/auth/repositories/login_repository.dart'
    as _i478;
import 'package:project_one_c3_team/domain/auth/repositories/logout_repository.dart'
    as _i887;
import 'package:project_one_c3_team/domain/auth/repositories/register_repositories.dart'
    as _i97;
import 'package:project_one_c3_team/domain/auth/repositories/remember_me_repository.dart'
    as _i861;
import 'package:project_one_c3_team/domain/auth/repositories/Reset_password_reposetories.dart'
    as _i1046;
import 'package:project_one_c3_team/domain/auth/repositories/verify_reset_code.dart'
    as _i978;
import 'package:project_one_c3_team/domain/auth/use_case/change_password_use_case.dart'
    as _i1060;
import 'package:project_one_c3_team/domain/auth/use_case/ForgotPasswordUseCase.dart'
    as _i94;
import 'package:project_one_c3_team/domain/auth/use_case/login_usecase.dart'
    as _i317;
import 'package:project_one_c3_team/domain/auth/use_case/logout_use_case.dart'
    as _i879;
import 'package:project_one_c3_team/domain/auth/use_case/register_use_case.dart'
    as _i742;
import 'package:project_one_c3_team/domain/auth/use_case/ResetPasswordUseCase.dart'
    as _i1021;
import 'package:project_one_c3_team/domain/auth/use_case/VerifyResetCodeUseCase.dart'
    as _i615;
import 'package:project_one_c3_team/domain/chat/repository/chat_repository.dart'
    as _i601;
import 'package:project_one_c3_team/domain/chat/usecases/send_message_use_case.dart'
    as _i1026;
import 'package:project_one_c3_team/domain/compare/repositories/compare_repository.dart'
    as _i878;
import 'package:project_one_c3_team/domain/compare/use_cases/compare_documents_use_case.dart'
    as _i97;
import 'package:project_one_c3_team/domain/export/repositories/export_repository.dart'
    as _i994;
import 'package:project_one_c3_team/domain/export/use_case/export_summary_use_case.dart'
    as _i1023;
import 'package:project_one_c3_team/domain/history/repositories/history_repository.dart'
    as _i662;
import 'package:project_one_c3_team/domain/history/use_cases/delete_item_use_case.dart'
    as _i1073;
import 'package:project_one_c3_team/domain/history/use_cases/get_history_use_case.dart'
    as _i590;
import 'package:project_one_c3_team/domain/history/use_cases/toggle_saved_use_case.dart'
    as _i215;
import 'package:project_one_c3_team/domain/home/repositories/home_repository.dart'
    as _i520;
import 'package:project_one_c3_team/domain/home/UseCase/get_home_banners_use_case.dart'
    as _i529;
import 'package:project_one_c3_team/domain/home/UseCase/get_recent_items_use_case.dart'
    as _i307;
import 'package:project_one_c3_team/domain/home/UseCase/remember_me_usecase.dart'
    as _i811;
import 'package:project_one_c3_team/domain/link/repositories/summarize_url_repository.dart'
    as _i205;
import 'package:project_one_c3_team/domain/link/use_case/summarize_url_use_case.dart'
    as _i56;
import 'package:project_one_c3_team/domain/models/use_cases_imp/remember_me_use_case_imp.dart'
    as _i851;
import 'package:project_one_c3_team/domain/notification/repositories/notification_repository.dart'
    as _i61;
import 'package:project_one_c3_team/domain/notification/use_cases/add_notification_use_case.dart'
    as _i695;
import 'package:project_one_c3_team/domain/notification/use_cases/clear_notifications_use_case.dart'
    as _i8;
import 'package:project_one_c3_team/domain/notification/use_cases/delete_notification_use_case.dart'
    as _i1032;
import 'package:project_one_c3_team/domain/notification/use_cases/get_notifications_use_case.dart'
    as _i1054;
import 'package:project_one_c3_team/domain/notification/use_cases/mark_all_notifications_read_use_case.dart'
    as _i864;
import 'package:project_one_c3_team/domain/notification/use_cases/mark_notification_read_use_case.dart'
    as _i862;
import 'package:project_one_c3_team/domain/profile/repositories/profile_repository.dart'
    as _i22;
import 'package:project_one_c3_team/domain/profile/use_case/get_profile_use_case.dart'
    as _i791;
import 'package:project_one_c3_team/domain/quiz/repositories/quiz_repository.dart'
    as _i270;
import 'package:project_one_c3_team/domain/quiz/use_cases/get_quiz_use_case.dart'
    as _i398;
import 'package:project_one_c3_team/domain/saved/repositories/saved_repository.dart'
    as _i1070;
import 'package:project_one_c3_team/domain/saved/use_cases/get_saved_items_use_case.dart'
    as _i210;
import 'package:project_one_c3_team/domain/scan/repositories/scan_repository.dart'
    as _i1068;
import 'package:project_one_c3_team/domain/scan/use_case/extract_text_use_case.dart'
    as _i1055;
import 'package:project_one_c3_team/domain/settings/repositories/settings_repository.dart'
    as _i398;
import 'package:project_one_c3_team/domain/settings/use_case/get_settings_use_case.dart'
    as _i534;
import 'package:project_one_c3_team/domain/settings/use_case/save_settings_use_case.dart'
    as _i81;
import 'package:project_one_c3_team/domain/settings/use_case/update_auto_save_use_case.dart'
    as _i415;
import 'package:project_one_c3_team/domain/settings/use_case/update_language_use_case.dart'
    as _i300;
import 'package:project_one_c3_team/domain/settings/use_case/update_notifications_use_case.dart'
    as _i522;
import 'package:project_one_c3_team/domain/settings/use_case/update_theme_use_case.dart'
    as _i959;
import 'package:project_one_c3_team/domain/summarize/repositories/summarize_repository.dart'
    as _i543;
import 'package:project_one_c3_team/domain/summarize/repositories/tts_repository.dart'
    as _i386;
import 'package:project_one_c3_team/domain/summarize/use_case/generate_summary_use_case.dart'
    as _i793;
import 'package:project_one_c3_team/domain/summarize/use_case/get_tts_status_use_case.dart'
    as _i476;
import 'package:project_one_c3_team/domain/summarize/use_case/speak_text_use_case.dart'
    as _i403;
import 'package:project_one_c3_team/domain/summarize/use_case/stop_speaking_use_case.dart'
    as _i148;
import 'package:project_one_c3_team/domain/upload/repositories/upload_repository.dart'
    as _i1010;
import 'package:project_one_c3_team/domain/upload/usecases/pick_and_validate_file_usecase.dart'
    as _i302;
import 'package:project_one_c3_team/presentation/auth/cubit/change_password_cubit.dart'
    as _i658;
import 'package:project_one_c3_team/presentation/auth/cubit/forget_password_cubit.dart'
    as _i297;
import 'package:project_one_c3_team/presentation/auth/cubit/login_cubit.dart'
    as _i461;
import 'package:project_one_c3_team/presentation/auth/cubit/logout_cubit.dart'
    as _i994;
import 'package:project_one_c3_team/presentation/auth/cubit/register_cubit.dart'
    as _i823;
import 'package:project_one_c3_team/presentation/auth/cubit/reset_password_cubit.dart'
    as _i218;
import 'package:project_one_c3_team/presentation/auth/cubit/verify_reset_code_cubit.dart'
    as _i735;
import 'package:project_one_c3_team/presentation/chat/cubit/chat_cubit.dart'
    as _i819;
import 'package:project_one_c3_team/presentation/compare/cubit/compare_cubit.dart'
    as _i307;
import 'package:project_one_c3_team/presentation/export/cubit/export_cubit.dart'
    as _i575;
import 'package:project_one_c3_team/presentation/history/cubit/history_cubit.dart'
    as _i584;
import 'package:project_one_c3_team/presentation/home/cubit/home_cubit.dart'
    as _i138;
import 'package:project_one_c3_team/presentation/link/cubit/link_cubit.dart'
    as _i1059;
import 'package:project_one_c3_team/presentation/notification/cubit/notification_cubit.dart'
    as _i780;
import 'package:project_one_c3_team/presentation/notification/cubit/saved_cubit.dart'
    as _i163;
import 'package:project_one_c3_team/presentation/profile/cubit/profile_cubit.dart'
    as _i799;
import 'package:project_one_c3_team/presentation/quiz/cubit/quiz_cubit.dart'
    as _i1045;
import 'package:project_one_c3_team/presentation/scan/cubit/scan_cubit.dart'
    as _i931;
import 'package:project_one_c3_team/presentation/session/cubit/upload_session_cubit.dart'
    as _i681;
import 'package:project_one_c3_team/presentation/settings/cubit/settings_cubit.dart'
    as _i805;
import 'package:project_one_c3_team/presentation/splash/cubit/splash_cubit.dart'
    as _i3;
import 'package:project_one_c3_team/presentation/summarize/cubit/listen_summary_cubit.dart'
    as _i680;
import 'package:project_one_c3_team/presentation/summarize/cubit/summarize_cubit.dart'
    as _i622;
import 'package:project_one_c3_team/presentation/upload/cubit/upload_cubit.dart'
    as _i11;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final historyModule = _$HistoryModule();
    final quizAttemptModule = _$QuizAttemptModule();
    final notificationBoxModule = _$NotificationBoxModule();
    final sharedPrefsModule = _$SharedPrefsModule();
    final appModule = _$AppModule();
    final uploadModule = _$UploadModule();
    final exportModule = _$ExportModule();
    await gh.factoryAsync<_i919.Box<_i1007.HistoryModel>>(
      () => historyModule.historyBox(),
      preResolve: true,
    );
    await gh.factoryAsync<_i919.Box<_i433.QuizAttemptModel>>(
      () => quizAttemptModule.quizAttemptBox(),
      preResolve: true,
    );
    await gh.factoryAsync<_i919.Box<_i175.NotificationModel>>(
      () => notificationBoxModule.notificationBox(),
      preResolve: true,
    );
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPrefsModule.prefs,
      preResolve: true,
    );
    gh.factory<_i1070.AuthErrorHandler>(() => _i1070.AuthErrorHandler());
    gh.factory<_i564.HomeErrorHandler>(() => _i564.HomeErrorHandler());
    gh.factory<_i345.ErrorHandler>(() => _i345.ErrorHandler());
    gh.factory<_i874.ProfileLocalDataSource>(
      () => _i874.ProfileLocalDataSource(),
    );
    gh.lazySingleton<_i361.Dio>(() => appModule.dio);
    gh.lazySingleton<_i558.FlutterSecureStorage>(() => appModule.secureStorage);
    gh.lazySingleton<_i827.FilePickerDataSource>(
      () => uploadModule.filePickerDataSource(),
    );
    gh.lazySingleton<_i994.ExportRepository>(
      () => exportModule.exportRepository(),
    );
    gh.lazySingleton<_i262.TtsLocalDataSource>(
      () => _i262.TtsLocalDataSource(),
    );
    gh.lazySingleton<_i681.UploadSessionCubit>(
      () => _i681.UploadSessionCubit(),
    );
    gh.lazySingleton<_i410.NotificationLocalDataSource>(
      () => _i410.NotificationLocalDataSource(
        gh<_i738.Box<_i175.NotificationModel>>(),
      ),
    );
    gh.lazySingleton<_i777.ApiClient>(
      () => appModule.provideApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i827.ChangePasswordDataSource>(
      () => _i763.ChangePasswordDataSourceImpl(
        gh<_i777.ApiClient>(),
        gh<_i564.HomeErrorHandler>(),
      ),
    );
    gh.lazySingleton<_i387.SettingsLocalDataSource>(
      () => _i387.SettingsLocalDataSourceImpl(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i1010.UploadRepository>(
      () => uploadModule.uploadRepository(gh<_i827.FilePickerDataSource>()),
    );
    gh.factory<_i117.ProfileRemoteDataSource>(
      () => _i705.ProfileRemoteDataSourceImpl(
        gh<_i777.ApiClient>(),
        gh<_i1070.AuthErrorHandler>(),
      ),
    );
    gh.factory<_i386.TtsRepository>(
      () => _i635.TtsRepositoryImpl(gh<_i262.TtsLocalDataSource>()),
    );
    gh.factory<_i302.PickAndValidateFileUseCase>(
      () => uploadModule.pickAndValidateFileUseCase(
        gh<_i1010.UploadRepository>(),
      ),
    );
    gh.factory<_i281.ChatRemoteDataSource>(
      () => _i701.ChatRemoteDataSourceImpl(
        gh<_i777.ApiClient>(),
        gh<_i1070.AuthErrorHandler>(),
      ),
    );
    gh.lazySingleton<_i398.SettingsRepository>(
      () => _i788.SettingsRepositoryImpl(gh<_i387.SettingsLocalDataSource>()),
    );
    gh.factory<_i391.SavedRemoteDataSource>(
      () => _i494.SavedRemoteDataSourceImpl(
        gh<_i777.ApiClient>(),
        gh<_i1070.AuthErrorHandler>(),
      ),
    );
    gh.factory<_i439.QuizRemoteDataSource>(
      () => _i300.QuizRemoteDataSourceImpl(
        gh<_i777.ApiClient>(),
        gh<_i1070.AuthErrorHandler>(),
      ),
    );
    gh.lazySingleton<_i662.HistoryRepository>(
      () =>
          historyModule.historyRepository(gh<_i919.Box<_i1007.HistoryModel>>()),
    );
    gh.factory<_i681.LogoutRemoteDataSource>(
      () => _i712.LogoutRemoteDataSourceImpl(
        gh<_i777.ApiClient>(),
        gh<_i1070.AuthErrorHandler>(),
      ),
    );
    gh.factory<_i1070.SavedRepository>(
      () => _i49.SavedRepositoryImpl(
        gh<_i391.SavedRemoteDataSource>(),
        gh<_i662.HistoryRepository>(),
      ),
    );
    gh.factory<_i347.VerifyResetCodeRemoteDataSource>(
      () => _i811.VerifyResetCodeRemoteDataSourceImpl(
        gh<_i777.ApiClient>(),
        gh<_i1070.AuthErrorHandler>(),
      ),
    );
    gh.factory<_i978.VerifyResetCodeRepositories>(
      () => _i586.VerifyResetCodeRepoImpl(
        gh<_i347.VerifyResetCodeRemoteDataSource>(),
      ),
    );
    gh.factory<_i476.GetTtsStatusUseCase>(
      () => _i476.GetTtsStatusUseCase(gh<_i386.TtsRepository>()),
    );
    gh.factory<_i403.SpeakTextUseCase>(
      () => _i403.SpeakTextUseCase(gh<_i386.TtsRepository>()),
    );
    gh.factory<_i148.StopSpeakingUseCase>(
      () => _i148.StopSpeakingUseCase(gh<_i386.TtsRepository>()),
    );
    gh.factory<_i233.RegisterDataSource>(
      () => _i615.RegisterDataSourceImp(
        gh<_i777.ApiClient>(),
        gh<_i1070.AuthErrorHandler>(),
      ),
    );
    gh.factory<_i740.CompareRemoteDataSource>(
      () => _i788.CompareRemoteDataSourceImpl(
        gh<_i777.ApiClient>(),
        gh<_i1070.AuthErrorHandler>(),
      ),
    );
    gh.factory<_i680.ListenSummaryCubit>(
      () => _i680.ListenSummaryCubit(
        gh<_i403.SpeakTextUseCase>(),
        gh<_i148.StopSpeakingUseCase>(),
        gh<_i476.GetTtsStatusUseCase>(),
      ),
    );
    gh.factory<_i754.LoginRemoteDataSource>(
      () => _i597.LoginRemoteDataSourceImpl(
        gh<_i777.ApiClient>(),
        gh<_i1070.AuthErrorHandler>(),
      ),
    );
    gh.factory<_i1023.ExportSummaryUseCase>(
      () => exportModule.exportSummaryUseCase(gh<_i994.ExportRepository>()),
    );
    gh.factory<_i655.SummarizeUrlRemoteDataSource>(
      () => _i116.SummarizeUrlRemoteDataSourceImpl(
        gh<_i777.ApiClient>(),
        gh<_i1070.AuthErrorHandler>(),
      ),
    );
    gh.factory<_i615.VerifyResetCodeUseCase>(
      () =>
          _i615.VerifyResetCodeUseCase(gh<_i978.VerifyResetCodeRepositories>()),
    );
    gh.factory<_i590.GetHistoryUseCase>(
      () => historyModule.getHistoryUseCase(gh<_i662.HistoryRepository>()),
    );
    gh.factory<_i215.ToggleSavedUseCase>(
      () => historyModule.toggleSavedUseCase(gh<_i662.HistoryRepository>()),
    );
    gh.factory<_i1073.DeleteItemUseCase>(
      () => historyModule.deleteItemUseCase(gh<_i662.HistoryRepository>()),
    );
    gh.factory<_i928.ResetPasswordRemoteDataSource>(
      () => _i112.ResetPasswordRemoteDataSourceImpl(
        gh<_i777.ApiClient>(),
        gh<_i1070.AuthErrorHandler>(),
      ),
    );
    gh.lazySingleton<_i861.RememberMeRepository>(
      () => _i563.RememberMeRepositoryImpl(gh<_i558.FlutterSecureStorage>()),
    );
    gh.factory<_i735.VerifyResetCodeCubit>(
      () => _i735.VerifyResetCodeCubit(gh<_i615.VerifyResetCodeUseCase>()),
    );
    gh.factory<_i939.ForgotPasswordRemoteDataSource>(
      () => _i876.ForgotPasswordRemoteDataSourceImpl(
        gh<_i777.ApiClient>(),
        gh<_i1070.AuthErrorHandler>(),
      ),
    );
    gh.lazySingleton<_i601.ChatRepository>(
      () => _i914.ChatRepositoryImpl(gh<_i281.ChatRemoteDataSource>()),
    );
    gh.lazySingleton<_i520.HomeRepository>(
      () => _i990.HomeRepositoryImpl(gh<_i662.HistoryRepository>()),
    );
    gh.factory<_i39.SummarizeRemoteDataSource>(
      () => _i318.SummarizeRemoteDataSourceImpl(
        gh<_i777.ApiClient>(),
        gh<_i1070.AuthErrorHandler>(),
      ),
    );
    gh.factory<_i140.ForgotPasswordRepositories>(
      () => _i448.ForgotPasswordRepoImpl(
        gh<_i939.ForgotPasswordRemoteDataSource>(),
      ),
    );
    gh.factory<_i1046.ResetPasswordRepositories>(
      () => _i127.ResetPasswordRepoImpl(
        gh<_i928.ResetPasswordRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i811.RememberMeUseCase>(
      () => _i851.RememberMeUseCaseImpl(gh<_i861.RememberMeRepository>()),
    );
    gh.lazySingleton<_i878.CompareRepository>(
      () => _i875.CompareRepositoryImpl(gh<_i740.CompareRemoteDataSource>()),
    );
    gh.factory<_i847.ChangePasswordRepository>(
      () => _i921.ChangePasswordRepositoryImpl(
        gh<_i827.ChangePasswordDataSource>(),
      ),
    );
    gh.factory<_i61.NotificationRepository>(
      () => _i621.NotificationRepositoryImpl(
        gh<_i410.NotificationLocalDataSource>(),
      ),
    );
    gh.factory<_i534.GetSettingsUseCase>(
      () => _i534.GetSettingsUseCase(gh<_i398.SettingsRepository>()),
    );
    gh.factory<_i81.SaveSettingsUseCase>(
      () => _i81.SaveSettingsUseCase(gh<_i398.SettingsRepository>()),
    );
    gh.factory<_i415.UpdateAutoSaveUseCase>(
      () => _i415.UpdateAutoSaveUseCase(gh<_i398.SettingsRepository>()),
    );
    gh.factory<_i300.UpdateLanguageUseCase>(
      () => _i300.UpdateLanguageUseCase(gh<_i398.SettingsRepository>()),
    );
    gh.factory<_i522.UpdateNotificationsUseCase>(
      () => _i522.UpdateNotificationsUseCase(gh<_i398.SettingsRepository>()),
    );
    gh.factory<_i959.UpdateThemeUseCase>(
      () => _i959.UpdateThemeUseCase(gh<_i398.SettingsRepository>()),
    );
    gh.factory<_i97.RegisterRepository>(
      () => _i336.RegisterRepositoryImpl(gh<_i233.RegisterDataSource>()),
    );
    gh.factory<_i529.GetHomeBannersUseCase>(
      () => _i529.GetHomeBannersUseCase(gh<_i520.HomeRepository>()),
    );
    gh.factory<_i307.GetRecentItemsUseCase>(
      () => _i307.GetRecentItemsUseCase(gh<_i520.HomeRepository>()),
    );
    gh.factory<_i22.ProfileRepository>(
      () => _i256.ProfileRepositoryImpl(
        gh<_i874.ProfileLocalDataSource>(),
        gh<_i117.ProfileRemoteDataSource>(),
      ),
    );
    gh.factory<_i210.GetSavedItemsUseCase>(
      () => _i210.GetSavedItemsUseCase(gh<_i1070.SavedRepository>()),
    );
    gh.lazySingleton<_i543.SummarizeRepository>(
      () =>
          _i1066.SummarizeRepositoryImpl(gh<_i39.SummarizeRemoteDataSource>()),
    );
    gh.lazySingleton<_i270.QuizRepository>(
      () => _i518.QuizRepositoryImpl(gh<_i439.QuizRemoteDataSource>()),
    );
    gh.lazySingleton<_i1068.ScanRepository>(
      () => _i1048.ScanRepositoryImpl(gh<_i39.SummarizeRemoteDataSource>()),
    );
    gh.factory<_i791.GetProfileUseCase>(
      () => _i791.GetProfileUseCase(gh<_i22.ProfileRepository>()),
    );
    gh.factory<_i1026.SendMessageUseCase>(
      () => _i1026.SendMessageUseCase(gh<_i601.ChatRepository>()),
    );
    gh.factory<_i478.LoginRepositories>(
      () => _i734.LoginRepoImpl(gh<_i754.LoginRemoteDataSource>()),
    );
    gh.factory<_i163.SavedCubit>(
      () => _i163.SavedCubit(gh<_i210.GetSavedItemsUseCase>()),
    );
    gh.factory<_i793.GenerateSummaryUseCase>(
      () => _i793.GenerateSummaryUseCase(
        gh<_i543.SummarizeRepository>(),
        gh<_i662.HistoryRepository>(),
        gh<_i398.SettingsRepository>(),
      ),
    );
    gh.factory<_i695.AddNotificationUseCase>(
      () => _i695.AddNotificationUseCase(gh<_i61.NotificationRepository>()),
    );
    gh.factory<_i8.ClearNotificationsUseCase>(
      () => _i8.ClearNotificationsUseCase(gh<_i61.NotificationRepository>()),
    );
    gh.factory<_i1032.DeleteNotificationUseCase>(
      () => _i1032.DeleteNotificationUseCase(gh<_i61.NotificationRepository>()),
    );
    gh.factory<_i1054.GetNotificationsUseCase>(
      () => _i1054.GetNotificationsUseCase(gh<_i61.NotificationRepository>()),
    );
    gh.factory<_i864.MarkAllNotificationsReadUseCase>(
      () => _i864.MarkAllNotificationsReadUseCase(
        gh<_i61.NotificationRepository>(),
      ),
    );
    gh.factory<_i862.MarkNotificationReadUseCase>(
      () =>
          _i862.MarkNotificationReadUseCase(gh<_i61.NotificationRepository>()),
    );
    gh.factory<_i205.SummarizeUrlRepository>(
      () => _i1045.SummarizeUrlRepositoryImpl(
        gh<_i655.SummarizeUrlRemoteDataSource>(),
      ),
    );
    gh.factory<_i97.CompareDocumentsUseCase>(
      () => _i97.CompareDocumentsUseCase(gh<_i878.CompareRepository>()),
    );
    gh.factory<_i138.HomeCubit>(
      () => _i138.HomeCubit(
        gh<_i529.GetHomeBannersUseCase>(),
        gh<_i307.GetRecentItemsUseCase>(),
        gh<_i1073.DeleteItemUseCase>(),
      ),
    );
    gh.factory<_i887.LogoutRepository>(
      () => _i899.LogoutRepositoryImpl(gh<_i681.LogoutRemoteDataSource>()),
    );
    gh.lazySingleton<_i1017.NotificationManager>(
      () => _i1017.NotificationManager(
        gh<_i61.NotificationRepository>(),
        gh<_i460.SharedPreferences>(),
      ),
    );
    gh.factory<_i1060.ChangePasswordUseCase>(
      () => _i1060.ChangePasswordUseCase(gh<_i847.ChangePasswordRepository>()),
    );
    gh.factory<_i879.LogoutUseCase>(
      () => _i879.LogoutUseCase(gh<_i887.LogoutRepository>()),
    );
    gh.factory<_i56.SummarizeUrlUseCase>(
      () => _i56.SummarizeUrlUseCase(gh<_i205.SummarizeUrlRepository>()),
    );
    gh.factory<_i94.ForgotPasswordUseCase>(
      () => _i94.ForgotPasswordUseCase(gh<_i140.ForgotPasswordRepositories>()),
    );
    gh.factory<_i799.ProfileCubit>(
      () => _i799.ProfileCubit(gh<_i791.GetProfileUseCase>()),
    );
    gh.factory<_i1021.ResetPasswordUseCase>(
      () => _i1021.ResetPasswordUseCase(gh<_i1046.ResetPasswordRepositories>()),
    );
    gh.factory<_i1055.ExtractTextUseCase>(
      () => _i1055.ExtractTextUseCase(gh<_i1068.ScanRepository>()),
    );
    gh.factory<_i780.NotificationCubit>(
      () => _i780.NotificationCubit(
        gh<_i1054.GetNotificationsUseCase>(),
        gh<_i1032.DeleteNotificationUseCase>(),
        gh<_i862.MarkNotificationReadUseCase>(),
        gh<_i864.MarkAllNotificationsReadUseCase>(),
        gh<_i8.ClearNotificationsUseCase>(),
      ),
    );
    gh.factory<_i3.SplashCubit>(
      () => _i3.SplashCubit(gh<_i811.RememberMeUseCase>()),
    );
    gh.factory<_i805.SettingsCubit>(
      () => _i805.SettingsCubit(
        gh<_i534.GetSettingsUseCase>(),
        gh<_i959.UpdateThemeUseCase>(),
        gh<_i522.UpdateNotificationsUseCase>(),
        gh<_i300.UpdateLanguageUseCase>(),
        gh<_i415.UpdateAutoSaveUseCase>(),
      ),
    );
    gh.factory<_i218.ResetPasswordCubit>(
      () => _i218.ResetPasswordCubit(gh<_i1021.ResetPasswordUseCase>()),
    );
    gh.factory<_i742.RegisterUseCase>(
      () => _i742.RegisterUseCase(gh<_i97.RegisterRepository>()),
    );
    gh.factory<_i994.LogoutCubit>(
      () => _i994.LogoutCubit(gh<_i879.LogoutUseCase>()),
    );
    gh.factory<_i398.GetQuizUseCase>(
      () => _i398.GetQuizUseCase(gh<_i270.QuizRepository>()),
    );
    gh.factory<_i584.HistoryCubit>(
      () => historyModule.historyCubit(
        gh<_i590.GetHistoryUseCase>(),
        gh<_i215.ToggleSavedUseCase>(),
        gh<_i1073.DeleteItemUseCase>(),
        gh<_i1017.NotificationManager>(),
      ),
    );
    gh.factory<_i297.ForgetPasswordCubit>(
      () => _i297.ForgetPasswordCubit(gh<_i94.ForgotPasswordUseCase>()),
    );
    gh.factory<_i819.ChatCubit>(
      () => _i819.ChatCubit(
        gh<_i1026.SendMessageUseCase>(),
        gh<_i590.GetHistoryUseCase>(),
        gh<_i1017.NotificationManager>(),
      ),
    );
    gh.factory<_i11.UploadCubit>(
      () => _i11.UploadCubit(gh<_i1017.NotificationManager>()),
    );
    gh.factory<_i1045.QuizCubit>(
      () => _i1045.QuizCubit(
        gh<_i398.GetQuizUseCase>(),
        gh<_i738.Box<_i433.QuizAttemptModel>>(),
        gh<_i1017.NotificationManager>(),
      ),
    );
    gh.factory<_i307.CompareCubit>(
      () => _i307.CompareCubit(
        gh<_i97.CompareDocumentsUseCase>(),
        gh<_i1017.NotificationManager>(),
      ),
    );
    gh.factory<_i317.LoginUseCase>(
      () => _i317.LoginUseCase(gh<_i478.LoginRepositories>()),
    );
    gh.factory<_i658.ChangePasswordCubit>(
      () => _i658.ChangePasswordCubit(gh<_i1060.ChangePasswordUseCase>()),
    );
    gh.factory<_i1059.LinkCubit>(
      () => _i1059.LinkCubit(gh<_i56.SummarizeUrlUseCase>()),
    );
    gh.factory<_i575.ExportCubit>(
      () => _i575.ExportCubit(
        gh<_i1023.ExportSummaryUseCase>(),
        gh<_i1017.NotificationManager>(),
      ),
    );
    gh.factory<_i622.SummarizeCubit>(
      () => _i622.SummarizeCubit(
        gh<_i793.GenerateSummaryUseCase>(),
        gh<_i398.SettingsRepository>(),
        gh<_i1017.NotificationManager>(),
      ),
    );
    gh.factory<_i931.ScanCubit>(
      () => _i931.ScanCubit(gh<_i1055.ExtractTextUseCase>()),
    );
    gh.factory<_i461.LoginCubit>(
      () => _i461.LoginCubit(
        gh<_i317.LoginUseCase>(),
        gh<_i811.RememberMeUseCase>(),
      ),
    );
    gh.factory<_i823.RegisterCubit>(
      () => _i823.RegisterCubit(gh<_i742.RegisterUseCase>()),
    );
    return this;
  }
}

class _$HistoryModule extends _i961.HistoryModule {}

class _$QuizAttemptModule extends _i961.QuizAttemptModule {}

class _$NotificationBoxModule extends _i961.NotificationBoxModule {}

class _$SharedPrefsModule extends _i823.SharedPrefsModule {}

class _$AppModule extends _i961.AppModule {}

class _$UploadModule extends _i961.UploadModule {}

class _$ExportModule extends _i961.ExportModule {}
