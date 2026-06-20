part of 'logout_cubit.dart';

sealed class LogoutState {}

final class LogoutInitial extends LogoutState {}

final class LogoutLoading extends LogoutState {}

final class LogoutSuccess extends LogoutState {
  final String message;

  LogoutSuccess({required this.message});
}

final class LogoutError extends LogoutState {
  final String message;

  LogoutError({required this.message});
}
