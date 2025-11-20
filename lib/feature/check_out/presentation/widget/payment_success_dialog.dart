import 'package:flutter/material.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/constants/app_styles.dart';
import 'package:hungry_app/core/widgets/custom_button.dart';

class PaymentSuccessDialog extends StatelessWidget {
  const PaymentSuccessDialog({super.key, required this.onTap});
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 45,
              backgroundColor: AppColors.primaryColor,
              child: Image.asset(
                'assets/images/ckeckout.png',
                width: 36,
                height: 23,
              ),
            ),
            Text('Success !', style: AppStyles.bold30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Text(
                'Your payment was successful.A receipt for this purchase has been sent to your email.',
                style: TextStyle(fontSize: 12),
              ),
            ),
            SizedBox(height: 20),
            CustomButton(
              onTap: onTap,
              height: 60,
              text: "Go Back",
              color: Colors.white,
              backGroundColor: AppColors.primaryColor,
              width: 200,
            ),
          ],
        ),
      ),
    );
  }
}
