class Users {
  int? id;
  String? name;
  String? username;
  String? password;
  String? email;

  Users({this.id, this.name, this.username, this.password, this.email});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    if (id != null) {
      map['id'] = id;
    }
    map['name'] = name;
    map['username'] = username;
    map['password'] = password;
    map['email'] = email;
    return map;
  }

  Users.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.name = map['name'];
    this.username = map['username'];
    this.password = map['password'];
    this.email = map['email'];
  }
}