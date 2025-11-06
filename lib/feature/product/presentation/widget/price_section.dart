
import 'package:flutter/material.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/widgets/custom_button.dart';

class PriceSection extends StatelessWidget {
  const PriceSection({
    super.key,
  });

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
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5),
              Text(
                '\$ 18.19',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Spacer(),
          CustomButton(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: 40,
              vertical: 13,
            ),
            text: 'Add To Card',
            color: Colors.white,
            backGroundColor: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}
