import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/networking/errors/faliuer.dart';
import 'package:hungry_app/feature/auth/login/domain/repo/user_repo.dart';

class LogoutUseCase {
  final UserRepo userRepo;

  LogoutUseCase({required this.userRepo});

  Future<Either<Faliuer, void>> call() async {
    return await userRepo.logout();
  }
}
