class ProfileModel {
  final String name;
  final String email;
  final String? imageUrl;

  ProfileModel({required this.name, required this.email, this.imageUrl});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> data = json['user'];
    return ProfileModel(
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      imageUrl: data['image'] ?? '',
    );
  }
}
