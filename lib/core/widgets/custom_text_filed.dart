import 'package:flutter/material.dart';
import 'package:hungry_app/core/constants/app_colors.dart';

class CustomTextFiled extends StatefulWidget {
  const CustomTextFiled({
    super.key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.fillColor,
    this.labe,
    this.hintTextColor,
    this.readOnly = false,
  });
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final Color? fillColor;
  final Widget? labe;
  final TextStyle? hintTextColor;
  final bool readOnly;
  @override
  State<CustomTextFiled> createState() => _CustomTextFiledState();
}

class _CustomTextFiledState extends State<CustomTextFiled> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (widget.readOnly) return null;
        if (value == null || value.isEmpty) {
          return 'Please enter ${widget.hintText}';
        }
        return null;
      },
      controller: widget.controller,
      obscureText: _obscureText,
      readOnly: widget.readOnly,
      decoration: InputDecoration(
        fillColor: widget.fillColor ?? Colors.white,
        
        filled: true,
        label: widget.labe,
        hintText: widget.hintText,
        hintStyle: widget.hintTextColor ?? TextStyle(color: Colors.black),
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.primaryColor,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2),
        ),
      ),
    );
  }
}
