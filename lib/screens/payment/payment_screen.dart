import 'package:flutter/material.dart';
import 'package:uts_furnity/screens/payment/components/body.dart';


class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Body(),
    );
  }
}