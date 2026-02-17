import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';
import 'package:project_one_c3_team/presentation/auth/cubit/verify_reset_code_state.dart';

import '../../../api/auth/request/Verify_Reset_password.dart';
import '../../../domain/auth/use_case/VerifyResetCodeUseCase.dart';
@injectable
class VerifyCodeCubit extends Cubit<VerifyCodeState> {
  final VerifyResetCodeUseCase useCase;

  VerifyCodeCubit(this.useCase) : super(VerifyCodeInitial());

  Future<void> verifyCode(String code) async {
    emit(VerifyCodeLoading());

    final result = await useCase.verifyResetCode(
      Verify_reset_password(resetCode: code),
    );

    result.fold(
      onSuccess: (_) {
        emit(VerifyCodeSuccess());
      },
      onFailure: (f) {
        emit(VerifyCodeError(f.userFriendlyMessage));
      },
    );
  }
}
