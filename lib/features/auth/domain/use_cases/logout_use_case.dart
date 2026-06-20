import 'package:dartz/dartz.dart';
import 'package:syria_glow/core/errors/failure.dart';
import 'package:syria_glow/features/auth/domain/repos/auth_repository.dart';

class LogoutUseCase {
  LogoutUseCase({required this.authRepository});
  final AuthRepository authRepository;

  Future<Either<Failure, String>> call({required String userToken}) async {
    return await authRepository.logOut(userToken: userToken);
  }
}
