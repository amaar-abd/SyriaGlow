part of 'register_cubit.dart';

sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final AuthResponse authResponse;

  RegisterSuccess({required this.authResponse});
}

final class RegisterError extends RegisterState {
  final String error;

  RegisterError({required this.error});
}
