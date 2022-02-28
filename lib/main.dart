import 'package:flutter/material.dart';
import 'package:milky/screens/login_screen/google_sign_in.dart';
import 'package:milky/screens/home_page/router_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        child: ScreenUtilInit(
          builder: () => MaterialApp(
            home: RouterPage(),
            debugShowCheckedModeBanner: false,
          ),
          designSize: const Size(360, 640),
        ),
      );
}
