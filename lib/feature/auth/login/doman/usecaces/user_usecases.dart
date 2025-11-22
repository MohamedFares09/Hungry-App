import 'package:hungry_app/feature/auth/login/doman/repo/user_repo.dart';

class UserUsecases {
  final UserRepo userRepo;
  UserUsecases(this.userRepo);
  call() {
    return userRepo.login();
  }
}
