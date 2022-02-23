// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:milky/login_screen/google_sign_in.dart';
import 'package:milky/orderpage.dart';
import 'package:milky/user_details/get_user_data.dart';
import 'package:milky/user_details/userDetails.dart';
import 'package:milky/utils/getcurrentlocation.dart';
import 'package:provider/provider.dart';
import 'package:milky/user_details/get_user_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MilkOrder extends StatefulWidget {
  @override
  _MilkOrderState createState() => _MilkOrderState();
}

class _MilkOrderState extends State<MilkOrder> {
  List milkCount = [0, 1, 1.5, 2];
  int length = 0;
  late FToast fToast;
  late double? distance;

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
    getlocation();
    fToast = FToast();
    fToast.init(context);
    // fetecDataList();
  }

  _showToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.black54,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "add a milk",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );
  }

  void showToast() {
    Fluttertoast.showToast(
        msg: "Order Placed Successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  // void _showToast(BuildContext context) {
  //   final scaffold = ScaffoldMessenger.of(context);
  //   scaffold.showSnackBar(
  //     SnackBar(
  //       content: const Text('Add a quantity'),
  //       // action: SnackBarAction(
  //       //     label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
  //     ),
  //   );
  // }

  // fetecDataList() async {
  //   dynamic resultant = await UserData().getUserList();

  //   if (resultant == null) {
  //     print('enable to ret');
  //   } else {
  //     setState(() {
  //       userProfileList = resultant;
  //     });
  //   }
  // }

  Future<dynamic> getlocation() async {
    Location location = Location();
    await location.getCurrentLocation();

    distance = getdistance(location.latitude, location.longtitude);

    // print(distance);
  }

  double getdistance(double lat, double long) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((8.759475 - lat) * p) / 2 +
        c(lat * p) * c(8.759475 * p) * (1 - c((80.500039 - long) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  @override
  Widget build(BuildContext context) {
    String? dat;
    final user = FirebaseAuth.instance.currentUser!;
    // print(distance);
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
                  onPressed: () {},
                  icon: const Icon(Icons.menu),
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
                              // showToast;
                              _showToast();
                            }
                          } else {
                            print('not exists');
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
                          String me;
                          ListView.builder(itemBuilder: (context, index) {
                            return dat = userProfileList[index]['name'];
                          });
                          // print(dat);
                          // if (variable.exists) {
                          //   print('order somthing');
                          //   if (variable['status'] == 'active')
                          //     print('user name is ${variable['name']}');
                          //   print('user email is ${variable['address']}');
                          // } else {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) {
                          //         return GetUserDetails();
                          //       },
                          //     ),
                          //   );
                          // }

                          // print(userDetails);
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

// children: <Widget>[
//   const HeaderInner(),
//   ListView(
//     children: <Widget>[
//       SizedBox(height: Constants.mainPadding * 1),
//       const Center(
//         child: Text(
//           "Milk Order",
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontSize: 34,
//             fontWeight: FontWeight.w900,
//             color: Colors.black,
//           ),
//         ),
//       ),
//       SizedBox(height: Constants.mainPadding * 2),
//       Container(
//         padding: EdgeInsets.fromLTRB(
//             Constants.mainPadding,
//             Constants.mainPadding * 2,
//             Constants.mainPadding,
//             Constants.mainPadding),
//         decoration: const BoxDecoration(
//           borderRadius:
//               BorderRadius.vertical(top: Radius.circular(50.0)),
//           color: Colors.white,
//         ),
//         child: ListView(
//           scrollDirection: Axis.vertical,
//           physics: const NeverScrollableScrollPhysics(),
//           shrinkWrap: true,
//           children: const <Widget>[

//           ],
//         ),
//       ),
//     ],
//   ),
// ],

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
