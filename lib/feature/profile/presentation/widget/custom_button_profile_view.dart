
import 'package:flutter/material.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/constants/app_styles.dart';

class CustomButtonProfileView extends StatelessWidget {
  const CustomButtonProfileView({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.icon,
    required this.titleColor,
    this.iconColor,
    this.onTap,
  });
  final String title;
  final Color backgroundColor, titleColor;
  final Color? iconColor;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 21),
          child: Row(
            children: [
              Text(title, style: AppStyles.mediam18.copyWith(color: titleColor)),
              SizedBox(width: 10),
              Icon(icon, color: iconColor ?? AppColors.primaryColor, size: 30),
            ],
          ),
        ),
      ),
    );
  }
}
