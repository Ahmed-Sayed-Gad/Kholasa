import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';

import '../../../api/auth/request/Verify_Reset_password.dart';
import '../../../domain/auth/use_case/VerifyResetCodeUseCase.dart';
import 'verify_reset_code_state.dart';

@injectable
class VerifyResetCodeCubit extends Cubit<VerifyResetCodeState> {
  final VerifyResetCodeUseCase _useCase;

  VerifyResetCodeCubit(this._useCase) : super(VerifyResetCodeInitial());

  Future<void> verifyCode(String code) async {
    emit(VerifyResetCodeLoading());

    final result = await _useCase(
      Verify_reset_password(resetCode: code),
    );

    result.fold(
      onSuccess: (_) {
        emit(VerifyResetCodeSuccess());
      },
      onFailure: (failure) {
        emit(VerifyResetCodeError(failure.userFriendlyMessage));
      },
    );
  }
}