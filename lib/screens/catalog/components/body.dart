import 'package:flutter/material.dart';
import 'package:uts_furnity/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uts_furnity/screens/home/home_screen.dart';
import 'package:uts_furnity/screens/detail/detail_screen.dart';

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
                    "Living Room",
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
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: .90,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              children: <Widget>[
                CatalogCard(
                  title: "Fejka Chair",
                  svgSrc: "assets/images/c1.png",
                  press: () {},
                ),
                CatalogCard(
                  title: "Fejka Chair",
                  svgSrc: "assets/images/c2.png",
                  press: () {},
                ),
                CatalogCard(
                  title: "Fejka Chair",
                  svgSrc: "assets/images/c3.png",
                  press: () {},
                ),
                CatalogCard(
                  title: "Fejka Chair",
                  svgSrc: "assets/images/c4.png",
                  press: () {},
                ),
                CatalogCard(
                  title: "Fejka Chair",
                  svgSrc: "assets/images/c5.png",
                  press: () {},
                ),
                CatalogCard(
                  title: "Fejka Chair",
                  svgSrc: "assets/images/c6.png",
                  press: () {},
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}

class CatalogCard extends StatelessWidget {
  final String svgSrc;
  final String title;
  final Function press;

  const CatalogCard({
    Key? key,
    required this.svgSrc,
    required this.title,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 17,
              spreadRadius: -23,
              color: kShadowColor,
            ),
          ],
        ),
        child: Material(
          color: Colors.white,
          child: InkWell(
            splashColor: Colors.white,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailScreen()),
              );
            },
            child: Column(
              children: <Widget>[
                Spacer(),
                Container(
                  width: 120,
                  height: 120,
                  child: Image.asset(svgSrc),
                ),
                Spacer(),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.w600
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}