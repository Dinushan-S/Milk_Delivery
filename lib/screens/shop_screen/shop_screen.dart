import 'package:flutter/material.dart';
import 'package:milky/utils/mq.dart';
import 'package:milky/screens/shop_screen/widgets/banner.dart';
import 'package:milky/screens/shop_screen/widgets/category.dart';
import 'package:milky/screens/shop_screen/widgets/search_field.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MQuery().init(context);
    return SafeArea(
      child: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Name',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const SearchField(),
              const SizedBox(height: 10),
              Banners(),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(children: [
                  Text(
                    'Catagories',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ]),
              ),
              const SizedBox(height: 10),
              Category(),
            ],
          ),
        ),
      ),
    );
  }
}
