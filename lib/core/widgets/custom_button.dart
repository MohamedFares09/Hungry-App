import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    required this.text,
    this.width,
    required this.color,
    required this.backGroundColor,
    this.padding = const EdgeInsets.all(8),
  });
  final void Function()? onTap;
  final String text;
  final double? width;
  final Color color;
  final Color backGroundColor;
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: backGroundColor,
        ),
        child: Padding(
          padding: padding,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: color,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
