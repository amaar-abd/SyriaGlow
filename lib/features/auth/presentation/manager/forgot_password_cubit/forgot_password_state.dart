part of 'forgot_password_cubit.dart';


sealed class ForgotPasswordState {}
final class ForgotPsswordInitial extends ForgotPasswordState {}

class ForgotPasswordLoading extends ForgotPasswordState {}
class ForgotPasswordSuccess extends ForgotPasswordState {
  final String message;
  ForgotPasswordSuccess({required this.message});

}
class ForgotPasswordError extends ForgotPasswordState {
  final String message;

  ForgotPasswordError({required this.message});

}


class VerifyCodeLoading extends ForgotPasswordState {}
class VerifyCodeSuccess extends ForgotPasswordState {
  final String token;

  VerifyCodeSuccess({required this.token}); 

}
class VerifyCodeError extends ForgotPasswordState {
  final String message;

  VerifyCodeError({required this.message});

}


class ResetPasswordLoading extends ForgotPasswordState {}
class ResetPasswordSuccess extends ForgotPasswordState {
  final String message;

  ResetPasswordSuccess({required this.message});

}
class ResetPasswordError extends ForgotPasswordState {
  final String message;

  ResetPasswordError({required this.message});
 
}