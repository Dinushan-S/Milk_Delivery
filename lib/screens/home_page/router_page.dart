// ignore_for_file: prefer_const_constructors

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:milky/screens/home/home_page.dart';
import 'package:milky/screens/login_screen/userlogin.dart';

import '../login_screen/widget/login_controller.dart';

class RouterPage extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          return HomePage();
          // return MilkOrder();
          // return AnimatedSplashScreen(
          //   splash: LoadingAnimationWidget.inkDrop(
          //     color: Colors.white,
          //     size: 50.0,
          //   ),
          //   nextScreen: HomePage(),
          //   backgroundColor: Colors.blueGrey,
          //   duration: 3000,
          // );
          // HomePage();
        } else {
          return UserLogin();
          // return Center(
          //   child: Obx(
          //     () {
          //       if (controller.googleAccount.value == null) {
          //         return UserLogin();
          //       } else {
          //         return HomePage();
          //       }
          //     },
          //   ),
          // );

        }
        // return HomePage();
        // AnimatedSplashScreen(
        //   splash: LoadingAnimationWidget.inkDrop(
        //     color: Colors.white,
        //     size: 50.0,
        //   ),
        //   nextScreen: HomePage(),
        //   backgroundColor: Colors.blueGrey,
        //   // duration: 3000,
        // );
        // else if (snapshot.hasError) {
        // return UserLogin();
        // } else {
        // return UserLogin();
        // }
      },
    );
  }
}
