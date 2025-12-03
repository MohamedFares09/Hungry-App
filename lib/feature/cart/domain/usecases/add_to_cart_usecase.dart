import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/networking/errors/faliuer.dart';
import 'package:hungry_app/feature/cart/data/models/cart_item_model.dart';
import 'package:hungry_app/feature/cart/domain/repos/cart_repo.dart';

class AddToCartUseCase {
  final CartRepo cartRepo;

  AddToCartUseCase({required this.cartRepo});

  Future<Either<Faliuer, void>> call(AddToCartRequest request) async {
    return await cartRepo.addToCart(request);
  }
}
