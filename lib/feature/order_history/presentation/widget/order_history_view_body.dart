import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/constants/app_styles.dart';
import 'package:hungry_app/feature/order_history/presentation/cubit/order_cubit.dart';
import 'package:hungry_app/feature/order_history/presentation/cubit/order_state.dart';
import 'package:hungry_app/feature/order_history/presentation/widget/order_item_widget.dart';

class OrderHistoryViewBody extends StatelessWidget {
  const OrderHistoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        if (state is GetOrdersLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetOrdersSuccess) {
          if (state.orders.isEmpty) {
            return RefreshIndicator(
              onRefresh: () async {
                await context.read<OrderCubit>().getOrders();
              },
              child: ListView(
                children: [
                  const SizedBox(height: 200),
                  Center(
                    child: Column(
                      children: [
                        Icon(
                          Icons.shopping_cart_outlined,
                          size: 50,
                          color: AppColors.primaryColor,
                        ),
                        Text(
                          'No orders found',
                          style: AppStyles.medaim20.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              await context.read<OrderCubit>().getOrders();
            },
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.orders.length,
              itemBuilder: (context, index) {
                return OrderItemWidget(order: state.orders[index]);
              },
            ),
          );
        } else if (state is GetOrdersError) {
          return Center(child: Text(state.message));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
