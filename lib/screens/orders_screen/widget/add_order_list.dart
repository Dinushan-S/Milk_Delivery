import 'package:flutter/material.dart';

class AddOrderList extends StatelessWidget {
  const AddOrderList({
    Key? key,
    required this.milk,
    required this.milkPrice,
  }) : super(key: key);

  final String milk;
  final int milkPrice;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(padding: EdgeInsets.all(10)),
            Expanded(
              child: Image.asset(
                'assets/milkbox.png',
                height: 100,
                width: 100,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text('$milk L Milk'),
            ),
            Expanded(
              child: Text('Rs.$milkPrice'),
            )
          ],
        ),
      ),
    );
  }
}
