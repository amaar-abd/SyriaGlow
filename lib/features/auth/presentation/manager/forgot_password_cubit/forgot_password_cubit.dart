import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syria_glow/features/auth/data/models/reset_password_request.dart';
import 'package:syria_glow/features/auth/domain/use_cases/forgot_password_use_case.dart';
import 'package:syria_glow/features/auth/domain/use_cases/reset_password_use_case.dart';
import 'package:syria_glow/features/auth/domain/use_cases/verify_reset_code_use_case.dart';
part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit(
    this.forgotPasswordUseCase,
    this.verifyResetCodeUseCase,
    this.resetPasswordUseCase,
  ) : super(ForgotPsswordInitial());

  final ForgotPasswordUseCase forgotPasswordUseCase;
  final VerifyResetCodeUseCase verifyResetCodeUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;

  String? savedEmail;
  String? resetToken;
  Future<void> sendForgotPasswordEmail({required String email}) async {
    emit(ForgotPasswordLoading());

    final result = await forgotPasswordUseCase(email: email);

    result.fold(
      (failure) => emit(ForgotPasswordError(message: failure.message)),
      (response) {
        savedEmail = email;
        emit(ForgotPasswordSuccess(message: response.message));
      },
    );
  }

  Future<void> verifyResetCode({required String code}) async {
    if (savedEmail == null) {
      emit(VerifyCodeError(message: "حدث خطأ، يرجى إعادة إدخال الإيميل"));
      return;
    }

    emit(VerifyCodeLoading());

    final result = await verifyResetCodeUseCase(email: savedEmail!, code: code);

    result.fold((failure) => emit(VerifyCodeError(message: failure.message)), (
      response,
    ) {
      resetToken = response.data.resetToken;
      emit(VerifyCodeSuccess(token: response.data.resetToken));
    });
  }

  Future<void> resetPassword({
    required String password,
    required String confirmPassword,
  }) async {
    if (savedEmail == null || resetToken == null) {
      emit(
        ResetPasswordError(
          message: "تنتهي صلاحية الجلسة، يرجى المحاولة من جديد",
        ),
      );
      return;
    }

    emit(ResetPasswordLoading());

    final result = await resetPasswordUseCase(
      resetPasswordRequest: ResetPasswordRequest(
        email: savedEmail!,
        resetToken: resetToken!,
        password: password,
        passwordConfirmation: confirmPassword,
      ),
    );

    result.fold(
      (failure) => emit(ResetPasswordError(message: failure.message)),
      (successMessage) => emit(ResetPasswordSuccess(message: successMessage)),
    );
  }
}
