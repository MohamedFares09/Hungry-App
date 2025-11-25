import 'package:hungry_app/core/networking/api/api_consumer.dart';
import 'package:hungry_app/core/networking/api/end_points.dart';
import 'package:hungry_app/feature/auth/register/data/model/user_model.dart';

abstract class RegisterRemoteDataSource {
  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
  });
}

class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource {
  final ApiConsumer api;

  RegisterRemoteDataSourceImpl({required this.api});

  @override
  Future<UserModel> register({ 
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await api.post(
      EndPoints.register,
      data: {"name": name, "email": email, "password": password},
    );
    return UserModel.fromJson(response);
  }
}
