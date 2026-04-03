import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';

import '../../../api/auth/request/Reset Password.dart';
import '../../../domain/auth/use_case/ResetPasswordUseCase.dart';
import 'reset_password_state.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordUseCase _useCase;

  ResetPasswordCubit(this._useCase) : super(ResetPasswordInitial());

  Future<void> resetPassword({
    required String email,
    required String password,
  }) async {
    emit(ResetPasswordLoading());

    final result = await _useCase(
      Reset_Password(
        email: email,
        password: password,
      ),
    );

    result.fold(
      onSuccess: (_) {
        emit(ResetPasswordSuccess());
      },
      onFailure: (failure) {
        emit(ResetPasswordError(failure.userFriendlyMessage));
      },
    );
  }
}