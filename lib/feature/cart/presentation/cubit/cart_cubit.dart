import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/feature/cart/data/models/cart_item_model.dart';
import 'package:hungry_app/feature/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:hungry_app/feature/cart/domain/usecases/get_cart_usecase.dart';
import 'package:hungry_app/feature/cart/presentation/cubit/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final AddToCartUseCase addToCartUseCase;
  final GetCartUseCase getCartUseCase;

  CartCubit({required this.addToCartUseCase, required this.getCartUseCase})
    : super(CartInitial());

  Future<void> addToCart(CartItemModel cartItem) async {
    emit(CartLoading());

    final request = AddToCartRequest(items: [cartItem]);
    final result = await addToCartUseCase(request);

    result.fold(
      (failure) => emit(CartError(message: failure.message)),
      (_) => emit(CartAddSuccess()),
    );
  }

  Future<void> getCart() async {
    emit(CartFetchLoading());

    final result = await getCartUseCase();

    result.fold(
      (failure) => emit(CartFetchError(message: failure.message)),
      (cartModel) => emit(CartFetchSuccess(cartModel: cartModel)),
    );
  }
}
