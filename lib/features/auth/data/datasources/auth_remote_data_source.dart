import 'package:syria_glow/features/auth/data/models/auth_response.dart';
import 'package:syria_glow/features/auth/data/models/forgot_password_response.dart';
import 'package:syria_glow/features/auth/data/models/login_request.dart';
import 'package:syria_glow/features/auth/data/models/register_request.dart';
import 'package:syria_glow/features/auth/data/models/reset_password_request.dart';
import 'package:syria_glow/features/auth/data/models/verify_reset_code_response.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponse> signUpWithEmailAndPassword(
    RegisterRequest registerRequest,
  );
  Future<AuthResponse> signInWithEmailAndPassword(LoginRequest loginRequest);
  Future<void> logOut();

  Future<ForgotPasswordResponse> forgotPassword({required String email});

  Future<VerifyResetCodeResponse> verifyResetCode({
    required String email, 
    required String code,
  });


  Future<String> resetPassword({
    required ResetPasswordRequest resetPasswordRequest
  });
}
