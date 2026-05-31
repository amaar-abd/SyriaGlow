class VerifyResetCodeResponse {
  final String message;
  final VerifyResetCodeData data;

 const VerifyResetCodeResponse({required this.message, required this.data});


factory VerifyResetCodeResponse.fromJson(Map<String, dynamic> json) {
    return VerifyResetCodeResponse(
      message: json['message'],
      data: VerifyResetCodeData.fromJson(json['data']),
    );
  }

}

class VerifyResetCodeData {

    final String email;
  final String resetToken;

  const VerifyResetCodeData({required this.email, required this.resetToken});

  factory VerifyResetCodeData.fromJson(Map<String, dynamic> json) {
    return VerifyResetCodeData(
      email: json['email'],
      resetToken: json['reset_token'],
    );
  }
}
