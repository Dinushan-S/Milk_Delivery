// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:milky/screens/home/home_page.dart';
import 'package:milky/screens/login_screen/userlogin.dart';

class RouterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            // return MilkOrder();
            return AnimatedSplashScreen(
              splash: LoadingAnimationWidget.inkDrop(
                color: Colors.white,
                size: 50.0,
              ),
              nextScreen: HomePage(),
              backgroundColor: Colors.blueGrey,
              duration: 3000,
            );
            // HomePage();
          } else if (snapshot.hasError) {
            return Center(child: Text('Error'));
          } else {
            return UserLogin();
          }
        },
      ),
    );
  }
}
