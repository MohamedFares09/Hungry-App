import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/networking/errors/faliuer.dart';
import 'package:hungry_app/feature/home/doman/entities/home_entity.dart';
import 'package:hungry_app/feature/home/doman/repo/product_repo.dart';

class HomeUsecases {
  final ProductRepo productRepo;

  HomeUsecases({required this.productRepo});

  Future<Either<Faliuer, List<HomeEntity>>> getProducts() async {
    return await productRepo.getProducts();
  }
}
