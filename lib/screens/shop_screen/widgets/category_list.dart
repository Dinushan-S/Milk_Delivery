import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SizedBox(
        child: ListView(
          // scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: <Widget>[
            const SizedBox(
              height: 15.0,
            ),
            Container(
              padding: const EdgeInsets.only(right: 15.0),
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.height - 50.0,
              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.8,
                children: <Widget>[
                  _buildCard('Milk', 'assets/logo.png', context),
                  _buildCard('Milk', 'assets/logo.png', context),
                  _buildCard('Milk', 'assets/logo.png', context),
                  _buildCard('Milk', 'assets/logo.png', context),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String name, String image, context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 15.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              ),
            ],
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
