import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/networking/errors/faliuer.dart';
import 'package:hungry_app/feature/auth/register/domain/entities/user_entity.dart';
import 'package:hungry_app/feature/auth/register/domain/repo/register_repo.dart';

class RegisterUseCase {
  final RegisterRepo registerRepo;

  RegisterUseCase({required this.registerRepo});

  Future<Either<Faliuer, UserEntity>> call({
    required String name,
    required String email,
    required String password,
  }) {
    return registerRepo.register(name: name, email: email, password: password);
  }
}
