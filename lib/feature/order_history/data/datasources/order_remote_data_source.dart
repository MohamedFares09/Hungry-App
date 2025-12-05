import 'package:hungry_app/core/networking/api/api_consumer.dart';
import 'package:hungry_app/core/networking/api/end_points.dart';
import 'package:hungry_app/feature/order_history/data/models/create_order_request.dart';

import 'package:hungry_app/feature/order_history/data/models/order_model.dart';

abstract class OrderRemoteDataSource {
  Future<void> createOrder(CreateOrderRequest request);
  Future<List<OrderModel>> getOrders();
}

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  final ApiConsumer api;

  OrderRemoteDataSourceImpl({required this.api});

  @override
  Future<void> createOrder(CreateOrderRequest request) async {
    await api.post(EndPoints.saveOrder, data: request.toJson());
  }

  @override
  Future<List<OrderModel>> getOrders() async {
    final response = await api.get(EndPoints.getOrders);
    print('API Response: $response');
    final List<dynamic> data = response['data'];
    return data.map((json) => OrderModel.fromJson(json)).toList();
  }
}
