// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:milky/screens/orders_screen/widget/add_order_list.dart';
import 'package:milky/screens/orders_screen/widget/order_conformation_model.dart';
import 'package:milky/screens/orders_screen/widget/show_user_details.dart';
import 'package:milky/utils/const.dart';

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
  List _textFieldList = [];
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

    _textFieldList = List.unmodifiable([
      {
        "controller": nameController,
        "text_input_action": TextInputAction.next,
        "hint": name,
        "icon": Icons.person,
        "text_length": 20,
        "text_input_type": TextInputType.text,
        "onchange": (value) {
          setState(
            () {
              name = nameController.text;
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
        "controller": addressNumberController,
        "text_input_action": TextInputAction.next,
        "hint": addressNum,
        "icon": Icons.location_on,
        "text_length": 20,
        "text_input_type": TextInputType.text,
        "onchange": (value) {
          setState(
            () {
              addressNum = addressNumberController.text;
            },
          );
        },
        "validator": (value) {
          if (value.isEmpty) {
            return 'Please enter your Address Number';
          }
          return null;
        },
      },
      {
        "controller": addressLaneController,
        "text_input_action": TextInputAction.next,
        "hint": addressLane,
        "icon": Icons.home,
        "text_length": 20,
        "text_input_type": TextInputType.text,
        "onchange": (value) {
          setState(
            () {
              addressLane = addressLaneController.text;
            },
          );
        },
        "validator": (value) {
          if (value.isEmpty) {
            return 'Please enter your Address Lane';
          }
          return null;
        },
      },
      {
        "controller": addressAreaController,
        "text_input_action": TextInputAction.next,
        "hint": addressArea,
        "icon": Icons.home,
        "text_length": 20,
        "text_input_type": TextInputType.text,
        "onchange": (value) {
          setState(
            () {
              addressArea = addressAreaController.text;
            },
          );
        },
        "validator": (value) {
          if (value.isEmpty) {
            return 'Please enter your Address Area';
          }
          return null;
        },
      },
      {
        "controller": mobileController,
        "text_input_action": TextInputAction.done,
        "hint": mobile,
        "icon": Icons.phone,
        "text_length": 10,
        "text_input_type": TextInputType.number,
        "onchange": (value) {
          setState(
            () {
              mobile = mobileController.text;
            },
          );
        },
        "validator": (value) {
          if (value.isEmpty) {
            return 'Please enter your Mobile Number';
          }
          if (!RegExp(r'^(?:[+0]9)?[0-9]{10}$').hasMatch(value)) {
            return 'Please enter a valid Mobile Number';
          }
          return null;
        },
      }
    ]);
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
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              ShowUserDetails(
                name: name,
                textFieldList: _textFieldList,
                addressNum: addressNum,
                addressLane: addressLane,
                addressArea: addressArea,
                mobile: mobile,
                email: email,
              ),
              const Divider(
                height: 50,
                color: Colors.black,
              ),
              Container(
                padding: EdgeInsets.all(32),
                child: Column(
                  children: [
                    AddOrderList(milk: milk, milkPrice: milkPrice),
                    AddOrderList(milk: milk, milkPrice: milkPrice),
                    AddOrderList(milk: milk, milkPrice: milkPrice),
                    Divider(
                      height: 80,
                      color: Colors.black,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(padding: EdgeInsets.only(left: 20)),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Text(
                                'Subtotal',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Rs.$milkPrice',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Text(
                                'Shipping',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Rs.$dis',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      height: 80,
                      color: Colors.black,
                    ),
                    Row(
                      children: const [
                        Expanded(
                          flex: 3,
                          child: Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Rs.200',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AspectRatio(
                              aspectRatio: 100 / 1,
                              child: OrderConformationModel(
                                  milk: milk, milkPrice: milkPrice, dis: dis),
                            );
                          },
                        );
                      },
                      child: Text('Place Order'),
                      style: kBlackTextButton,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
