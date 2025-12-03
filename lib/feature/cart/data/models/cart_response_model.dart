import 'package:hungry_app/feature/home/data/model/product_model.dart';
import 'package:hungry_app/feature/home/data/model/topping_model.dart';

class CartResponseModel {
  final List<CartItemResponseModel> items;
  final double totalPrice;

  CartResponseModel({required this.items, required this.totalPrice});

  factory CartResponseModel.fromJson(Map<String, dynamic> json) {
    return CartResponseModel(
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => CartItemResponseModel.fromJson(e))
              .toList() ??
          [],
      totalPrice: (json['total_price'] as num?)?.toDouble() ?? 0.0,
    );
  }
}

class CartItemResponseModel {
  final int id;
  final ProductModel product;
  final int quantity;
  final double spicy;
  final List<ToppingModel> toppings;
  final List<ToppingModel> sideOptions;

  CartItemResponseModel({
    required this.id,
    required this.product,
    required this.quantity,
    required this.spicy,
    required this.toppings,
    required this.sideOptions,
  });

  factory CartItemResponseModel.fromJson(Map<String, dynamic> json) {
    return CartItemResponseModel(
      id: json['id'] ?? 0,
      product: ProductModel.fromJson(json['product'] ?? {}),
      quantity: json['quantity'] ?? 1,
      spicy: (json['spicy'] as num?)?.toDouble() ?? 0.0,
      toppings:
          (json['toppings'] as List<dynamic>?)
              ?.map((e) => ToppingModel.fromJson(e))
              .toList() ??
          [],
      sideOptions:
          (json['side_options'] as List<dynamic>?)
              ?.map((e) => ToppingModel.fromJson(e))
              .toList() ??
          [],
    );
  }
}
