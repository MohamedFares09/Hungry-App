import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/di/di.dart';
import 'package:hungry_app/feature/order_history/presentation/cubit/order_cubit.dart';
import 'package:hungry_app/feature/order_history/presentation/widget/order_history_view_body.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});
  static const String routeName = 'order_history';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OrderCubit>()..getOrders(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Order History')),
        body: const OrderHistoryViewBody(),
      ),
    );
  }
}
