import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/networking/errors/exception.dart';
import 'package:hungry_app/core/networking/errors/faliuer.dart';
import 'package:hungry_app/feature/auth/register/data/datasources/register_remote_data_source.dart';
import 'package:hungry_app/feature/auth/register/domain/entities/user_entity.dart';
import 'package:hungry_app/feature/auth/register/domain/repo/register_repo.dart';

class RegisterRepositoryImpl implements RegisterRepo {
  final RegisterRemoteDataSource remoteDataSource;

  RegisterRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Faliuer, UserEntity>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final user = await remoteDataSource.register(
        name: name,
        email: email,
        password: password,
      );
      return Right(user);
    } on ServerException catch (e) {
      return Left(Faliuer(message: e.errorModel.message ?? "Unknown Error"));
    }
  }
}
