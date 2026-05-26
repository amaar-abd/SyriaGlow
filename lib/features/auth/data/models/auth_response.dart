import 'package:syria_glow/features/auth/data/models/user_data.dart';

class AuthResponse {
  final String message;
  final UserData userData;
  final String token;

  const AuthResponse({
    required this.message,
    required this.userData,
    required this.token,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> response) {
    return AuthResponse(
      message: response['message'] ?? "تمت العملية بنجاح",
      token: response['data']['token'] ?? '',
      userData: UserData.fromJson(
        response['data']['user'] as Map<String, dynamic>,
      ),
    );
  }
}
