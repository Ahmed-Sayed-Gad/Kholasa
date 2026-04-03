import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';

import '../../../api/auth/request/SignUpRequest.dart';
import '../../../domain/auth/use_case/SignUp_UsaCase.dart';
import 'signup_state.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUseCase _useCase;

  SignUpCubit(this._useCase) : super(SignUpInitial());

  Future<void> signUp(SignUpRequest request) async {
    emit(SignUpLoading());

    final result = await _useCase(request);

    result.fold(
      onSuccess: (_) {
        emit(SignUpSuccess());
      },
      onFailure: (failure) {
        emit(SignUpError(failure.userFriendlyMessage));
      },
    );
  }
}