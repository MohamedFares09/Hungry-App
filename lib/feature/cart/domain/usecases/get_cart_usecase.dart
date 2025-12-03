import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/networking/errors/faliuer.dart';
import 'package:hungry_app/feature/cart/data/models/cart_response_model.dart';
import 'package:hungry_app/feature/cart/domain/repos/cart_repo.dart';

class GetCartUseCase {
  final CartRepo cartRepo;

  GetCartUseCase({required this.cartRepo});

  Future<Either<Faliuer, CartResponseModel>> call() async {
    return await cartRepo.getCart();
  }
}
