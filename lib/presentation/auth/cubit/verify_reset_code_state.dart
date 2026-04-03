abstract class VerifyResetCodeState {}

class VerifyResetCodeInitial extends VerifyResetCodeState {}

class VerifyResetCodeLoading extends VerifyResetCodeState {}

class VerifyResetCodeSuccess extends VerifyResetCodeState {}

class VerifyResetCodeError extends VerifyResetCodeState {
  final String message;

  VerifyResetCodeError(this.message);
}