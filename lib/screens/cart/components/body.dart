import 'package:flutter/material.dart';
import 'package:uts_furnity/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uts_furnity/screens/home/home_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: <Widget>[
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 15, left: 5, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: SvgPicture.asset(
                        "assets/icons/back.svg",
                        color: kPrimaryColor
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                  ),
                  const Text(
                    "Shopping Cart",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        color: Colors.black
                    ),
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                        "assets/icons/menu.svg",
                        color: kPrimaryColor),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Stack(
                  children: const <Widget>[
                    Text(
                      "You have not added any item to the cart.",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
          )
        ],
      ),
    );
  }
}
