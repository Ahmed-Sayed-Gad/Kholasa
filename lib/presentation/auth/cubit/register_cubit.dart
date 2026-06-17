import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';

import '../../../api/auth/request/register_request.dart';

import '../../../domain/auth/use_case/register_use_case.dart';
import 'register_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase registerUseCase;

  RegisterCubit(this.registerUseCase)
      : super(RegisterInitial());

  Future<void> register(
      RegisterRequest request,
      ) async {
    emit(RegisterLoading());

    final result = await registerUseCase(request);

    result.fold(
      onSuccess: (_) {
        emit(RegisterSuccess());
      },
      onFailure: (failure) {
        emit(
          RegisterError(
            failure.userFriendlyMessage,
          ),
        );
      },
    );
  }
}