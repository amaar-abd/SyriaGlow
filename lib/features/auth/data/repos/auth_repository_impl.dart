import 'package:dartz/dartz.dart';
import 'package:syria_glow/core/errors/dio_error_handler.dart';
import 'package:syria_glow/core/errors/failure.dart';
import 'package:syria_glow/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:syria_glow/features/auth/data/models/auth_response.dart';
import 'package:syria_glow/features/auth/data/models/register_request.dart';
import 'package:syria_glow/features/auth/domain/repos/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required this.authRemoteDataSource});
  final AuthRemoteDataSource authRemoteDataSource;

  @override
  Future<Either<Failure, AuthResponse>> register({
    required RegisterRequest registerRequest,
  }) async {
    try {
      final data = await authRemoteDataSource.signUpWithEmailAndPassword(
        registerRequest,
      );
      return right(data);
    } catch (e) {
      print("🚨🚨 يا عمار الخطأ هون: $e");
      return left(DioErrorHandler.handle(e));
    }
  }
}
