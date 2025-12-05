import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/networking/errors/faliuer.dart';
import 'package:hungry_app/feature/order_history/data/models/create_order_request.dart';

import 'package:hungry_app/feature/order_history/domain/entities/order_entity.dart';

abstract class OrderRepo {
  Future<Either<Faliuer, void>> createOrder(CreateOrderRequest request);
  Future<Either<Faliuer, List<OrderEntity>>> getOrders();
}
