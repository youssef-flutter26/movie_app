import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.onSaved,
    this.obscureText = false,
    this.labelText,
    this.enabledBorder,
    this.focusedBorder,
    this.fillColor,
    this.onFieldSubmitted,
    this.onChanged,
  });

  final String? labelText;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final bool obscureText;
  final String? hintText;
  final Widget? prefixIcon;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final Color? fillColor;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onSaved: onSaved,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        fillColor: fillColor,
        filled: fillColor != null,
      ),
    );
  }
}
