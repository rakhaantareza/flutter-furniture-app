import 'package:flutter/material.dart';
import 'package:uts_furnity/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uts_furnity/screens/catalog/catalog_screen.dart';
import 'package:uts_furnity/screens/payment/payment_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        height: 340,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text.rich(
                  TextSpan(
                    text: 'FEJKA\n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      fontFamily: 'Poppins'
                    ),
                    children: [
                      TextSpan(
                        text: 'IDR 499.000',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                          fontFamily: 'Poppins'
                        )
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        alignment: Alignment.topRight,
                        height: 50,
                        width: 50,
                        child: IconButton(
                          icon: SvgPicture.asset(
                              "assets/icons/star.svg"
                          ),
                            onPressed: () {}
                        ),
                      ),
                    ),
                    const Text(
                      '4.8',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Poppins'
                      ),
                    )
                  ],
                ),
              ],
            ),
            const Text.rich(
              TextSpan(
                text: 'Bring new life to an old favourite. '
                    'We first introduced this chair in the 1950s.'
                    ' Some 60 years later we brought it back into the range'
                    ' with the same craftsmanship.',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  color: kTextColor
                ),
              ),
              textAlign: TextAlign.justify,
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
                    minimumSize: Size(140,45),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PaymentScreen()),
                    );
                  },
                  child: const Text(
                    'Buy Now',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins'
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: kSecondaryColor,
                    onPrimary: kBackgroundColor,
                    shadowColor: kShadowColor,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    minimumSize: Size(140, 45),
                  ),
                  onPressed: () {
                  },
                  child: const Text(
                    'Add to Cart',
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
                image: AssetImage("assets/images/detail.png")
              )
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
                MaterialPageRoute(builder: (context) => CatalogScreen()),
              );
            },
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      child: IconButton(
                        icon: SvgPicture.asset(
                            "assets/icons/wishlist.svg",
                            color: kActiveIcon
                        ),
                        onPressed: () {
                        },
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