import 'package:syria_glow/features/auth/data/models/user_data.dart';

class AuthResponse {
  final String message;
  final UserData? userData;
  final String token;

  const AuthResponse({
    required this.message,
    required this.userData,
    required this.token,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> response) {
    final data = response['data'];
    return AuthResponse(
      message: response['message'] ??'',
      token: data != null ? (data['token'] ?? '') : '',
    
      userData: (data != null && data['user'] != null)
          ? UserData.fromJson(data['user'] as Map<String, dynamic>)
          : null,
    
    );
  }
}
