// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:milky/utils/ReusableTextField.dart';

class GetUserDetails extends StatefulWidget {
  const GetUserDetails({Key? key}) : super(key: key);

  @override
  _GetUserDetailsState createState() => _GetUserDetailsState();
}

class _GetUserDetailsState extends State<GetUserDetails> {
  late String userName;
  late String userAddress;
  late String userMobile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFFFFFF),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          // margin: EdgeInsets.only(top: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image(
                image: AssetImage('assets/address.png'),
                height: 100,
                width: 100,
              ),
              Text('Enter Your Address',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              ReusableTextField(
                hintText: 'Enter name',
                onchanged: (value) {
                  userName = value;
                },
                textIcon: Icons.person,
              ),
              ReusableTextField(
                hintText: 'Address',
                onchanged: (value) {
                  userAddress = value;
                },
                textIcon: Icons.home,
              ),
              ReusableTextField(
                hintText: 'mobile',
                onchanged: (value) {
                  userMobile = value;
                },
                textIcon: Icons.phone,
              ),
              SizedBox(
                width: 200.0,
                height: 50.0,
                child: TextButton(
                  onPressed: () {},
                  child: Text('Submit Details'),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
