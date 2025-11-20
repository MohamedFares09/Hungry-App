import 'package:flutter/material.dart';
import 'package:hungry_app/feature/product/presentation/widget/price_section.dart';
import 'package:hungry_app/feature/product/presentation/widget/product_details_view_body.dart';

class ProductDatailsView extends StatelessWidget {
  const ProductDatailsView({super.key});
  static const routeName = 'product details view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
          child: PriceSection(price: 18.19),
        ),
      ),
    );
  }
}
