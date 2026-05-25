class UserData {
  final String name;
  final String email;
  final int uId;


  const UserData({
    required this.name,
    required this.email,
    required this.uId,
  });

  factory UserData.fromJson(Map<String, dynamic> data) {
    return UserData(
      name: data['name'],
      email: data['email'],
      uId: data['id'],
    );
  }
}
