import 'package:flutter/material.dart';

class MQuery {
  static double? width;
  static double? height;

  void init(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    width = mediaQuery.size.width;
    height = mediaQuery.size.height;
  }
}
