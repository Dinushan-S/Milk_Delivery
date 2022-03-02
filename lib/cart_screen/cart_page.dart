import 'package:flutter/material.dart';
import 'package:milky/utils/mq.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MQuery().init(context);
    return const Scaffold(
      body: Center(
        child: Text('cart  page'),
      ),
    );
  }
}
