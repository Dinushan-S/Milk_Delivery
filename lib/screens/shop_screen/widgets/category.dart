import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:milky/screens/milk_screen/milk_order.dart';
import 'package:milky/screens/home/home_page.dart';
import 'package:milky/screens/shop_screen/widgets/category_list.dart';

class Category extends StatefulWidget {
  const Category({
    Key? key,
  }) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category>
    with SingleTickerProviderStateMixin {
  List categories = List.unmodifiable([
    {
      "icon": 'assets/icon/milk.svg',
      "title": 'Milk',
      "route": MilkOrder(),
    },
    {
      "icon": "assets/icon/groceries.svg",
      "title": "Groceries",
      "route": HomePage(),
    },
    {
      "icon": "assets/icon/vegetables.svg",
      "title": "Vegetables",
      "route": HomePage(),
    },
    {
      "icon": "assets/icon/technical-support.svg",
      "title": "Services",
      "route": HomePage(),
    },
    {
      "icon": "assets/icon/packagedelivery.svg",
      "title": "Package Delivery",
      "route": HomePage(),
    },
  ]);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return categories[index]['route'];
                    },
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        categories[index]['icon'],
                        width: 50,
                        height: 50,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        categories[index]['title'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
      ),
    );
  }
}
