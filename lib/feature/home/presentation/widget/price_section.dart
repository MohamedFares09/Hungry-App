import 'package:flutter/material.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/widgets/custom_button.dart';

class PriceSection extends StatelessWidget {
  const PriceSection({super.key, this.nameButton, required this.price , this.onTap});
  final String? nameButton;
  final String price;
  final Function()? onTap ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 5),
              Text(
                '\$ $price',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Spacer(),
          CustomButton(
            onTap:onTap ,
            height: 50,
            padding: EdgeInsetsGeometry.symmetric(horizontal: 40, vertical: 2),
            text: nameButton ?? 'Add To Card',
            color: Colors.white,
            backGroundColor: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}
