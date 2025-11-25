import 'package:flutter/material.dart';
import 'package:hungry_app/feature/cart/presentation/widget/cart_view_body.dart';
import 'package:hungry_app/feature/check_out/presentation/view/checkout_view.dart';
import 'package:hungry_app/feature/home/presentation/widget/price_section.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  static const routeName = 'cart view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CartViewBody(),
      bottomSheet: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 20, offset: Offset(0, 0)),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        height: 100,
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10),
          child: PriceSection(
            price: 80,
            nameButton: 'Checkout',
            onTap: () {
              Navigator.pushNamed(context, CheckoutView.routeName);
            },
          ),
        ),
      ),
    );
  }
}
