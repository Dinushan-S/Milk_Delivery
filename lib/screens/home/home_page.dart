import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:milky/screens/home/widgets/nav_bar.dart';
import 'package:milky/screens/shop_screen/shop_screen.dart';

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
    Container(),
    Container(),
  ]);

  //handle tab change
  void onTabChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
