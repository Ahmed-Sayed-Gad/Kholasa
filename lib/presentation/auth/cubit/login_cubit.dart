import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';

import '../../../api/auth/request/login_request.dart';
import '../../../core/services/auth_storage.dart';
import '../../../core/services/user_storage.dart';
import '../../../domain/auth/use_case/login_usecase.dart';
import '../../../domain/home/UseCase/remember_me_usecase.dart';

import 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  final RememberMeUseCase rememberMeUseCase;

  LoginCubit(
    this.loginUseCase,
    this.rememberMeUseCase,
  ) : super(LoginInitial());

  Future<void> login(
    LoginRequest request,
    bool rememberMe,
  ) async {
    emit(LoginLoading());

    final result = await loginUseCase(request);

    result.fold(
      onSuccess: (user) async {
        await AuthStorage.saveTokens(
          accessToken: user.accessToken,
          refreshToken: user.refreshToken,
        );

        await UserStorage.saveUser(
          name: user.name,
          email: user.email,
        );

        await rememberMeUseCase.saveRememberMe(
          rememberMe: rememberMe,
          email: request.email,
        );

        emit(LoginSuccess(user));
      },
      onFailure: (failure) {
        emit(
          LoginError(
            failure.userFriendlyMessage,
          ),
        );
      },
    );
  }
}