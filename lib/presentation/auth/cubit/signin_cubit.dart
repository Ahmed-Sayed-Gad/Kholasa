import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';
import '../../../domain/auth/use_case/SignInUseCase.dart';
import 'signin_state.dart';

@injectable
class SignInCubit extends Cubit<SignInState> {
  final SignInUseCase useCase;

  SignInCubit(this.useCase) : super(SignInInitial());

  Future<void> signIn(request) async {
    emit(SignInLoading());

    final result = await useCase.signIn(request);

    result.fold(
      onSuccess: (_) {
        emit(SignInSuccess());
      },
      onFailure: (failure) {
        emit(SignInError(failure.userFriendlyMessage));
      },
    );
  }
}
