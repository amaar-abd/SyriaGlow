import 'package:dartz/dartz.dart';
import 'package:syria_glow/core/Constants/app_constatntes.dart';
import 'package:syria_glow/core/depandency_injection/service_locator.dart';
import 'package:syria_glow/core/errors/dio_error_handler.dart';
import 'package:syria_glow/core/errors/failure.dart';
import 'package:syria_glow/core/services/secure_storage_service.dart';
import 'package:syria_glow/core/services/shared_preferences_service.dart';
import 'package:syria_glow/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:syria_glow/features/auth/data/models/auth_response.dart';
import 'package:syria_glow/features/auth/data/models/forgot_password_response.dart';
import 'package:syria_glow/features/auth/data/models/login_request.dart';
import 'package:syria_glow/features/auth/data/models/register_request.dart';
import 'package:syria_glow/features/auth/data/models/reset_password_request.dart';
import 'package:syria_glow/features/auth/data/models/verify_reset_code_response.dart';
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
      return left(DioErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> login({
    required LoginRequest loginRequest,
  }) async {
    try {
      final data = await authRemoteDataSource.signInWithEmailAndPassword(
        loginRequest,
      );
      
      return right(data);
    } catch (e) {
    
      return left(DioErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, String>> logOut({required String userToken}) async {
    try {
     final data = await authRemoteDataSource.logOut(userToken: userToken);

     await sl<SharedPreferencesService>().removeSaved(AppConstants.username);
     await sl<SecureStorageService>().delete(
                        AppConstants.authToken,
                      );
      return right(data);
    } catch (e) {
      return left(DioErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, ForgotPasswordResponse>> forgotPassword({
    required String email,
  }) async {
    try {
      final data = await authRemoteDataSource.forgotPassword(email: email);
      return right(data);
    } catch (e) {
      return left(DioErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, VerifyResetCodeResponse>> verifyResetCode({
    required String email,
    required String code,
  }) async {
    try {
      final data = await authRemoteDataSource.verifyResetCode(
        email: email,
        code: code,
      );
      return right(data);
    } catch (e) {
      return left(DioErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, String>> resetPassword({
    required ResetPasswordRequest resetPasswordRequest,
  }) async {
    try {
      final data = await authRemoteDataSource.resetPassword(
        resetPasswordRequest: resetPasswordRequest,
      );
      return right(data);
    } catch (e) {
      return left(DioErrorHandler.handle(e));
    }
  }
}
