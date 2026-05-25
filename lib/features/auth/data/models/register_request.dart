class RegisterRequest {
  final String name;
  final String email;
  final String password;
  final String passwordConf;

  const RegisterRequest({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConf,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'password': password,
    'password_confirmation': passwordConf,
  };
}
