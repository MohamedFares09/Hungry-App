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
