import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/networking/errors/exception.dart';
import 'package:hungry_app/core/networking/errors/faliuer.dart';
import 'package:hungry_app/feature/auth/login/data/datasources/auth_remote_data_source.dart';
import 'package:hungry_app/feature/auth/login/domain/entities/user_entity.dart';
import 'package:hungry_app/feature/auth/login/domain/repo/user_repo.dart';

class AuthRepositoryImpl implements UserRepo {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Faliuer, UserEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final user = await remoteDataSource.login(
        email: email,
        password: password,
      );
      return Right(user);
    } on ServerException catch (e) {
      return Left(Faliuer(message: e.errorModel.message ?? "Unknown Error"));
    }
  }
}
