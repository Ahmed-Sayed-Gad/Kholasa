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
import 'package:injectable/injectable.dart' as _i526;

import '../../api/Api_Client.dart' as _i559;
import '../../api/auth/data_source_impl/ForgotPasswordRemoteDataSourceImpl.dart'
    as _i358;
import '../../api/auth/data_source_impl/ResetPasswordRemoteDataSourceImpl.dart'
    as _i811;
import '../../api/auth/data_source_impl/SignInRemoteDataSourceImpl.dart'
    as _i1040;
import '../../api/auth/data_source_impl/SignUp_Data_Source_Imp.dart' as _i112;
import '../../api/auth/data_source_impl/VerifyResetCodeDataSourceImpl.dart'
    as _i79;
import '../../api/home/Data_Source_Imp/change_password_data_source_impl.dart'
    as _i396;
import '../../Data/auth/data_source/change_password_data_source.dart' as _i431;
import '../../Data/auth/data_source/ForgotPasswordRemoteDataSource.dart'
    as _i961;
import '../../Data/auth/data_source/ResetPasswordRemoteDataSource.dart'
    as _i866;
import '../../Data/auth/data_source/SignInRemoteDataSource.dart' as _i753;
import '../../Data/auth/data_source/SignUp_Data_Source.dart' as _i329;
import '../../Data/auth/data_source/verifyResetCodeDataSource.dart' as _i84;
import '../../Data/auth/repositories_impl/change_password_repository_impl.dart'
    as _i819;
import '../../Data/auth/repositories_impl/ForgotPasswordRepoImpl.dar.dart'
    as _i911;
import '../../Data/auth/repositories_impl/remember_me_repository_impl.dart'
    as _i906;
import '../../Data/auth/repositories_impl/ResetPasswordRepoImpl.dart' as _i251;
import '../../Data/auth/repositories_impl/SignInRepoImpl.dart' as _i681;
import '../../Data/auth/repositories_impl/SignUp_Rpo_Imp.dart' as _i253;
import '../../Data/auth/repositories_impl/VerifyResetCodeRepoImpl.dart'
    as _i654;
import '../../Data/home/repositries_Imp/home_repository_impl.dart' as _i850;
import '../../Data/upload/data_sources/file_picker_data_source.dart' as _i1060;
import '../../domain/auth/repositories/change_password_repository.dart'
    as _i118;
import '../../domain/auth/repositories/forgot_password_reposetories.dart'
    as _i1056;
import '../../domain/auth/repositories/remember_me_repository.dart' as _i308;
import '../../domain/auth/repositories/Reset_password_reposetories.dart'
    as _i670;
import '../../domain/auth/repositories/sign_in_reposetories.dart' as _i218;
import '../../domain/auth/repositories/SignUp_reposetries.dart' as _i147;
import '../../domain/auth/repositories/verify_reset_code.dart' as _i223;
import '../../domain/auth/use_case/change_password_use_case.dart' as _i1;
import '../../domain/auth/use_case/ForgotPasswordUseCase.dart' as _i468;
import '../../domain/auth/use_case/ResetPasswordUseCase.dart' as _i681;
import '../../domain/auth/use_case/SignInUseCase.dart' as _i236;
import '../../domain/auth/use_case/SignUp_UsaCase.dart' as _i346;
import '../../domain/auth/use_case/VerifyResetCodeUseCase.dart' as _i342;
import '../../domain/export/repositories/export_repository.dart' as _i205;
import '../../domain/export/use_case/export_summary_use_case.dart' as _i155;
import '../../domain/home/repositories/home_repository.dart' as _i536;
import '../../domain/home/UsaCase/get_home_banners_use_case.dart' as _i676;
import '../../domain/home/UsaCase/get_recent_items_use_case.dart' as _i865;
import '../../domain/home/UsaCase/remember_me_usecase.dart' as _i1017;
import '../../domain/models/use_cases_imp/remember_me_use_case_imp.dart'
    as _i656;
import '../../domain/summarize/use_case/generate_summary_use_case.dart'
    as _i218;
import '../../domain/upload/repositories/upload_repository.dart' as _i881;
import '../../domain/upload/usecases/pick_and_validate_file_usecase.dart'
    as _i742;
import '../../presentation/auth/cubit/change_password_cubit.dart' as _i63;
import '../../presentation/auth/cubit/forget_password_cubit.dart' as _i848;
import '../../presentation/auth/cubit/reset_password_cubit.dart' as _i578;
import '../../presentation/auth/cubit/signin_cubit.dart' as _i906;
import '../../presentation/auth/cubit/signup_cubit.dart' as _i548;
import '../../presentation/auth/cubit/verify_reset_code_cubit.dart' as _i1071;
import '../../presentation/export/cubit/export_cubit.dart' as _i457;
import '../../presentation/home/cubit/home_cubit.dart' as _i288;
import '../../presentation/session/cubit/upload_session_cubit.dart' as _i787;
import '../../presentation/summarize/cubit/summarize_cubit.dart' as _i98;
import '../../presentation/upload/cubit/upload_cubit.dart' as _i727;
import '../errors/handlers/auth_error_handler.dart' as _i52;
import '../errors/handlers/home_error_handler.dart' as _i295;
import '../errors/utils/error_handler.dart' as _i637;
import 'app_module.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    final uploadModule = _$UploadModule();
    final exportModule = _$ExportModule();
    gh.factory<_i52.AuthErrorHandler>(() => _i52.AuthErrorHandler());
    gh.factory<_i295.HomeErrorHandler>(() => _i295.HomeErrorHandler());
    gh.factory<_i637.ErrorHandler>(() => _i637.ErrorHandler());
    gh.factory<_i727.UploadCubit>(() => _i727.UploadCubit());
    gh.lazySingleton<_i361.Dio>(() => appModule.dio);
    gh.lazySingleton<_i558.FlutterSecureStorage>(() => appModule.secureStorage);
    gh.lazySingleton<_i1060.FilePickerDataSource>(
      () => uploadModule.filePickerDataSource(),
    );
    gh.lazySingleton<_i205.ExportRepository>(
      () => exportModule.exportRepository(),
    );
    gh.lazySingleton<_i787.UploadSessionCubit>(
      () => _i787.UploadSessionCubit(),
    );
    gh.factory<_i98.SummarizeCubit>(
      () => _i98.SummarizeCubit(gh<_i218.GenerateSummaryUseCase>()),
    );
    gh.lazySingleton<_i559.ApiClient>(
      () => appModule.provideApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i431.ChangePasswordDataSource>(
      () => _i396.ChangePasswordDataSourceImpl(
        gh<_i559.ApiClient>(),
        gh<_i295.HomeErrorHandler>(),
      ),
    );
    gh.lazySingleton<_i536.HomeRepository>(() => _i850.HomeRepositoryImpl());
    gh.factory<_i866.ResetPasswordRemoteDataSource>(
      () => _i811.ResetPasswordRemoteDataSourceImpl(
        gh<_i559.ApiClient>(),
        gh<_i52.AuthErrorHandler>(),
      ),
    );
    gh.factory<_i961.ForgotPasswordRemoteDataSource>(
      () => _i358.ForgotPasswordRemoteDataSourceImpl(
        gh<_i559.ApiClient>(),
        gh<_i52.AuthErrorHandler>(),
      ),
    );
    gh.lazySingleton<_i881.UploadRepository>(
      () => uploadModule.uploadRepository(gh<_i1060.FilePickerDataSource>()),
    );
    gh.factory<_i742.PickAndValidateFileUseCase>(
      () =>
          uploadModule.pickAndValidateFileUseCase(gh<_i881.UploadRepository>()),
    );
    gh.factory<_i84.VerifyResetCodeRemoteDataSource>(
      () => _i79.VerifyResetCodeRemoteDataSourceImpl(
        gh<_i559.ApiClient>(),
        gh<_i52.AuthErrorHandler>(),
      ),
    );
    gh.factory<_i1056.ForgotPasswordReposetories>(
      () => _i911.ForgotPasswordRepoImpl(
        gh<_i961.ForgotPasswordRemoteDataSource>(),
      ),
    );
    gh.factory<_i223.VerifyResetCodeReposetories>(
      () => _i654.VerifyResetCodeRepoImp(
        gh<_i84.VerifyResetCodeRemoteDataSource>(),
      ),
    );
    gh.factory<_i118.ChangePasswordRepository>(
      () => _i819.ChangePasswordRepositoryImpl(
        gh<_i431.ChangePasswordDataSource>(),
      ),
    );
    gh.factory<_i155.ExportSummaryUseCase>(
      () => exportModule.exportSummaryUseCase(gh<_i205.ExportRepository>()),
    );
    gh.lazySingleton<_i308.RememberMeRepository>(
      () => _i906.RememberMeRepositoryImpl(gh<_i558.FlutterSecureStorage>()),
    );
    gh.factory<_i753.SignInRemoteDataSource>(
      () => _i1040.Signinremotedatasourceimpl(
        gh<_i559.ApiClient>(),
        gh<_i52.AuthErrorHandler>(),
      ),
    );
    gh.factory<_i329.SignUpDataSource>(
      () => _i112.SidnUp_Data_Source_Imp(
        gh<_i559.ApiClient>(),
        gh<_i52.AuthErrorHandler>(),
      ),
    );
    gh.factory<_i147.SignUp_Rpo>(
      () => _i253.SignUp_Repo_Imp(gh<_i329.SignUpDataSource>()),
    );
    gh.lazySingleton<_i1017.RememberMeUseCase>(
      () => _i656.RememberMeUseCaseImpl(gh<_i308.RememberMeRepository>()),
    );
    gh.factory<_i457.ExportCubit>(
      () => _i457.ExportCubit(gh<_i155.ExportSummaryUseCase>()),
    );
    gh.factory<_i676.GetHomeBannersUseCase>(
      () => _i676.GetHomeBannersUseCase(gh<_i536.HomeRepository>()),
    );
    gh.factory<_i865.GetRecentItemsUseCase>(
      () => _i865.GetRecentItemsUseCase(gh<_i536.HomeRepository>()),
    );
    gh.factory<_i346.SignUp_UsaCase>(
      () => _i346.SignUp_UsaCase(gh<_i147.SignUp_Rpo>()),
    );
    gh.factory<_i218.SignInRepositories>(
      () => _i681.SignInRepoImpl(gh<_i753.SignInRemoteDataSource>()),
    );
    gh.factory<_i342.VerifyResetCodeUseCase>(
      () =>
          _i342.VerifyResetCodeUseCase(gh<_i223.VerifyResetCodeReposetories>()),
    );
    gh.factory<_i670.ResetPasswordReposetories>(
      () =>
          _i251.ResetPasswordRepoImp(gh<_i866.ResetPasswordRemoteDataSource>()),
    );
    gh.factory<_i681.ResetPasswordUseCase>(
      () => _i681.ResetPasswordUseCase(gh<_i670.ResetPasswordReposetories>()),
    );
    gh.factory<_i236.SignInUseCase>(
      () => _i236.SignInUseCase(gh<_i218.SignInRepositories>()),
    );
    gh.factory<_i906.SignInCubit>(
      () => _i906.SignInCubit(gh<_i236.SignInUseCase>()),
    );
    gh.factory<_i468.ForgotPasswordUseCase>(
      () =>
          _i468.ForgotPasswordUseCase(gh<_i1056.ForgotPasswordReposetories>()),
    );
    gh.factory<_i548.SignUpCubit>(
      () => _i548.SignUpCubit(gh<_i346.SignUp_UsaCase>()),
    );
    gh.factory<_i1.ChangePasswordUseCase>(
      () => _i1.ChangePasswordUseCase(gh<_i118.ChangePasswordRepository>()),
    );
    gh.factory<_i1071.VerifyCodeCubit>(
      () => _i1071.VerifyCodeCubit(gh<_i342.VerifyResetCodeUseCase>()),
    );
    gh.factory<_i288.HomeCubit>(
      () => _i288.HomeCubit(
        gh<_i676.GetHomeBannersUseCase>(),
        gh<_i865.GetRecentItemsUseCase>(),
      ),
    );
    gh.factory<_i848.ForgetPasswordCubit>(
      () => _i848.ForgetPasswordCubit(gh<_i468.ForgotPasswordUseCase>()),
    );
    gh.factory<_i63.ChangePasswordCubit>(
      () => _i63.ChangePasswordCubit(gh<_i1.ChangePasswordUseCase>()),
    );
    gh.factory<_i578.ResetPasswordCubit>(
      () => _i578.ResetPasswordCubit(gh<_i681.ResetPasswordUseCase>()),
    );
    return this;
  }
}

class _$AppModule extends _i460.AppModule {}

class _$UploadModule extends _i460.UploadModule {}

class _$ExportModule extends _i460.ExportModule {}
