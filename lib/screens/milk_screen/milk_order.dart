// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:milky/screens/login_screen/google_sign_in.dart';
import 'package:milky/screens/orders_screen/orderpage.dart';
import 'package:milky/screens/milk_screen/widget/show_toast.dart';
import 'package:milky/screens/shop_screen/shop_screen.dart';
import 'package:milky/user_details/userDetails.dart';
import 'package:provider/provider.dart';

import 'widget/get_distance.dart';

class MilkOrder extends StatefulWidget {
  @override
  _MilkOrderState createState() => _MilkOrderState();
}

class _MilkOrderState extends State<MilkOrder> {
  List milkCount = [0, 1, 1.5, 2];
  int length = 0;
  late double distance = 0;

  getRange(String value) {
    if (value == 'min') {
      if (length == 0) {
        print(length);
        length = 0;
      } else {
        print(length);
        length--;
      }
    } else if (value == 'max') {
      if (length == 3) {
        length = 3;
        print(length);
      } else {
        length++;
        print(length);
      }
    }
  }

  int price() {
    if (length == 0) {
      return 0;
    } else if (length == 1) {
      return 100;
    } else if (length == 2) {
      return 150;
    } else {
      return 200;
    }
  }

  List userProfileList = [];

  @override
  void initState() {
    super.initState();
    getdistance(distance);

    // fetecDataList();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: 300.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/header.png'),
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 50,
            child: Row(
              children: [
                IconButton(
                  iconSize: 30.0,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
              ],
            ),
          ),
          Positioned(
            top: 275,
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20.0, top: 15.0),
              width: MediaQuery.of(context).size.width,
              height: 500,
              decoration: const BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Center(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 120,
                        ),
                        Text(
                          'Milk order',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(' km'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () {
                        final provider = Provider.of<GoogleSigninProvider>(
                            context,
                            listen: false);
                        provider.Logout();
                      },
                      child: Text('logout')),
                  Row(
                    children: [
                      Text(
                        'About delevery time...............',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Milk',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                            color: Colors.black),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              getRange('min');
                              // milkCount.removeAt(length);
                              // getRange('min');
                            });
                          }),
                      Text(
                        '${milkCount[length]}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                      RoundIconButton(
                        icon: FontAwesomeIcons.plus,
                        onPressed: () {
                          setState(() {
                            getRange('max');
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Positioned(
                child: Container(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20.0, top: 15.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xFFF0F3FC),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            price().toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () async {
                          DocumentSnapshot docRef = await FirebaseFirestore
                              .instance
                              .collection('usersdata')
                              .doc(user.uid)
                              .get();

                          // docRef.get().then((value) async {
                          if (docRef.exists) {
                            print('exists');
                            print('order somthing');
                            if (docRef['status'] == 'active')
                              print('user name is ${docRef['name']}');
                            print('user email is ${docRef['email']}');
                            if (length > 0) {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return OrderPage(
                                      variable: docRef,
                                      count: milkCount[length],
                                      price: price(),
                                      distance: distance,
                                    );
                                  },
                                ),
                              );
                            } else {
                              // showToast msg
                              ToastUtil.showToast('please add a item');
                            }
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return GetUserDetails();
                                },
                              ),
                            );
                          }

                          // DocumentSnapshot variable = await FirebaseFirestore
                          //     .instance
                          //     .collection('usersdata')
                          //     .doc(user.uid)
                          //     .get();

                          // print(variable['status']);
                          setState(() {});
                        },
                        child: Text('Checkout'),
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white),
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xFFFF456E))),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPressed});
  final IconData icon;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      // onLongPress: onPressed,

      onLongPress: onPressed,
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(width: 46.0, height: 46.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      fillColor: Color(0xFFF0F3FC),

      // backgroundColor: Color(0xFF4C4F5E),
      // child: Icon(
      //   icon,
      //   color: Colors.white,
      // ),
    );
  }
}
