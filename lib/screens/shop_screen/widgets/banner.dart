import 'package:flutter/material.dart';
import 'package:milky/utils/mq.dart';
import 'package:milky/screens/shop_screen/shop_screen.dart';

class Banners extends StatefulWidget {
  const Banners({
    Key? key,
  }) : super(key: key);

  @override
  State<Banners> createState() => _BannersState();
}

class _BannersState extends State<Banners> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Widget> _banners = List.generate(
    3,
    (index) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Image.asset(
        'assets/promo.png',
        fit: BoxFit.fill,
      ),
    ),
  );

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _banners.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MQuery.height! * 0.25,
      child: Stack(
        fit: StackFit.expand,
        children: [
          TabBarView(
            children: _banners,
            controller: _tabController,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              width: 30,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(_banners.length, (index) {
                    return PageIndicator(
                      index: index,
                      controller: _tabController,
                    );
                  })),
            ),
          ),
        ],
      ),
    );
  }
}

class PageIndicator extends StatefulWidget {
  final int index;
  final TabController controller;
  const PageIndicator({
    Key? key,
    required this.index,
    required this.controller,
  }) : super(key: key);

  @override
  State<PageIndicator> createState() => _PageIndicatorState();
}

class _PageIndicatorState extends State<PageIndicator> {
  late bool _expanded;

  @override
  void initState() {
    super.initState();
    _expanded = widget.index == widget.controller.index;

    // add listner to tabcontroller to nextpage
    widget.controller.addListener(() {
      if (widget.index == widget.controller.index) {
        setState(() {
          _expanded = true;
        });
      } else {
        setState(() {
          _expanded = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: _expanded ? 15 : 5,
      height: 5,
      decoration: BoxDecoration(
        color: _expanded ? Colors.green : Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
