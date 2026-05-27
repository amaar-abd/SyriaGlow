import 'package:syria_glow/core/networking/api_constants.dart';
import 'package:syria_glow/core/networking/api_service.dart';
import 'package:syria_glow/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:syria_glow/features/auth/data/models/auth_response.dart';
import 'package:syria_glow/features/auth/data/models/login_request.dart';
import 'package:syria_glow/features/auth/data/models/register_request.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({required this.apiService});
  final ApiService apiService;

  @override
  Future<AuthResponse> signUpWithEmailAndPassword(
    RegisterRequest registerRequest,
  ) async {
    final response = await apiService.post(
      ApiConstants.register,
      body: registerRequest.toJson(),
    );
    return AuthResponse.fromJson(response);
  }

  @override
  Future<AuthResponse> signInWithEmailAndPassword(
    LoginRequest loginRequest,
  ) async {
    final response = await apiService.post(
      ApiConstants.login,
      queryParameters: loginRequest.toJson(),
    );
    return AuthResponse.fromJson(response);
  }

  @override
  Future<void> logOut() async {
    await apiService.post(ApiConstants.logout);
  }
}
