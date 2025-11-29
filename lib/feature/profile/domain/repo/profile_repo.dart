import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/networking/errors/faliuer.dart';
import 'package:hungry_app/feature/auth/login/domain/entities/user_entity.dart';

abstract class ProfileRepo {
  Future<Either<Faliuer, UserEntity>> getUserProfile();
  Future<Either<Faliuer, UserEntity>> updateUserProfile({
    required String name,
    required String email,
    String? imagePath,
  });
}
