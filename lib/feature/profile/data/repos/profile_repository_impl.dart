import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/networking/errors/exception.dart';
import 'package:hungry_app/core/networking/errors/faliuer.dart';
import 'package:hungry_app/feature/auth/login/domain/entities/user_entity.dart';
import 'package:hungry_app/feature/profile/data/datasources/profile_remote_data_source.dart';
import 'package:hungry_app/feature/profile/domain/repo/profile_repo.dart';

class ProfileRepositoryImpl implements ProfileRepo {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Faliuer, UserEntity>> getUserProfile() async {
    try {
      final user = await remoteDataSource.getUserProfile();
      return Right(user);
    } on ServerException catch (e) {
      return Left(Faliuer(message: e.errorModel.message ?? "Unknown Error"));
    }
  }

  @override
  Future<Either<Faliuer, UserEntity>> updateUserProfile({
    required String name,
    required String email,
    String? imagePath,
  }) async {
    try {
      final user = await remoteDataSource.updateUserProfile(
        name: name,
        email: email,
        imagePath: imagePath,
      );
      return Right(user);
    } on ServerException catch (e) {
      return Left(Faliuer(message: e.errorModel.message ?? "Unknown Error"));
    }
  }
}
