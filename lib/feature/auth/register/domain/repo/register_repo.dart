import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/networking/errors/faliuer.dart';
import 'package:hungry_app/feature/auth/register/domain/entities/user_entity.dart';

abstract class RegisterRepo {
  Future<Either<Faliuer, UserEntity>> register({
    required String name,
    required String email,
    required String password,
  });
}
