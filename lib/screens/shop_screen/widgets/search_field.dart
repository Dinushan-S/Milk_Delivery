import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[200],
        ),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search',
            prefixIcon: Padding(
              padding: const EdgeInsetsDirectional.all(10),
              child: Icon(
                Icons.search,
                color: Colors.grey[600],
              ),
            ),
          ),
        ));
  }
}
