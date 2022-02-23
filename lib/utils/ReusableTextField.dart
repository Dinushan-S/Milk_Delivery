import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class ReusableTextField extends StatelessWidget {
  const ReusableTextField({
    required this.textIcon,
    required this.hintText,
    required this.onchanged,
    required this.control,
    required this.textInputAction,
  });

  final String hintText;
  final Function(String)? onchanged;
  final IconData textIcon;
  final TextEditingController control;
  final TextInputAction textInputAction;
  // final FocusNode focus;

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: TextField(
        style: const TextStyle(
          color: Colors.black,
        ),
        controller: control,
        textInputAction: textInputAction,
        // focusNode: focus,
        onChanged: onchanged,
        expands: false,
        decoration: InputDecoration(
          filled: true,
          // fillColor: const Color(0xFFF8F8F8),
          fillColor: Colors.white,

          icon: Icon(textIcon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
