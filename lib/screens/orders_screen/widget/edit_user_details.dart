import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:milky/utils/ReusableTextField.dart';

class EditUserDetails extends StatelessWidget {
  const EditUserDetails({
    Key? key,
    required List textFieldList,
    required this.name,
    required this.addressNum,
    required this.addressLane,
    required this.addressArea,
    required this.mobile,
  })  : _textFieldList = textFieldList,
        super(key: key);

  final List _textFieldList;
  final String name;
  final String addressNum;
  final String addressLane;
  final String addressArea;
  final String mobile;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Address'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(_textFieldList.length, (index) {
            return AspectRatio(
              aspectRatio: 12 / 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ReusableTextField(
                  control: _textFieldList[index]['controller'],
                  textInputAction: _textFieldList[index]['text_input_action'],
                  hintText: _textFieldList[index]['hint'],
                  textIcon: _textFieldList[index]['icon'],
                  onchanged: _textFieldList[index]['onchange'],
                  textLength: _textFieldList[index]['text_length'],
                  validator: _textFieldList[index]['validator'],
                  keyboardType: _textFieldList[index]['text_input_type'],
                ),
              ),
            );
          }),
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
            final user = FirebaseAuth.instance.currentUser!;
            var collection = FirebaseFirestore.instance.collection('usersdata');
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
  }
}
