import 'package:dartz/dartz.dart';
import 'package:syria_glow/core/errors/failure.dart';
import 'package:syria_glow/features/auth/data/models/forgot_password_response.dart';
import 'package:syria_glow/features/auth/domain/repos/auth_repository.dart';

class ForgotPasswordUseCase {
  final AuthRepository authRepository;

  const ForgotPasswordUseCase({required this.authRepository});

  Future<Either<Failure, ForgotPasswordResponse>> call({
    required String email,
  }) async {
    return await authRepository.forgotPassword(email: email);
  }
}
