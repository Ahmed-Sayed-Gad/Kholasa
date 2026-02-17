import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';

import '../../../domain/auth/use_case/SignUp_UsaCase.dart';
import 'signup_state.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> {
  final SignUp_UsaCase useCase;

  SignUpCubit(this.useCase) : super(SignUpInitial());

  Future<void> signUp(request) async {
    emit(SignUpLoading());

    final result = await useCase.signUp(request);

    result.fold(
      onSuccess: (_) {
        emit(SignUpSuccess());
      },
      onFailure: (f) {
        emit(SignUpError(f.userFriendlyMessage));
      },
    );
  }
}
