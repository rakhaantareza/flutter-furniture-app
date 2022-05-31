import 'package:flutter/material.dart';
import 'package:uts_furnity/screens/cart/components/body.dart';
import 'package:uts_furnity/screens/cart/components/nav_bar.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Body(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}