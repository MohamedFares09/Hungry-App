import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/networking/errors/faliuer.dart';
import 'package:hungry_app/feature/cart/data/models/cart_item_model.dart';
import 'package:hungry_app/feature/cart/data/models/cart_response_model.dart';

abstract class CartRepo {
  Future<Either<Faliuer, void>> addToCart(AddToCartRequest request);
  Future<Either<Faliuer, CartResponseModel>> getCart();
}
