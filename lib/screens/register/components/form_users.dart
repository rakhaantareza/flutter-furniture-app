import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uts_furnity/constants.dart';
import 'package:uts_furnity/screens/home/home_screen.dart';
import 'package:uts_furnity/screens/list_users.dart';
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
    final ButtonStyle style = ElevatedButton.styleFrom(primary: Colors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)));
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Register'),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          TextField(
            controller: name,
            decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
          ),
          TextField(
            controller: username,
            decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
          ),
          TextField(
            controller: password,
            decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
          ),
          TextField(
            controller: email,
            decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
          ),
          ElevatedButton(
            child: (widget.users == null)
                ? Text(
              'Add',
              style: TextStyle(color: Colors.white),
            )
                : Text(
              'Update',
              style: TextStyle(color: Colors.white),
            ),
            style: style,
            onPressed: () {
              upsertUsers();
            },
          )
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
      Navigator.push(context, MaterialPageRoute(builder: (context) => ListUsersPage()));
    }
  }
}