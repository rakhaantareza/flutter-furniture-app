import 'package:flutter/material.dart';
import 'package:uts_furnity/screens/detail/components/body.dart';


class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Body(),
    );
  }
}