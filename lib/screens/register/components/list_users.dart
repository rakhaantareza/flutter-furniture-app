import 'package:flutter/material.dart';
import 'package:uts_furnity/components/bottom_nav_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uts_furnity/constants.dart';
import 'package:uts_furnity/db/db_helper.dart';
import 'package:uts_furnity/model/users.dart';
import 'package:uts_furnity/screens/home/home_screen.dart';
import 'package:uts_furnity/screens/register/components/form_users.dart';
import 'package:uts_furnity/screens/home/home_screen.dart';

class ListUsersPage extends StatefulWidget {
  const ListUsersPage({Key? key}) : super(key: key);

  @override
  _ListUsersPageState createState() => _ListUsersPageState();
}

class _ListUsersPageState extends State<ListUsersPage> {
  List<Users> listUsers = [];
  DbHelper db = DbHelper();

  @override
  void initState() {
    _getAllUsers();
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
        child: ListView.builder(
            itemCount: listUsers.length,
            itemBuilder: (context, index) {
              Users users = listUsers[index];


              return ListTile(
                onTap: () {
                  //edit
                  Navigator.push(
                      context, MaterialPageRoute(
                      builder: (context) => HomeScreen()
                  )
                  );
                },
                contentPadding: EdgeInsets.all(16),
                title: Text(
                  '${users.username}',
                  style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor
                  ),
                ),
                subtitle: Text(
                  '${users.email}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    color: kPrimaryColor
                ),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    AlertDialog hapus = AlertDialog(
                      title: Text('Information'),
                      content: Container(
                        height: 100,
                        child: Column(
                          children: [
                            Text(
                              'Apakah anda yakin ingin menghapus akun'
                                  ' ${users.email}'
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          child: Text('Ya'),
                          onPressed: () {
                            //delete
                            _deleteUsers(users, index);
                            Navigator.pop(context);
                          },
                        ),
                        TextButton(
                          child: Text('Tidak'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                    showDialog(
                      context: context, builder: (context) => hapus
                    );
                  },
                ),
              );
            }
        ),
      ),
      body: Stack(
        children: <Widget> [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              Text.rich(
                TextSpan(
                    text: 'Welcome\n',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                        fontFamily: 'Poppins',
                        color: Colors.white
                    ),
                    children: [
                      TextSpan(
                          text: 'choose account to login',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18
                          )
                      ),
                    ]
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _getAllUsers() async {
    var list = await db.getAllUsers();
    setState(() {
      listUsers.clear();
      list!.forEach((users) {
        listUsers.add(Users.fromMap(users));
      });
    });
  }

  Future<void> _deleteUsers(Users users, int position) async {
    await db.deleteUsers(users.id!);

    setState(() {
      listUsers.removeAt(position);
    });
  }
}