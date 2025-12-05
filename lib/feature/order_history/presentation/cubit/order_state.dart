import 'package:hungry_app/feature/order_history/domain/entities/order_entity.dart';

abstract class OrderState {}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrderSuccess extends OrderState {
  final String message;
  OrderSuccess({this.message = 'Order placed successfully!'});
}

class OrderError extends OrderState {
  final String message;
  OrderError({required this.message});
}

class GetOrdersLoading extends OrderState {}

class GetOrdersSuccess extends OrderState {
  final List<OrderEntity> orders;
  GetOrdersSuccess({required this.orders});
}

class GetOrdersError extends OrderState {
  final String message;
  GetOrdersError({required this.message});
}
