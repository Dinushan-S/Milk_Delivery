import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:milky/google_sign_in.dart';
import 'package:milky/home_page.dart';
import 'package:milky/productpage/milk_order.dart';
import 'package:milky/userlogin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSigninProvider(),
        child: MaterialApp(
          home: HomePage(),
          debugShowCheckedModeBanner: false,
        ),
      );
}
