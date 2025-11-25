import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/networking/errors/faliuer.dart';
import 'package:hungry_app/feature/home/doman/entities/home_entity.dart';

abstract class ProductRepo {
  Future<Either<Faliuer, List<HomeEntity>>> getProducts();
}
