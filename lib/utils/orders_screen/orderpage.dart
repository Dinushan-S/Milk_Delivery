// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:milky/screens/milk_screen/milk_order.dart';
import 'package:milky/utils/ReusableTextField.dart';

class OrderPage extends StatefulWidget {
  OrderPage({this.variable, required this.count, this.price, this.distance});
  final variable;
  final count;
  final price;
  final distance;
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  late String userName;
  late String name;
  late String addressNum;
  late String addressLane;
  late String addressArea;
  late String mobile;
  late String email;
  late String milk;
  late int milkPrice;
  late int dis;
  late TextEditingController nameController,
      addressNumberController,
      addressLaneController,
      addressAreaController,
      mobileController;

  @override
  void initState() {
    super.initState();
    initUser(widget.variable, widget.count, widget.price, widget.distance);
    nameController = TextEditingController();
    addressNumberController = TextEditingController();
    addressLaneController = TextEditingController();
    addressAreaController = TextEditingController();
    mobileController = TextEditingController();
  }

  void initUser(dynamic data, dynamic count, dynamic price, dynamic distance) {
    name = data['name'];
    addressNum = data['addressNum'];
    addressLane = data['addressStreet'];
    addressArea = data['addressArea'];
    mobile = data['mobile'];
    email = data['email'];
    milk = count.toString();
    milkPrice = price;
    dis = distance.floor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Checkout',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(children: [
          Row(
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.blue,
              ),
              Column(
                children: [
                  // const Padding(
                  //   padding: EdgeInsets.only(left: 100),
                  // ),
                  Row(
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Edit Address'),
                                content: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ReusableTextField(
                                        control: nameController,
                                        textInputAction: TextInputAction.next,
                                        hintText: name,
                                        textIcon: Icons.person,
                                        onchanged: (String) {
                                          setState(
                                            () {
                                              name = nameController.text;
                                            },
                                          );
                                        },
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      ReusableTextField(
                                        control: addressNumberController,
                                        textInputAction: TextInputAction.next,
                                        hintText: addressNum,
                                        textIcon: Icons.location_on,
                                        onchanged: (String) {
                                          setState(
                                            () {
                                              addressNum =
                                                  addressNumberController.text;
                                            },
                                          );
                                        },
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      ReusableTextField(
                                        control: addressLaneController,
                                        textInputAction: TextInputAction.next,
                                        hintText: addressLane,
                                        textIcon: Icons.location_on,
                                        onchanged: (String) {
                                          setState(
                                            () {
                                              addressLane =
                                                  addressLaneController.text;
                                            },
                                          );
                                        },
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      ReusableTextField(
                                        control: addressAreaController,
                                        textInputAction: TextInputAction.next,
                                        hintText: addressArea,
                                        textIcon: Icons.location_on,
                                        onchanged: (String) {
                                          setState(
                                            () {
                                              addressArea =
                                                  addressAreaController.text;
                                            },
                                          );
                                        },
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      ReusableTextField(
                                        control: mobileController,
                                        textInputAction: TextInputAction.done,
                                        hintText: mobile,
                                        textIcon: Icons.phone,
                                        onchanged: (ValueKey) {
                                          setState(
                                            () {
                                              mobile = mobileController.text;
                                            },
                                          );
                                        },
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    child: const Text('Cancel'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: const Text('Save'),
                                    onPressed: () {
                                      final user =
                                          FirebaseAuth.instance.currentUser!;
                                      var collection = FirebaseFirestore
                                          .instance
                                          .collection('usersdata');
                                      collection.doc(user.uid).update(
                                        {
                                          'name': name,
                                          'addressNum': addressNum,
                                          'addressStreet': addressLane,
                                          'addressArea': addressArea,
                                          'mobile': mobile,
                                        },
                                      );
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: const Text('Edit'),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, right: 5),
                child: Text(
                  addressNum + ', ' + addressLane + ', ' + addressArea,
                  textAlign: TextAlign.left,
                  // maxLines: 2,
                  softWrap: true,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              const Icon(
                Icons.phone,
                color: Colors.blue,
              ),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 100),
                  ),
                  Text(
                    mobile,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.mail,
                color: Colors.blue,
              ),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 230),
                  ),
                  Text(
                    email,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              )
            ],
          ),
          const Divider(
            height: 50,
            color: Colors.black,
          ),
          Container(
            padding: EdgeInsets.all(32),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Expanded(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset(
                          'assets/milkbox.png',
                          height: 100,
                          width: 100,
                        ),
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
                Divider(
                  height: 80,
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Subtotal',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Rs.$milkPrice',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Shipping',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '$dis',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 80,
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Rs.200',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          scrollable: true,
                          title: Center(child: const Text('Confirm order')),
                          content: Container(
                            width: double.infinity,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Card(
                                        elevation: 3,
                                        child: Image(
                                            image:
                                                AssetImage('assets/logo.png'),
                                            height: 100,
                                            width: 100),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: Text(
                                        '$milk Liter Milk',
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              child: const Text('confirm the order'),
                              style: TextButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: Colors.black,
                                side: BorderSide(
                                  color: Colors.black,
                                  width: 2,
                                ),
                                elevation: 20,
                                minimumSize: Size(double.infinity, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () async {
                                final user = FirebaseAuth.instance.currentUser!;
                                final db = FirebaseDatabase(
                                        databaseURL:
                                            "https://milk-delivery-3a454-default-rtdb.asia-southeast1.firebasedatabase.app/")
                                    .ref();

                                final root = FirebaseDatabase.instance.refFromURL(
                                    "https://milk-delivery-3a454-default-rtdb.asia-southeast1.firebasedatabase.app/");
                                // .child("/order");

                                CollectionReference collection =
                                    FirebaseFirestore.instance
                                        .collection('orderdata');
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
                                    'milkUnit': milk,
                                    'sub_price': milkPrice,
                                    'distance': dis,
                                    'shipping_cost': 100,
                                    'total-amount': 200,
                                  }).then((value) => print('done'));
                                } catch (e) {
                                  print("not work");
                                }

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return MilkOrder();
                                    },
                                  ),
                                );
                              },
                            )
                          ],
                        );
                      },
                    );
                  },
                  child: Text('Place Order'),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.black,
                    side: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                    elevation: 20,
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Text(address),
          // Positioned(
          //   left: 0,
          //   right: 0,
          //   child: Container(
          //     width: double.maxFinite,
          //     height: 300.0,
          //     child: ReusableTextField(
          //       control: nameController,
          //       hintText: 'Enter name',
          //       onchanged: (value) {
          //         userName = value;
          //         // print(userName);
          //       },
          //       textIcon: Icons.person,
          //     ),
          //   ),
          // )
        ]),
      ),
    );
  }
  // double calcShiping(){
  //   if (distance) {

  //   }
  // }
}
