import 'package:flutter/material.dart';
import 'package:hungry_app/core/constants/app_styles.dart';

class SelectPayment extends StatelessWidget {
  const SelectPayment({
    super.key,
    required this.title,
    this.subTitle,
    required this.image,
    required this.color,
    required this.value,
    required this.onChanged,
    this.tileColor,
    this.titleStyle,
    this.onTap,
    this.groupValue,
  });
  final String title;
  final Widget? subTitle;
  final String image;
  final Color color;
  final String value;
  final Color? tileColor;
  final Function(String?)? onChanged;
  final TextStyle? titleStyle;
  final Function()? onTap;
  final String? groupValue;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      tileColor: tileColor ?? Color(0xff3C2F2F),
      title: Text(
        title,
        style: titleStyle ?? AppStyles.medaim20.copyWith(color: Colors.white),
      ),
      subtitle: subTitle,
      leading: Image.asset(image),
      trailing: Radio<String>(
        activeColor: color,
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
      ),
    );
  }
}
