part of 'login_cubit.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final AuthResponse authResponse;

  LoginSuccess({required this.authResponse});
}

final class LoginError extends LoginState {
  final String error;

  LoginError({required this.error});
}
