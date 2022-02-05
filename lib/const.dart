import 'package:flutter/material.dart';

class Constants {
  static Color blueLight = Color(0xFF5AA6C8);
  static double headerHeight = 228.5;
  static double mainPadding = 20.0;
}

const textFieldStyle = TextStyle(
  color: Colors.black,
);

const textFieldInputDec = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(Icons.person),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  hintText: 'Enter your name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
);
