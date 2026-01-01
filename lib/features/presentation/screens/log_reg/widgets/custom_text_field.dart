import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final void Function(String)? onSubmitted;
  final void Function(String)? onChange;
  final IconData prefixIcon;
  final String labelText;
  final String? errorText;
  final bool obscureText;
  const CustomTextField({
    super.key,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.errorText,
    this.onSubmitted,
    this.onChange,
    required this.labelText,
    required this.prefixIcon,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: obscureText,
      onSubmitted: onSubmitted,
      onChanged: onChange,
      decoration: InputDecoration(
        errorText: errorText,
        errorStyle: TextStyle(color: Colors.red),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent),
        ),
        // errorBorder: ,
        label: Text(labelText),
        labelStyle: TextStyle(
          fontSize: 15,
          color: Colors.black87,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.5,
        ),
        enabled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black87),
        ),
        filled: true,
        fillColor: Colors.grey,
        floatingLabelStyle: TextStyle(
          fontSize: 16,
          color: Colors.black87,
          letterSpacing: 1.2,
          fontWeight: FontWeight.w700,
          backgroundColor: Colors.transparent,
        ),
        prefixIcon: Icon(prefixIcon),
        prefixIconColor: Colors.black87,
      ),
    );
  }
}
