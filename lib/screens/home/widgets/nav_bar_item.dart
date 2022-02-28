import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBarItem extends StatefulWidget {
  final int index;
  final int activeIndex;
  final dynamic icon;
  final ValueChanged<int> onTapChanged;
  const NavBarItem({
    Key? key,
    this.icon,
    required this.activeIndex,
    required this.index,
    required this.onTapChanged,
  }) : super(key: key);

  @override
  State<NavBarItem> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      lowerBound: 1,
      upperBound: 1.3,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onTab() {
    //change current index to tapped index
    if (widget.index != widget.activeIndex) {
      widget.onTapChanged(widget.index);
      _controller.forward().then((value) => _controller.reverse());
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 30,
            height: 30,
            child: ScaleTransition(
              scale: _controller,
              child: SvgPicture.asset(
                widget.icon['icon'],
                color: widget.activeIndex == widget.index
                    ? Colors.black
                    : Colors.black26,
              ),
            ),
          ),
          // Text(
          //   widget.icon['title'],
          //   style: TextStyle(
          //       fontSize: 15,
          //       fontWeight: FontWeight.w600,
          //       color: widget.activeIndex == widget.index
          //           ? Colors.black
          //           : Colors.black26),
          // ),
        ],
      ),
    );
  }
}
