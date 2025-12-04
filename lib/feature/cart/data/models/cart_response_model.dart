import 'package:hungry_app/feature/home/data/model/product_model.dart';
import 'package:hungry_app/feature/home/data/model/topping_model.dart';

class CartResponseModel {
  final List<CartItemResponseModel> items;
  final double totalPrice;

  CartResponseModel({required this.items, required this.totalPrice});

  factory CartResponseModel.fromJson(Map<String, dynamic> json) {
    final items =
        (json['items'] as List<dynamic>?)
            ?.map((e) => CartItemResponseModel.fromJson(e))
            .toList() ??
        [];

    // حساب السعر الإجمالي من مجموع أسعار الـ items
    final calculatedTotal = items.fold<double>(
      0.0,
      (sum, item) => sum + item.totalItemPrice,
    );

    return CartResponseModel(items: items, totalPrice: calculatedTotal);
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
    // الـ API بيرسل البيانات مباشرة في الـ item وليس في product object
    // لذلك نبني ProductModel من بيانات الـ item نفسه
    final productData = {
      'id': json['product_id'] ?? 0,
      'name': json['name'] ?? '',
      'image': json['image'] ?? '',
      'price': json['price'] ?? '0',
      'description': '',
      'rating': '0.0',
    };

    return CartItemResponseModel(
      id: json['item_id'] ?? 0,
      product: ProductModel.fromJson(productData),
      quantity: json['quantity'] ?? 1,
      spicy: _parseDouble(json['spicy']),
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

  // حساب السعر الإجمالي للـ item
  double get totalItemPrice {
    final basePrice = double.tryParse(product.price) ?? 0.0;
    return basePrice * quantity;
  }

  static double _parseDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is num) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }
}
