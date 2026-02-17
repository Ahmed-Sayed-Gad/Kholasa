import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';

import '../../../api/auth/request/Forgot_Password_Request.dart';
import '../../../domain/auth/use_case/ForgotPasswordUseCase.dart';
import 'forget_password_state.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgotPasswordUseCase useCase;

  ForgetPasswordCubit(this.useCase)
      : super(ForgetPasswordInitial());

  Future<void> sendCode(String email) async {
    emit(ForgetPasswordLoading());

    final result = await useCase.forgotPasswordSendCode(
      ForgotPasswordRequest(email: email),
    );

    result.fold(
      onSuccess: (_) {
        emit(ForgetPasswordSuccess());
      },
      onFailure: (f) {
        emit(ForgetPasswordError(f.userFriendlyMessage));
      },
    );
  }
}
