import 'package:dartz/dartz.dart';
import 'package:syria_glow/core/errors/failure.dart';
import 'package:syria_glow/features/auth/data/models/auth_response.dart';
import 'package:syria_glow/features/auth/data/models/forgot_password_response.dart';
import 'package:syria_glow/features/auth/data/models/login_request.dart';
import 'package:syria_glow/features/auth/data/models/register_request.dart';
import 'package:syria_glow/features/auth/data/models/reset_password_request.dart';
import 'package:syria_glow/features/auth/data/models/verify_reset_code_response.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResponse>> register({
    required RegisterRequest registerRequest,
  });
  Future<Either<Failure, AuthResponse>> login({
    required LoginRequest loginRequest,
  });
  Future<Either<Failure, void>> logOut();

  Future<Either<Failure, ForgotPasswordResponse>> forgotPassword({
    required String email,
  });
  Future<Either<Failure, VerifyResetCodeResponse>> verifyResetCode({
    required String email,
    required String code,
  });
  Future<Either<Failure, String
  >> resetPassword({
    required ResetPasswordRequest resetPasswordRequest,
  });
}
