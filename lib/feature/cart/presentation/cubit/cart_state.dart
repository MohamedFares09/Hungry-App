import 'package:hungry_app/feature/cart/data/models/cart_response_model.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartAddSuccess extends CartState {
  final String message;
  CartAddSuccess({this.message = 'Added to cart successfully!'});
}

class CartError extends CartState {
  final String message;
  CartError({required this.message});
}

class CartFetchLoading extends CartState {}

class CartFetchSuccess extends CartState {
  final CartResponseModel cartModel;
  CartFetchSuccess({required this.cartModel});
}

class CartFetchError extends CartState {
  final String message;
  CartFetchError({required this.message});
}
