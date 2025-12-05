import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/feature/cart/data/models/cart_response_model.dart';
import 'package:hungry_app/feature/order_history/data/models/create_order_request.dart';
import 'package:hungry_app/feature/order_history/domain/usecases/create_order_usecase.dart';
import 'package:hungry_app/feature/order_history/presentation/cubit/order_state.dart';

import 'package:hungry_app/feature/order_history/domain/usecases/get_orders_usecase.dart';

class OrderCubit extends Cubit<OrderState> {
  final CreateOrderUseCase createOrderUseCase;
  final GetOrdersUseCase getOrdersUseCase;

  OrderCubit({required this.createOrderUseCase, required this.getOrdersUseCase})
    : super(OrderInitial());

  Future<void> createOrder(List<CartItemResponseModel> cartItems) async {
    if (isClosed) return;
    emit(OrderLoading());

    // Map CartItemResponseModel to OrderItemRequest
    final orderItems = cartItems.map((item) {
      return OrderItemRequest(
        productId: item.product.id,
        quantity: item.quantity,
        spicy: item.spicy,
        toppings: item.toppings.map((t) => t.id).toList(),
        sideOptions: item.sideOptions.map((s) => s.id).toList(),
      );
    }).toList();

    final request = CreateOrderRequest(items: orderItems);

    final result = await createOrderUseCase(request);

    if (isClosed) return;

    result.fold(
      (failure) {
        if (!isClosed) {
          emit(OrderError(message: failure.message));
        }
      },
      (_) {
        if (!isClosed) {
          emit(OrderSuccess());
        }
      },
    );
  }

  Future<void> getOrders() async {
    if (isClosed) return;
    emit(GetOrdersLoading());

    final result = await getOrdersUseCase();

    if (isClosed) return;

    result.fold(
      (failure) {
        if (!isClosed) {
          emit(GetOrdersError(message: failure.message));
        }
      },
      (orders) {
        if (!isClosed) {
          print('Orders count: ${orders.length}');
          emit(GetOrdersSuccess(orders: orders));
        }
      },
    );
  }
}
