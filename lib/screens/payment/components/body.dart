import 'package:flutter/material.dart';
import 'package:uts_furnity/constants.dart';
import 'package:uts_furnity/screens/home/home_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        height: 200,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Text.rich(
                  TextSpan(
                    text: 'Amount:\n',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        color: kTextColor
                    ),
                    children: [
                      TextSpan(
                          text: 'IDR 499.000',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              fontFamily: 'Poppins'
                          )
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: kSecondaryColor,
                    onPrimary: kBackgroundColor,
                    shadowColor: kShadowColor,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                    minimumSize: Size(250,45),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  child: const Text(
                    'Back to Home',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins'
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget> [
          Container(
            height: size.height,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.center,
                    image: AssetImage("assets/images/success.png")
                )
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const <Widget>[
                  Text.rich(
                    TextSpan(
                      text: 'Payment successful',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          fontFamily: 'Poppins',
                          color: Colors.white
                      ),
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'Hooray! you have completed your payment',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          color: Colors.white
                      ),
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