import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/networking/errors/faliuer.dart';
import 'package:hungry_app/feature/auth/login/domain/entities/user_entity.dart';
import 'package:hungry_app/feature/profile/domain/repo/profile_repo.dart';

class UpdateUserProfileUseCase {
  final ProfileRepo profileRepo;

  UpdateUserProfileUseCase({required this.profileRepo});

  Future<Either<Faliuer, UserEntity>> call({
    required String name,
    required String email,
    String? imagePath,
  }) async {
    return await profileRepo.updateUserProfile(
      name: name,
      email: email,
      imagePath: imagePath,
    );
  }
}
