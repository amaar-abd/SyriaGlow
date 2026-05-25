import 'package:syria_glow/core/networking/api_constants.dart';
import 'package:syria_glow/core/networking/api_service.dart';
import 'package:syria_glow/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:syria_glow/features/auth/data/models/auth_response.dart';
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
}
