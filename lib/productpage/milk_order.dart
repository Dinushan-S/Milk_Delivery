// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:milky/login_screen/google_sign_in.dart';
import 'package:milky/user_details/userDetails.dart';
import 'package:milky/utils/getcurrentlocation.dart';
import 'package:provider/provider.dart';

class MilkOrder extends StatefulWidget {
  const MilkOrder({Key? key}) : super(key: key);

  @override
  _MilkOrderState createState() => _MilkOrderState();
}

class _MilkOrderState extends State<MilkOrder> {
  List milkCount = [0, 1, 1.5, 2];
  int length = 0;

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

  String price() {
    if (length == 0) {
      return '0';
    } else if (length == 1) {
      return '100';
    } else if (length == 2) {
      return '150';
    } else {
      return '200';
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<dynamic> getlocation() async {
      Location location = Location();
      await location.getCurrentLocation();
    }

    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
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
                      children: const [
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
          Positioned(
            top: 700,
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20.0, top: 15.0),
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
                        price(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        getlocation();
                      });

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GetUserDetails()));
                    },
                    child: Text('Add to order'),
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
