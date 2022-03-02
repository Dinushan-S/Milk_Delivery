import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:milky/cart_screen/cart_page.dart';
import 'package:milky/screens/home/widgets/nav_bar.dart';
import 'package:milky/screens/shop_screen/shop_screen.dart';
import 'package:milky/screens/user_profile/profile_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final List _tableIcons = List.unmodifiable([
    {'icon': 'assets/icon/home.svg', 'title': 'Home'},
    {'icon': 'assets/icon/cart.svg', 'title': 'Cart'},
    {'icon': 'assets/icon/user.svg', 'title': 'Profile'},
  ]);

  final List<Widget> _tabs = List.unmodifiable([
    ShopScreen(),
    CartPage(),
    UserProfilePage(),
  ]);

  //handle tab change
  void onTabChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      body: _tabs[currentIndex],
      bottomNavigationBar: Navbar(
        tableIcons: _tableIcons,
        activeIndex: currentIndex,
        onTapChanged: onTabChanged,
      ),
    );
  }
}
