import 'package:hungry_app/core/networking/api/api_consumer.dart';
import 'package:hungry_app/core/networking/api/end_points.dart';
import 'package:hungry_app/feature/cart/data/models/cart_item_model.dart';
import 'package:hungry_app/feature/cart/data/models/cart_response_model.dart';

abstract class CartRemoteDataSource {
  Future<void> addToCart(AddToCartRequest request);
  Future<CartResponseModel> getCart();
  Future<void> removeFromCart(int itemId);
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final ApiConsumer api;

  CartRemoteDataSourceImpl({required this.api});

  @override
  Future<void> addToCart(AddToCartRequest request) async {
    await api.post(EndPoints.addCart, data: request.toJson());
  }

  @override
  Future<CartResponseModel> getCart() async {
    final response = await api.get(EndPoints.getCart);
    print('=== Cart API Response ===');
    print(response['data']);
    return CartResponseModel.fromJson(response['data']);
  }

  @override
  Future<void> removeFromCart(int itemId) async {
    await api.delete('${EndPoints.removeCart}$itemId');
  }
}
