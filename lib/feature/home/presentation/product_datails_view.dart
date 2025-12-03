import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/di/di.dart';
import 'package:hungry_app/feature/cart/data/models/cart_item_model.dart';
import 'package:hungry_app/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:hungry_app/feature/cart/presentation/cubit/cart_state.dart';
import 'package:hungry_app/feature/home/presentation/cubit/product_details_cubit.dart';
import 'package:hungry_app/feature/home/presentation/cubit/product_details_state.dart';
import 'package:hungry_app/feature/home/presentation/widget/price_section.dart';
import 'package:hungry_app/feature/home/presentation/widget/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.productId});
  static const routeName = 'product details view';
  final int productId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<ProductDetailsCubit>()..getProductDetails(productId),
        ),
        BlocProvider(create: (context) => getIt<CartCubit>()),
      ],
      child: BlocListener<CartCubit, CartState>(
        listener: (context, state) {
          if (state is CartAddSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.green,
              ),
            );
          } else if (state is CartError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: Scaffold(
          body: ProductDetailsViewBody(),
          bottomSheet: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            height: 120,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
                builder: (context, state) {
                  if (state is ProductDetailsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is ProductDetailsError) {
                    return Center(child: Text(state.message));
                  }
                  if (state is ProductDetailsSuccess) {
                    return PriceSection(
                      price: state.product.price,
                      onTap: () {
                        final cartItem = CartItemModel(
                          productId: state.product.id,
                          quantity: state.quantity,
                          spicy: state.spicyLevel,
                          toppings: state.selectedToppings,
                          sideOptions: state.selectedSideOptions,
                        );
                        context.read<CartCubit>().addToCart(cartItem);
                      },
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
