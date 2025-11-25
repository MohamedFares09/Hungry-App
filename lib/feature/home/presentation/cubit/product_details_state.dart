import 'package:hungry_app/feature/home/data/model/topping_model.dart';
import 'package:hungry_app/feature/home/doman/entities/home_entity.dart';

class ProductDetailsState {}

class ProductDetailsInitial extends ProductDetailsState {}

class ProductDetailsLoading extends ProductDetailsState {}

class ProductDetailsSuccess extends ProductDetailsState {
  final HomeEntity product;
  final List<ToppingModel> toppings;
  final List<ToppingModel> sideOptions;

  ProductDetailsSuccess({
    required this.product,
    required this.toppings,
    required this.sideOptions,
  });
}

class ProductDetailsError extends ProductDetailsState {
  final String message;
  ProductDetailsError({required this.message});
}
