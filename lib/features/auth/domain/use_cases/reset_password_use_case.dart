import 'package:dartz/dartz.dart';
import 'package:syria_glow/core/errors/failure.dart';
import 'package:syria_glow/features/auth/data/models/reset_password_request.dart';
import 'package:syria_glow/features/auth/domain/repos/auth_repository.dart';

class ResetPasswordUseCase {
  final AuthRepository authRepository;

 const ResetPasswordUseCase({required this.authRepository});

 Future<Either<Failure, String>> call({
  
     required ResetPasswordRequest resetPasswordRequest,
  
  }) async {
    return await authRepository.resetPassword(resetPasswordRequest: resetPasswordRequest);
  }
}
