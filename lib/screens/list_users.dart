import 'package:flutter/material.dart';
import 'package:uts_furnity/components/bottom_nav_bar.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih Akun Untuk Login'),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
          itemCount: listUsers.length,
          itemBuilder: (context, index) {
            Users users = listUsers[index];

            return ListTile(
              onTap: () {
                //edit
                _openFormEdit(users);
              },
              contentPadding: EdgeInsets.all(16),
              title: Text(
                '${users.name} ${users.username}',
                style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    color: Colors.deepOrangeAccent),
              ),
              subtitle: Text('${users.email}'),
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
                              'Apakah anda yakin ingin menghapus data ${users.email}'),
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
                  showDialog(context: context, builder: (context) => hapus);
                },
              ),
              leading: IconButton(
                onPressed: () {
                  //detail
                  Navigator.push(
                      context, MaterialPageRoute(
                      builder: (context) => HomeScreen()
                    )
                  );
                },
                icon: Icon(Icons.visibility),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
        onPressed: () {
          //add
          _openFormCreate();
        },
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

  Future<void> _openFormCreate() async {
    var result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => FormUsers()));
    if (result == 'save') {
      await _getAllUsers();
    }
  }

  Future<void> _openFormEdit(Users users) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => FormUsers(users: users)));
    if (result == 'update') {
      await _getAllUsers();
    }
  }
}