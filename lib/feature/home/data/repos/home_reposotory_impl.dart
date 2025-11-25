import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/networking/errors/exception.dart' show ServerException;
import 'package:hungry_app/core/networking/errors/faliuer.dart';
import 'package:hungry_app/feature/home/data/data_sources/home_remote_data_sources.dart';
import 'package:hungry_app/feature/home/doman/entities/home_entity.dart';
import 'package:hungry_app/feature/home/doman/repo/product_repo.dart';

class HomeReposotoryImpl implements ProductRepo {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeReposotoryImpl({required this.homeRemoteDataSource});
  @override
  Future<Either<Faliuer, List<HomeEntity>>> getProducts() async {
    try {
      final home = await homeRemoteDataSource.getHome();
      return Right(home);
    } on ServerException catch (e) {
      return Left(Faliuer(message: e.errorModel.message ?? "Unknown Error"));
    }
  }
}
