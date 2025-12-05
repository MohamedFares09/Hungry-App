import 'package:flutter/material.dart';

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
    this.textColor,
  });
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final Color? fillColor;
  final Widget? labe;
  final TextStyle? hintTextColor;
  final bool readOnly;
  final Color? textColor;
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
    final theme = Theme.of(context);
    return TextFormField(
      style: TextStyle(
        color: widget.textColor ?? theme.textTheme.bodyLarge?.color,
      ),
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
        fillColor: widget.fillColor ?? theme.inputDecorationTheme.fillColor,
        filled: true,
        label: widget.labe,
        hintText: widget.hintText,
        hintStyle: widget.hintTextColor ?? theme.inputDecorationTheme.hintStyle,
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: theme.primaryColor,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
    );
  }
}
