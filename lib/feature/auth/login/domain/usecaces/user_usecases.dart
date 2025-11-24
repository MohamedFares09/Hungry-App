import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/networking/errors/faliuer.dart';
import 'package:hungry_app/feature/auth/login/domain/entities/user_entity.dart';
import 'package:hungry_app/feature/auth/login/domain/repo/user_repo.dart';

class LoginUseCase {
  final UserRepo userRepo;
  LoginUseCase({required this.userRepo});

  Future<Either<Faliuer, UserEntity>> call({
    required String email,
    required String password,
  }) {
    return userRepo.login(email: email, password: password);
  }
}
