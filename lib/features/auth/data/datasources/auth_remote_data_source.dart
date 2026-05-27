import 'package:syria_glow/features/auth/data/models/auth_response.dart';
import 'package:syria_glow/features/auth/data/models/login_request.dart';
import 'package:syria_glow/features/auth/data/models/register_request.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponse> signUpWithEmailAndPassword(
    RegisterRequest registerRequest,
  );
  Future<AuthResponse> signInWithEmailAndPassword(LoginRequest loginRequest);
  Future<void> logOut();
}
