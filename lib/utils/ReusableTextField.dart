import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class ReusableTextField extends StatelessWidget {
  const ReusableTextField({
    required this.textIcon,
    required this.hintText,
    required this.onchanged,
    required this.control,
    required this.textInputAction,
    required this.textLength,
    required this.validator,
    required this.keyboardType,
  });

  final String hintText;
  final Function(String)? onchanged;
  final IconData textIcon;
  final TextEditingController control;
  final TextInputAction textInputAction;
  final int textLength;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;
  // final FocusNode focus;

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: TextField(
        style: const TextStyle(
          color: Colors.black,
        ),
        controller: control,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        // focusNode: focus,
        onChanged: onchanged,
        expands: false,
        maxLength: textLength,
        decoration: InputDecoration(
          prefixIcon: Icon(textIcon),
          filled: true,
          counterText: "",
          // fillColor: const Color(0xFFF8F8F8),
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontFamily: 'Cairo',
          ),
        ),
      ),
    );
  }
}
