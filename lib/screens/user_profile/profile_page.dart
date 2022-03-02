import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:milky/screens/user_profile/widget/profile_menu.dart';
import 'package:milky/user_details/get_user_data.dart';
import 'package:milky/utils/mq.dart';
import 'package:provider/provider.dart';

class UserProfilePage extends StatelessWidget {
  @override
  UserProfilePage({Key? key}) : super(key: key);
  final user = FirebaseAuth.instance.currentUser!;

  getProfileImage() {
    if (user.photoURL != null) {
      return Image.network("${user.photoURL}");
      // return Text('${user.displayName}');
    } else {
      return Image.asset('assets/images/profile_placeholder.png');
    }
  }

  final List _profileList = List.unmodifiable([
    {
      'text': 'Profile',
      'icon': 'assets/icon/user.svg',
      'ontap': () {
        print('Profile');
      },
    },
    {
      'text': 'Order History',
      'icon': 'assets/icon/user.svg',
      'ontap': () {
        print('Order History');
      },
    },
    {
      'text': 'setting',
      'icon': 'assets/icon/user.svg',
      'ontap': () {
        print('setting');
      },
    },
    {
      'text': 'Logout',
      'icon': 'assets/icon/user.svg',
      'ontap': () async {
        await FirebaseAuth.instance.signOut();
      },
    },
  ]);

  @override
  Widget build(BuildContext context) {
    MQuery().init(context);
    // final user = FirebaseAuth.instance.currentUser!;
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Profile',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  height: 110,
                  width: 110,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            Image.network("${user.photoURL}").image,
                        // child: getProfileImage(),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: List.generate(
                    _profileList.length,
                    (index) => ProfileMenu(
                        icon: _profileList[index]['icon'],
                        text: _profileList[index]['text'],
                        onTap: _profileList[index]['ontap'])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
