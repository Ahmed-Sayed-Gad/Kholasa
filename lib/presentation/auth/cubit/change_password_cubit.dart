import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';

import '../../../api/home/request/change_password_request.dart';
import '../../../domain/auth/use_case/change_password_use_case.dart';
import 'change_password_state.dart';

@injectable
class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final ChangePasswordUseCase useCase;

  ChangePasswordCubit(this.useCase)
      : super(ChangePasswordInitial());

  Future<void> changePassword({
    required String token,
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {

    emit(ChangePasswordLoading());

    final request = ChangePasswordRequest(
      oldPassword: oldPassword,
      password: newPassword,
      rePassword: confirmPassword,
    );

    final result = await useCase.execute(token, request);

    result.fold(
      onSuccess: (_) {
        emit(ChangePasswordSuccess());
      },
      onFailure: (failure) {
        emit(ChangePasswordError(
          failure.userFriendlyMessage,
        ));
      },
    );
  }
}
