import 'package:flutter/material.dart';
import 'package:hungry_app/feature/check_out/presentation/widget/checkout_view_body.dart';
import 'package:hungry_app/feature/check_out/presentation/widget/payment_success_dialog.dart';
import 'package:hungry_app/feature/home/presentation/widget/price_section.dart';
import 'package:hungry_app/root.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});
  static const String routeName = 'checkout';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(child: CheckoutViewBody()),
      bottomSheet: SizedBox(
        height: 120,
        child: PriceSection(
          price: '80',
          nameButton: 'Pay Now',
          onTap: () {
            return showDialog(
              context: context,
              builder: (context) {
                return PaymentSuccessDialog(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Root.routeName,
                      (route) => false,
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
