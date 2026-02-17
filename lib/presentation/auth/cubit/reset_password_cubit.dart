import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';

import '../../../api/auth/request/Reset Password.dart';
import '../../../domain/auth/use_case/ResetPasswordUseCase.dart';
import 'reset_password_state.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordUseCase useCase;

  ResetPasswordCubit(this.useCase) : super(ResetPasswordInitial());

  Future<void> resetPassword({
    required String email,
    required String password,
  }) async {
    emit(ResetPasswordLoading());

    final result = await useCase.resetPassword(
      Reset_Password(
        email: email,
        newPassword: password,
      ),
    );

    result.fold(
      onSuccess: (_) {
        emit(ResetPasswordSuccess());
      },
      onFailure: (f) {
        emit(ResetPasswordError(f.userFriendlyMessage));
      },
    );
  }
}
