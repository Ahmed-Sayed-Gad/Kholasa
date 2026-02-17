sealed class VerifyCodeState {}

class VerifyCodeInitial extends VerifyCodeState {}

class VerifyCodeLoading extends VerifyCodeState {}

class VerifyCodeSuccess extends VerifyCodeState {}

class VerifyCodeError extends VerifyCodeState {
  final String message;
  VerifyCodeError(this.message);
}
