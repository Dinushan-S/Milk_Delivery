import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserData {
  CollectionReference users =
      FirebaseFirestore.instance.collection('usersdata');

  // UserData(
  //     {required this.name,
  //     required this.address,
  //     required this.mobile,
  //     required this.email});

  final user = FirebaseAuth.instance.currentUser!;
  // final String name;
  // final String address;
  // final String mobile;
  // final String email;

  @override
  void initState() {
    // saveUserData();
  }

  Future<void> createUserData(
      String name,
      String addressNum,
      String addressStreet,
      String addressArea,
      String mobile,
      String email) async {
    return await users.doc(user.uid).set({
      'name': name,
      'addressNum': addressNum,
      'addressStreet': addressStreet,
      'addressArea': addressArea,
      'mobile': mobile,
      'email': email,
      'status': 'active',
    }).then((value) => print('save data'));
  }

  // void saveUserData() async {
  //   await users.add({
  //     'name': name,
  //     'address': address,
  //     'mobile': mobile,
  //     'email': email,
  //   }).then((value) => print('success'));
  // }

  Future getUserList() async {
    List itemList = [];
    try {
      await users.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          itemList.add(element.data);
        });
      });
      return itemList;
    } catch (e) {
      print(e);
    }
  }
}
