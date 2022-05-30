import 'package:flutter/material.dart';
import 'package:uts_furnity/screens/login/components/body.dart';


class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Body(),
    );
  }
}