import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/networking/errors/exception.dart';
import 'package:hungry_app/core/networking/errors/faliuer.dart';
import 'package:hungry_app/feature/cart/data/datasources/cart_remote_data_source.dart';
import 'package:hungry_app/feature/cart/data/models/cart_item_model.dart';
import 'package:hungry_app/feature/cart/data/models/cart_response_model.dart';
import 'package:hungry_app/feature/cart/domain/repos/cart_repo.dart';

class CartRepositoryImpl implements CartRepo {
  final CartRemoteDataSource remoteDataSource;

  CartRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Faliuer, void>> addToCart(AddToCartRequest request) async {
    try {
      await remoteDataSource.addToCart(request);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(Faliuer(message: e.errorModel.message ?? "Unknown Error"));
    }
  }

  @override
  Future<Either<Faliuer, CartResponseModel>> getCart() async {
    try {
      final result = await remoteDataSource.getCart();
      return Right(result);
    } on ServerException catch (e) {
      return Left(Faliuer(message: e.errorModel.message ?? "Unknown Error"));
    }
  }
}
