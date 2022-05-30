import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uts_furnity/constants.dart';
import 'package:uts_furnity/screens/home/home_screen.dart';
import 'package:uts_furnity/screens/register/components/list_users.dart';
import 'package:uts_furnity/screens/started/started_screen.dart';
import 'package:uts_furnity/db/db_helper.dart';
import 'package:uts_furnity/model/users.dart';

class FormUsers extends StatefulWidget {
  final Users? users;

  FormUsers({this.users});

  @override
  _FormUsersState createState() => _FormUsersState();
}

class _FormUsersState extends State<FormUsers> {
  DbHelper db = DbHelper();

  TextEditingController? name;
  TextEditingController? username;
  TextEditingController? password;
  TextEditingController? email;

  @override
  void initState() {
    name = TextEditingController(
        text: widget.users == null ? '' : widget.users!.name);
    username = TextEditingController(
        text: widget.users == null ? '' : widget.users!.username);
    password = TextEditingController(
        text: widget.users == null ? '' : widget.users!.password);
    email = TextEditingController(
        text: widget.users == null ? '' : widget.users!.email);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(
            top: 20, right: 50, left: 50, bottom: 50
        ),
        height: 570,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const Text.rich(
              TextSpan(
                  text: 'Sign Up\n',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 28,
                      fontFamily: 'Poppins'
                  ),
                  children: [
                    TextSpan(
                        text: 'Create new account',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 18
                        )
                    ),
                  ]
              ),
              textAlign: TextAlign.center,
            ),
            TextField(
              controller: name,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 20),
                hintText: 'Name',
                hintStyle: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 17,
                    color: kActiveIcon
                ),
              ),
            ),
            TextField(
              controller: username,
              decoration: const InputDecoration(
                hintText: 'Username',
                hintStyle: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 17,
                    color: kActiveIcon
                ),
              ),
            ),
            TextField(
              controller: email,
              decoration: const InputDecoration(
                hintText: 'Email',
                hintStyle: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 17,
                    color: kActiveIcon
                ),
              ),
            ),
            TextField(
              obscureText: true,
              controller: password,
              decoration: const InputDecoration(
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
                upsertUsers();
              },
              child: const Text(
                'Register',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins'
                ),
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

  Future<void> upsertUsers() async {
    if (widget.users != null) {
      //insert

      await db.updateUsers(Users.fromMap({
        'id' : widget.users!.id,
        'name' : name!.text,
        'username' : username!.text,
        'password' :password!.text,
        'email' : email!.text,
      }));
      Navigator.pop(context, 'update');
    } else {
      //update
      await db.saveUsers(Users(
        name: name!.text,
        username: username!.text,
        password: password!.text,
        email: email!.text,
      ));
      Navigator.pop(context, 'save');
      Navigator.push(
          context, MaterialPageRoute(
          builder: (context) => ListUsersPage()
      )
      );
    }
  }
}