import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:milky/screens/home/home_page.dart';
import 'package:milky/screens/home_page/router_page.dart';
import 'package:milky/screens/milk_screen/milk_order.dart';
import 'package:milky/screens/shop_screen/shop_screen.dart';
import 'package:milky/utils/const.dart';

class OrderConformationModel extends StatefulWidget {
  const OrderConformationModel({
    Key? key,
    required this.milk,
    required this.milkPrice,
    required this.dis,
  }) : super(key: key);

  final String milk;
  final int milkPrice;
  final int dis;

  @override
  State<OrderConformationModel> createState() => _OrderConformationModelState();
}

class _OrderConformationModelState extends State<OrderConformationModel> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      scrollable: true,
      title: const Center(child: Text('Confirm order')),
      content: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Row(
                children: [
                  const Expanded(
                    child: Image(
                      image: AssetImage('assets/logo.png'),
                      height: 100,
                      width: 100,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text('${widget.milk} liter milk',
                        style: kModelTextStyle),
                  ),
                  Expanded(
                    child: Text(
                      'Rs.${widget.milkPrice}',
                      style: kModelTextStyle,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 80,
              color: Colors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Subtotal',
                  style: kModelTextStyle,
                ),
                Text(
                  'Rs.${widget.milkPrice}',
                  style: kModelTextStyle,
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text('confirm the order'),
          style: kBlackTextButton,
          onPressed: () async {
            final user = FirebaseAuth.instance.currentUser!;
            final db = FirebaseDatabase(
                    databaseURL:
                        "https://milk-delivery-3a454-default-rtdb.asia-southeast1.firebasedatabase.app/")
                .ref();

            // final root = FirebaseDatabase.instance.refFromURL(
            //     "https://milk-delivery-3a454-default-rtdb.asia-southeast1.firebasedatabase.app/");
            // .child("/order");

            // CollectionReference collection =
            //     FirebaseFirestore.instance.collection('orderdata');
            try {
              // await collection.doc(user.uid).set(
              //   {
              //     'milkUnit': milk,
              //     'sub_price': milkPrice,
              //     'distance': dis,
              //     'shipping_cost': 100,
              //     'total-amount': 200,
              //   },
              // );

              await db.child('orders').push().set({
                'user_mail': user.email,
                'milkUnit': widget.milk,
                'sub_price': widget.milkPrice,
                'distance': widget.dis,
                'shipping_cost': 100,
                'total-amount': 200,
              }).then(
                (value) => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RouterPage(),
                  ),
                ),
              );
            } catch (e) {
              print("not work");
            }

            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) {
            //       return HomePage();
            //     },
            //   ),
            // );
          },
        )
      ],
    );
  }
}
