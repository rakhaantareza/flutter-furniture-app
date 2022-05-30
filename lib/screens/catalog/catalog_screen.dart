import 'package:flutter/material.dart';
import 'package:uts_furnity/screens/catalog/components/body.dart';
import 'package:uts_furnity/components/bottom_nav_bar.dart';

class CatalogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Body(),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}