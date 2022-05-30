import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:uts_furnity/model/users.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper._internal();
  static Database? _database;

  final String tableName = 'tableUsers';
  final String columnId = 'id';
  final String columnname = 'name';
  final String columnusername = 'username';
  final String columnpassword = 'password';
  final String columnemail = 'email';

  DbHelper._internal();
  factory DbHelper() => _instance;

  Future<Database?> get _db  async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDb();
    return _database;
  }

  Future<Database?> _initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'users.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    var sql = "CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY, "
        "$columnname TEXT,"
        "$columnusername TEXT,"
        "$columnpassword TEXT,"
        "$columnemail TEXT)";
    await db.execute(sql);
  }

  Future<int?> saveUsers(Users users) async {
    var dbClient = await _db;
    return await dbClient!.insert(tableName, users.toMap());
  }

  Future<List?> getAllUsers() async {
    var dbClient = await _db;
    var result = await dbClient!.query(tableName, columns: [
      columnId,
      columnname,
      columnusername,
      columnpassword,
      columnemail
    ]);

    return result.toList();
  }

  Future<int?> updateUsers(Users users) async {
    var dbClient = await _db;
    return await dbClient!.update(tableName, users.toMap(), where: '$columnId = ?', whereArgs: [users.id]);
  }

  Future<int?> deleteUsers(int id) async {
    var dbClient = await _db;
    return await dbClient!.delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }
}