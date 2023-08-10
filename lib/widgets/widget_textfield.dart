import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFeildWidget extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  TextFeildWidget({
    required this.hintText,
    required this.lableText,
    this.onChange,
    this.validator,
    this.onSave,
    this.onSubmit,
    this.suffixIcon,
    this.obscureText = false,
    this.textInputType,
  });
  String? hintText;
  String? lableText;
  Function(String)? onChange;
  FormFieldValidator<String>? validator;
  FormFieldSetter<String>? onSave;
  FormFieldSetter<String>? onSubmit;
  // Function(String?)? onSave;
  Widget? suffixIcon;
  bool? obscureText;
  TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType,
      obscureText: obscureText!,
      onChanged: onChange,
      onSubmitted: onSubmit,
      //  obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 20,
        ),
        label: Text(
          lableText ?? 'Error',
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 3,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
