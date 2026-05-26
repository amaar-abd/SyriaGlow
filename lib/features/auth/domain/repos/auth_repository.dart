import 'package:dartz/dartz.dart';
import 'package:syria_glow/core/errors/failure.dart';
import 'package:syria_glow/features/auth/data/models/auth_response.dart';
import 'package:syria_glow/features/auth/data/models/login_request.dart';
import 'package:syria_glow/features/auth/data/models/register_request.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResponse>> register({
    required RegisterRequest registerRequest,
  });
  Future<Either<Failure, AuthResponse>> login({
    required LoginRequest loginRequest,
  });
}
