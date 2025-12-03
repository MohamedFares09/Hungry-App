import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/di/di.dart';
import 'package:hungry_app/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:hungry_app/feature/cart/presentation/widget/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  static const routeName = 'cart view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CartCubit>()..getCart(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Cart'), centerTitle: true),
        body: const CartViewBody(),
      ),
    );
  }
}
