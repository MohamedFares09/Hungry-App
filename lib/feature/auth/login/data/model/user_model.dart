import 'package:hungry_app/feature/auth/login/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.token,
    required super.name,
    required super.email,
    required super.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    // Check if data is nested or at root level
    final data = json['data'] as Map<String, dynamic>? ?? json;

    return UserModel(
      token: data['token'] ?? '',
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      image: data['image'] ?? '',
    );
  }
}
