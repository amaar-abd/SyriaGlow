import 'package:dartz/dartz.dart';
import 'package:syria_glow/core/errors/failure.dart';
import 'package:syria_glow/features/auth/data/models/verify_reset_code_response.dart';
import 'package:syria_glow/features/auth/domain/repos/auth_repository.dart';

class VerifyResetCodeUseCase {
  final AuthRepository authRepository;

  const VerifyResetCodeUseCase({required this.authRepository});

  Future<Either<Failure, VerifyResetCodeResponse>> call({
    required String email,
    required String code,
  }) async {
    return await authRepository.verifyResetCode(email: email, code: code);
  }
}
