import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/networking/errors/faliuer.dart';
import 'package:hungry_app/feature/home/doman/entities/home_entity.dart';
import 'package:hungry_app/feature/home/doman/repo/product_repo.dart';

class ProductWithIdUseCases {
  final ProductRepo productRepo;

  ProductWithIdUseCases({required this.productRepo});

  Future<Either<Faliuer, HomeEntity>> getProductWithId(int id) async {
    return await productRepo.getProductWithId(id);
  }
}
