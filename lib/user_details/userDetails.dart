// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:milky/screens/milk_screen/widget/show_toast.dart';
import 'package:milky/user_details/get_user_data.dart';
import 'package:milky/utils/ReusableTextField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetUserDetails extends StatefulWidget {
  const GetUserDetails({Key? key}) : super(key: key);

  @override
  _GetUserDetailsState createState() => _GetUserDetailsState();
}

class _GetUserDetailsState extends State<GetUserDetails> {
  late String userName;
  late String userAddressNum;
  late String userAddressStreet;
  late String userAddressArea;
  late String userMobile;
  late List userDetails;
  List _detailsTextFieldList = [];
  // late final CameraPosition _cameraPosition;

  CollectionReference users =
      FirebaseFirestore.instance.collection('usersdata');

  late TextEditingController nameController,
      addressNumController,
      addressStreetController,
      addressAreaController,
      mobileController;

  @override
  void initState() {
    super.initState();

    // _cameraPosition = CameraPosition(target: LatLng(0, 0), zoom: 10.0);

    nameController = TextEditingController();
    addressNumController = TextEditingController();
    addressStreetController = TextEditingController();
    addressAreaController = TextEditingController();
    mobileController = TextEditingController();

    _detailsTextFieldList = List.unmodifiable([
      {
        "controller": nameController,
        "text_input_action": TextInputAction.next,
        "hint": 'Enter your name',
        "icon": Icons.person,
        "text_length": 20,
        "text_input_type": TextInputType.text,
        "onchange": (value) {
          setState(
            () {
              userName = value;
            },
          );
        },
        "validator": (value) {
          if (value.isEmpty) {
            return 'Please enter your name';
          }
          return null;
        },
      },
      {
        "controller": addressNumController,
        "text_input_action": TextInputAction.next,
        "hint": 'Enter your address number',
        "icon": Icons.location_on,
        "text_length": 50,
        "text_input_type": TextInputType.text,
        "onchange": (value) {
          setState(
            () {
              userAddressNum = value;
            },
          );
        },
        "validator": (value) {
          if (value.isEmpty) {
            return 'Please enter your name';
          }
          return null;
        },
      },
      {
        "controller": addressStreetController,
        "text_input_action": TextInputAction.next,
        "hint": 'Enter your address street',
        "icon": Icons.location_on,
        "text_length": 50,
        "text_input_type": TextInputType.text,
        "onchange": (value) {
          setState(
            () {
              userAddressStreet = value;
            },
          );
        },
        "validator": (value) {
          if (value.isEmpty) {
            return 'Please enter your name';
          }
          return null;
        },
      },
      {
        "controller": addressAreaController,
        "text_input_action": TextInputAction.next,
        "hint": 'Enter your address area',
        "icon": Icons.location_on,
        "text_input_type": TextInputType.text,
        "text_length": 20,
        "onchange": (value) {
          setState(
            () {
              userAddressArea = value;
            },
          );
        },
        "validator": (value) {
          if (value.isEmpty) {
            return 'Please enter your name';
          }
          return null;
        },
      },
      {
        "controller": mobileController,
        "text_input_action": TextInputAction.done,
        "hint": 'Enter your mobile number',
        "icon": Icons.phone,
        "text_input_type": TextInputType.number,
        "text_length": 10,
        "onchange": (value) {
          setState(
            () {
              userMobile = value;
            },
          );
        },
        "validator": (value) {
          if (value.isEmpty) {
            return 'Please enter your name';
          }
          if (!RegExp(r'^(?:[+0]9)?[0-9]{10}$').hasMatch(value)) {
            return 'Please enter a valid Mobile Number';
          }
        },
      }
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Color(0XFFFFFFFF),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          // margin: EdgeInsets.only(top: 80),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
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
                Padding(
                  padding: EdgeInsets.only(bottom: 50),
                  child: Column(
                    children: const [
                      Image(
                        image: AssetImage('assets/address.png'),
                        height: 100,
                        width: 100,
                      ),
                      Text(
                        'Enter Your Details',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Column(
                  children: List.generate(
                    _detailsTextFieldList.length,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: ReusableTextField(
                          control: _detailsTextFieldList[index]['controller'],
                          textInputAction: _detailsTextFieldList[index]
                              ['text_input_action'],
                          hintText: _detailsTextFieldList[index]['hint'],
                          textLength: _detailsTextFieldList[index]
                              ['text_length'],
                          onchanged: _detailsTextFieldList[index]['onchange'],
                          textIcon: _detailsTextFieldList[index]['icon'],
                          validator: _detailsTextFieldList[index]['validator'],
                          keyboardType: _detailsTextFieldList[index]
                              ['text_input_type'],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                SizedBox(
                  width: 200.0,
                  height: 50.0,
                  child: TextButton(
                    onPressed: () {
                      if (nameController.text.isEmpty ||
                          addressNumController.text.isEmpty ||
                          addressStreetController.text.isEmpty ||
                          addressAreaController.text.isEmpty ||
                          mobileController.text.isEmpty) {
                        ToastUtil.showToast('Fill the details');
                      } else {
                        setState(() {
                          UserData().createUserData(
                              nameController.text,
                              addressNumController.text,
                              addressStreetController.text,
                              addressAreaController.text,
                              mobileController.text,
                              user.email!);
                        });
                        // UserData().saveUserData();
                        ToastUtil.showToast('Data saved');
                        Navigator.pop(
                          context,
                        );
                      }
                    },
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
      ),
    );
  }

  void create() {}
}
