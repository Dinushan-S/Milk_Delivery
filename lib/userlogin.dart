// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:milky/google_sign_in.dart';
import 'package:provider/provider.dart';

class UserLogin extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: const [
                  Image(
                    image: AssetImage('assets/Background.png'),
                    width: 150.0,
                    height: 200.0,
                  ),
                  Text(
                    'AppName',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
              // Text('AppName'),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: Image(
                  image: AssetImage('assets/google_logo.png'),
                  width: 30,
                  height: 30,
                ),
                // icon: FaIcon(
                //   FontAwesomeIcons.google,
                //   color: Colors.white,
                // ),
                onPressed: () {
                  final provider =
                      Provider.of<GoogleSigninProvider>(context, listen: false);
                  provider.googleLogin();
                },
                label: Text('SignIn with google'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
