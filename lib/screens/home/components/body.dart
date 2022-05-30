import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uts_furnity/screens/catalog/catalog_screen.dart';
import 'header_with_searchbox.dart';
import 'package:uts_furnity/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        HeaderWithSearchBox(size: size),
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(left: 20),
          height: 25,
            child: Stack(
              children: const <Widget>[
                Text(
                  "Explore Categories",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
        ),
        Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: .85 * 1.3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              children: <Widget>[
                CategoryCard(
                  title: "Living Room",
                  svgSrc: "assets/icons/livingroom.svg",
                  press: () {},
                ),
                CategoryCard(
                  title: "Kitchen",
                  svgSrc: "assets/icons/kitchen.svg",
                  press: () {},
                ),
                CategoryCard(
                  title: "Bedroom",
                  svgSrc: "assets/icons/bedroom.svg",
                  press: () {},
                ),
                CategoryCard(
                  title: "Bathroom",
                  svgSrc: "assets/icons/bathroom.svg",
                  press: () {},
                ),
              ],
            )
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String svgSrc;
  final String title;
  final Function press;

  const CategoryCard({
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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CatalogScreen()),
              );
            },
            child: Column(
              children: <Widget>[
                Spacer(),
                Container(
                  width: 80,
                  height: 80,
                  child: SvgPicture.asset(svgSrc),
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