import 'package:flutter/material.dart';
import 'package:uts_furnity/screens/register/components/form_users.dart';


class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: FormUsers(),
    );
  }
}