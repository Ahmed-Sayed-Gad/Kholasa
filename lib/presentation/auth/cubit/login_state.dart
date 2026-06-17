import '../../../domain/auth/entities/user_entity.dart';

sealed class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final UserEntity user;

  LoginSuccess(this.user);
}

class LoginError extends LoginState {
  final String message;

  LoginError(this.message);
}