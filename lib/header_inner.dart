import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:milky/const.dart';

class HeaderInner extends StatelessWidget {
  const HeaderInner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            child: Image.asset('assets/header.png'),
            decoration: const BoxDecoration(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(20.0)),
            ),
          ),
          flex: 1,
        ),
        Expanded(child: Container(), flex: 1)
      ],
    );
  }
}
