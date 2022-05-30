import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uts_furnity/constants.dart';
import 'package:uts_furnity/screens/home/home_screen.dart';
import 'package:uts_furnity/screens/started/started_screen.dart';
import 'package:uts_furnity/screens/register/register_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(
          top: 20, right: 50, left: 50, bottom: 130
        ),
        height: 520,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text.rich(
              TextSpan(
                text: 'Welcome\n',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 28,
                  fontFamily: 'Poppins'
                ),
                children: [
                  TextSpan(
                    text: 'Login to your account',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18
                      )
                  ),
                ]
              ),
              textAlign: TextAlign.center,
            ),
            const TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 20),
                hintText: 'Username',
                hintStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 17,
                  color: kActiveIcon
                ),
              ),
            ),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical:8),
                hintText: 'Password',
                hintStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 17,
                  color: kActiveIcon
                ),
                suffixIcon: Icon(
                  Icons.visibility_off, color: kActiveIcon,
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: kSecondaryColor,
                onPrimary: kBackgroundColor,
                shadowColor: Colors.white,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)
                ),
                minimumSize: Size(230, 45),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: const Text(
                'Login',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins'
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
              },
              child: const Text.rich(
                  TextSpan(
                      text: 'Register Now',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          decoration: TextDecoration.underline,
                          color: kTextColor
                      ),
                  )
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget> [
          Container(
            margin: EdgeInsets.only(top: 40),
            height: size.height * .75,
            decoration: const BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.center,
                image: AssetImage("assets/images/login.png"),
              ),
            ),
          ),
          IconButton(
            padding: EdgeInsets.only(top: 50, left: 10),
            icon: SvgPicture.asset(
                "assets/icons/back.svg",
                color: kActiveIcon
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StartedScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}