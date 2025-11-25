import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/di/di.dart';
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
    return BlocProvider(
      create: (context) =>
          getIt<ProductDetailsCubit>()..getProductDetails(productId),
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
                if (state is ProductDetailsSuccess) {
                  return PriceSection(price: state.product.price);
                }
                return const SizedBox();
              },
            ),
          ),
        ),
      ),
    );
  }
}
