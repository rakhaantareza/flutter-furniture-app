import 'package:flutter/material.dart';
import 'package:uts_furnity/screens/started/components/body.dart';


class StartedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Body(),
    );
  }
}