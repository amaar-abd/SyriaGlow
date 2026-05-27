import 'package:dartz/dartz.dart';
import 'package:syria_glow/core/errors/failure.dart';
import 'package:syria_glow/features/auth/data/models/auth_response.dart';
import 'package:syria_glow/features/auth/data/models/register_request.dart';
import 'package:syria_glow/features/auth/domain/repos/auth_repository.dart';

class RegisterUseCase {
  RegisterUseCase({required this.authRepository});
  final AuthRepository authRepository;

  Future<Either<Failure, AuthResponse>> call({
    required RegisterRequest registerRequest,
  }) async {
    return await authRepository.register(registerRequest: registerRequest);
  }
}
