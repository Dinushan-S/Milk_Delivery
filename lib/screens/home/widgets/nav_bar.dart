import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:milky/screens/home/widgets/nav_bar_item.dart';

class Navbar extends StatelessWidget {
  final List _tableIcons;
  final int activeIndex;
  final ValueChanged<int> onTapChanged;

  const Navbar(
      {Key? key,
      required List tableIcons,
      required this.activeIndex,
      required this.onTapChanged})
      : _tableIcons = tableIcons,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      height: 64,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 25,
            spreadRadius: -2,
            offset: Offset(0, -2),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(_tableIcons.length, (index) {
          return NavBarItem(
            icon: _tableIcons[index],
            index: index,
            activeIndex: activeIndex,
            onTapChanged: onTapChanged,
          );
        }),
      ),
    );
  }
}
