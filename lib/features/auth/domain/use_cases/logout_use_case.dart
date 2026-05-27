import 'package:dartz/dartz.dart';
import 'package:syria_glow/core/errors/failure.dart';
import 'package:syria_glow/features/auth/domain/repos/auth_repository.dart';

class LogoutUseCase {
  LogoutUseCase({required this.authRepository});
  final AuthRepository authRepository;

  Future<Either<Failure, void>> call() async {
    return await authRepository.logOut();
  }
}
