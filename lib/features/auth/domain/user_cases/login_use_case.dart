import 'package:dartz/dartz.dart';
import 'package:syria_glow/core/errors/failure.dart';
import 'package:syria_glow/features/auth/data/models/auth_response.dart';
import 'package:syria_glow/features/auth/data/models/login_request.dart';
import 'package:syria_glow/features/auth/domain/repos/auth_repository.dart';

class LoginUseCase {
  LoginUseCase({required this.authRepository});
  final AuthRepository authRepository;

  Future<Either<Failure, AuthResponse>> call({
    required LoginRequest loginRequest,
  }) async {
    return await authRepository.login(loginRequest: loginRequest);
  }
}
