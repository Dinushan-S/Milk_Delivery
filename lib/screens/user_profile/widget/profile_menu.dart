import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.white,
          padding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Color.fromARGB(255, 237, 237, 241),
        ),
        onPressed: onTap,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 22,
              color: Colors.blue,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                text,
                style: TextStyle(color: Colors.black54),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black54,
              size: 25,
            ),
          ],
        ),
      ),
    );
  }
}
