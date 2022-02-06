import 'package:flutter/material.dart';

class ReusableTextField extends StatelessWidget {
  const ReusableTextField(
      {required this.textIcon,
      required this.hintText,
      required this.onchanged});

  final String hintText;
  final Function(String)? onchanged;
  final IconData textIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
        color: Colors.black,
      ),
      onChanged: onchanged,
      expands: false,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF8F8F8),
        icon: Icon(textIcon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
