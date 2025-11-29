import 'package:dio/dio.dart';
import 'package:hungry_app/core/networking/api/api_consumer.dart';
import 'package:hungry_app/core/networking/api/end_points.dart';
import 'package:hungry_app/feature/auth/login/data/model/user_model.dart';

abstract class ProfileRemoteDataSource {
  Future<UserModel> getUserProfile();
  Future<UserModel> updateUserProfile({
    required String name,
    required String email,
    String? imagePath,
  });
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ApiConsumer api;

  ProfileRemoteDataSourceImpl({required this.api});

  @override
  Future<UserModel> getUserProfile() async {
    final response = await api.get(EndPoints.profile);
    return UserModel.fromJson(response['data']);
  }

  @override
  Future<UserModel> updateUserProfile({
    required String name,
    required String email,
    String? imagePath,
  }) async {
    final data = await _prepareUpdateData(name, email, imagePath);

    final response = await api.post(
      EndPoints.updateProfile,
      data: data,
      isFormData: imagePath != null,
    );

    return UserModel.fromJson(response['data']);
  }

  /// Prepares the data map for profile update request
  Future<Map<String, dynamic>> _prepareUpdateData(
    String name,
    String email,
    String? imagePath,
  ) async {
    final data = <String, dynamic>{'name': name, 'email': email};

    if (imagePath != null) {
      data['image'] = await MultipartFile.fromFile(imagePath);
    }

    return data;
  }
}
