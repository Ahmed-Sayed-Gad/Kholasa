import '../../../domain/auth/entities/user_entity.dart';

abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {
  final UserEntity user;

  SignInSuccess(this.user);
}

class SignInError extends SignInState {
  final String message;

  SignInError(this.message);
}