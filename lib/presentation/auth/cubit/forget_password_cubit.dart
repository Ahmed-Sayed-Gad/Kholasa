import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';

import '../../../api/auth/request/forgot_password_request.dart';
import '../../../domain/auth/use_case/ForgotPasswordUseCase.dart';
import 'forget_password_state.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgotPasswordUseCase _useCase;

  ForgetPasswordCubit(this._useCase) : super(ForgetPasswordInitial());

  Future<void> sendCode(String email) async {
    emit(ForgetPasswordLoading());

    final result = await _useCase(
      ForgotPasswordRequest(email: email),
    );

    result.fold(
      onSuccess: (_) {
        emit(ForgetPasswordSuccess());
      },
      onFailure: (failure) {
        emit(ForgetPasswordError(failure.userFriendlyMessage));
      },
    );
  }
}