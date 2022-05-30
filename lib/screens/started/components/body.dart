import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uts_furnity/constants.dart';
import 'package:uts_furnity/screens/login/login_screen.dart';
import 'package:uts_furnity/screens/register/register_screen.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        height: 310,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: kSecondaryColor,
                onPrimary: kBackgroundColor,
                shadowColor: kShadowColor,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)
                ),
                minimumSize: Size(230, 45),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: const Text(
                'Login',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.green,
                shadowColor: Colors.grey,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)
                ),
                minimumSize: Size(230, 45),
              ),
              onPressed: () {},
              child: const Text(
                'Google',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blueAccent,
                onPrimary: Colors.white,
                shadowColor: Colors.grey,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)
                ),
                minimumSize: Size(230, 45),
              ),
              onPressed: () {},
              child: const Text(
                'Facebook',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            SizedBox(height: 5),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
              },
              child: const Text.rich(
                  TextSpan(
                    text: 'Dont have an account? ',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      color: Colors.black87
                    ),
                    children: [
                      TextSpan(
                        text: 'Create Account',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline
                        ),
                      )
                    ]
                  )
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
          height: size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
              alignment: Alignment.center,
              image: AssetImage("assets/images/logo.png")
              )
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 20
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
          )
        ],
      ),
    );
  }
}