import 'package:syria_glow/core/networking/api_constants.dart';
import 'package:syria_glow/core/networking/api_service.dart';
import 'package:syria_glow/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:syria_glow/features/auth/data/models/auth_response.dart';
import 'package:syria_glow/features/auth/data/models/forgot_password_response.dart';
import 'package:syria_glow/features/auth/data/models/login_request.dart';
import 'package:syria_glow/features/auth/data/models/register_request.dart';
import 'package:syria_glow/features/auth/data/models/reset_password_request.dart';
import 'package:syria_glow/features/auth/data/models/verify_reset_code_response.dart';

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
      body: loginRequest.toJson(),
    );
    return AuthResponse.fromJson(response);
  }

  @override
  Future<String> logOut({required String userToken}) async {
  final response =  await apiService.post(ApiConstants.logout,headers: {
      'Authorization': 'Bearer $userToken',
    },);
    return response['message'] ;
  }

  @override
  Future<ForgotPasswordResponse> forgotPassword({required String email}) async {
    final response = await apiService.post(
      ApiConstants.forgot,
      body: {'email': email},
    );
    return ForgotPasswordResponse.fromJson(response);
  }

  @override
  Future<VerifyResetCodeResponse> verifyResetCode({
    required String email,
    required String code,
  }) async {
    final response = await apiService.post(
      ApiConstants.verifyResetCode,
      body: {'email': email, 'code': code},
    );
    return VerifyResetCodeResponse.fromJson(response);
  }

  @override
  Future<String> resetPassword({
    required ResetPasswordRequest resetPasswordRequest,
  }) async {
    final response = await apiService.post(
      ApiConstants.passwordReset,
      body: resetPasswordRequest.toJson(),
    );
    return response['message'];
  }
}
