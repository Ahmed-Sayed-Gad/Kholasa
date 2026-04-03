import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';

import '../../../api/auth/request/sign_in_request.dart';
import '../../../domain/auth/use_case/SignInUseCase.dart';
import 'signin_state.dart';

@injectable
class SignInCubit extends Cubit<SignInState> {
  final SignInUseCase _signInUseCase;

  SignInCubit(this._signInUseCase) : super(SignInInitial());

  Future<void> signIn(SignInRequest request) async {
    emit(SignInLoading());

    final result = await _signInUseCase(request);

    result.fold(
      onSuccess: (user) {
        emit(SignInSuccess(user));
      },
      onFailure: (failure) {
        emit(SignInError(failure.userFriendlyMessage));
      },
    );
  }
}