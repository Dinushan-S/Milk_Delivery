// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:milky/productpage/milk_order.dart';
import 'package:milky/user_details/get_user_data.dart';
import 'package:milky/utils/ReusableTextField.dart';
import 'package:firebase_database/firebase_database.dart';
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
  late FToast fToast;
  late final CameraPosition _cameraPosition;

  CollectionReference users =
      FirebaseFirestore.instance.collection('usersdata');

  late TextEditingController nameController,
      addressNumController,
      addressStreetController,
      addressAreaController,
      mobileController;

  late DatabaseReference _ref;
  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);

    _cameraPosition = CameraPosition(target: LatLng(0, 0), zoom: 10.0);

    _ref = FirebaseDatabase.instance.ref().child('userdata');

    nameController = TextEditingController();
    addressNumController = TextEditingController();
    addressStreetController = TextEditingController();
    addressAreaController = TextEditingController();
    mobileController = TextEditingController();
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
        children: const [
          Text(
            "Fill the details",
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
                Image(
                  image: AssetImage('assets/address.png'),
                  height: 100,
                  width: 100,
                ),
                Text(
                  'Enter Your Address',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 32,
                ),
                ReusableTextField(
                  control: nameController,
                  textInputAction: TextInputAction.next,
                  hintText: 'Enter name',
                  onchanged: (value) {
                    userName = value;
                    // print(userName);
                  },
                  textIcon: Icons.person,
                ),
                SizedBox(
                  height: 32,
                ),
                ReusableTextField(
                  control: addressNumController,
                  textInputAction: TextInputAction.next,
                  hintText: 'Enter address number',
                  onchanged: (value) {},
                  textIcon: Icons.home,
                ),
                SizedBox(
                  height: 32,
                ),
                ReusableTextField(
                  control: addressStreetController,
                  textInputAction: TextInputAction.next,
                  hintText: 'Enter street ',
                  onchanged: (value) {
                    // userAddress = value;
                  },
                  textIcon: Icons.home,
                ),
                SizedBox(
                  height: 32,
                ),
                TextField(
                  controller: addressAreaController,
                  onTap: () => {},
                  decoration: InputDecoration(
                    hintText: 'Enter area',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                // TextButton(
                //     onPressed: () {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => GoogleMap(
                //             initialCameraPosition: _cameraPosition,
                //             // onMapCreated: (GoogleMapController controller) {
                //             //   _controller = (controller);
                //             //   _controller.animateCamera(
                //             //       CameraUpdate.newCameraPosition(_cameraPosition));
                //             // },
                //             // markers: _markers,
                //             onCameraIdle: () {
                //               setState(() {});
                //             },
                //           ),
                //         ),
                //       );
                //     },
                //     child: Text('data')),
                ReusableTextField(
                  control: addressAreaController,
                  textInputAction: TextInputAction.next,
                  hintText: 'Enter your ',
                  onchanged: (value) {
                    // userAddress = value;
                  },
                  textIcon: Icons.home,
                ),
                SizedBox(
                  height: 32,
                ),
                ReusableTextField(
                  control: mobileController,
                  // focus: FocusScopeNode(),
                  hintText: 'mobile',
                  textInputAction: TextInputAction.done,
                  onchanged: (value) {
                    userMobile = value;
                  },
                  textIcon: Icons.phone,
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
                        _showToast();
                      } else {
                        // await users.add({
                        //   'name': nameController.text,
                        //   'address': userAddress,
                        //   'mobile': userMobile,
                        // }).then((value) {
                        //   print('success');
                        // });
                        // Map<String, dynamic> data = {
                        //   'name': userName,
                        //   'address': addressController.text,
                        //   'mobile': mobileController.text,
                        // };
                        // FirebaseFirestore.instance.collection('userdat').add(data);
                        // saveData();
                        setState(() {
                          // UserData userDetails = UserData(
                          //   name: nameController.text,
                          //   address: addressController.text,
                          //   mobile: mobileController.text,
                          //   email: user.email!,
                          // );
                          // userDetails.saveUserData();
                          UserData().createUserData(
                              nameController.text,
                              addressNumController.text,
                              addressStreetController.text,
                              addressAreaController.text,
                              mobileController.text,
                              user.email!);
                        });
                        // UserData().saveUserData();

                        // userDetails = [userName, userAddress, userMobile];
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
