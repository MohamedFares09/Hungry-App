import 'package:hungry_app/feature/home/data/model/topping_model.dart';
import 'package:hungry_app/feature/home/doman/entities/home_entity.dart';

class ProductDetailsState {}

class ProductDetailsInitial extends ProductDetailsState {}

class ProductDetailsLoading extends ProductDetailsState {}

class ProductDetailsSuccess extends ProductDetailsState {
  final HomeEntity product;
  final List<ToppingModel> toppings;
  final List<ToppingModel> sideOptions;
  final List<int> selectedToppings;
  final List<int> selectedSideOptions;
  final double spicyLevel;
  final int quantity;

  ProductDetailsSuccess({
    required this.product,
    required this.toppings,
    required this.sideOptions,
    this.selectedToppings = const [],
    this.selectedSideOptions = const [],
    this.spicyLevel = 0.0,
    this.quantity = 1,
  });

  ProductDetailsSuccess copyWith({
    HomeEntity? product,
    List<ToppingModel>? toppings,
    List<ToppingModel>? sideOptions,
    List<int>? selectedToppings,
    List<int>? selectedSideOptions,
    double? spicyLevel,
    int? quantity,
  }) {
    return ProductDetailsSuccess(
      product: product ?? this.product,
      toppings: toppings ?? this.toppings,
      sideOptions: sideOptions ?? this.sideOptions,
      selectedToppings: selectedToppings ?? this.selectedToppings,
      selectedSideOptions: selectedSideOptions ?? this.selectedSideOptions,
      spicyLevel: spicyLevel ?? this.spicyLevel,
      quantity: quantity ?? this.quantity,
    );
  }
}

class ProductDetailsError extends ProductDetailsState {
  final String message;
  ProductDetailsError({required this.message});
}
