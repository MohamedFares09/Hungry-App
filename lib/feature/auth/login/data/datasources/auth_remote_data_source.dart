import 'package:hungry_app/core/networking/api/api_consumer.dart';
import 'package:hungry_app/core/networking/api/end_points.dart';
import 'package:hungry_app/feature/auth/login/data/model/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login({required String email, required String password});
  Future<void> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiConsumer api;

  AuthRemoteDataSourceImpl({required this.api});

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final response = await api.post(
      EndPoints.login,
      data: {"email": email, "password": password},
    );
    return UserModel.fromJson(response);
  }

  @override
  Future<void> logout() async {
    await api.post(EndPoints.logout);
  }
}
