import 'package:flutter/material.dart';
import 'package:milky/screens/orders_screen/widget/edit_user_details.dart';

class ShowUserDetails extends StatelessWidget {
  const ShowUserDetails({
    Key? key,
    required this.name,
    required List textFieldList,
    required this.addressNum,
    required this.addressLane,
    required this.addressArea,
    required this.mobile,
    required this.email,
  })  : _textFieldList = textFieldList,
        super(key: key);

  final String name;
  final List _textFieldList;
  final String addressNum;
  final String addressLane;
  final String addressArea;
  final String mobile;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
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
                              return EditUserDetails(
                                textFieldList: _textFieldList,
                                name: name,
                                addressNum: addressNum,
                                addressLane: addressLane,
                                addressArea: addressArea,
                                mobile: mobile,
                              );
                            },
                          );
                        },
                        child: const Text('Edit'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20, right: 5),
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
        ],
      ),
    );
  }
}
