import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;

    String path = join(await getDatabasesPath(), 'mydb.db');
    _db = await openDatabase(path, version: 1, onCreate: (db, version) async{
      try{
        db.execute("CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT, department TEXT)");
        db.execute("""
      CREATE TABLE user_details(
        id INTEGER PRIMARY KEY,
        user_id INTEGER,
        reason TEXT,
        amount_of_debut INTEGER,
        date TEXT,
        FOREIGN KEY (user_id) REFERENCES users(id)
      )
      """);
      }
      catch(e){
        print(e);
      }

    });

    return _db!;
  }

  Future<int> insertUser(String name, String dept) async {
    final db = await database;
    return db.insert('users', {'name': name, 'department': dept});
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await database;
    return db.query('users');
  }

  Future<int> insertDebut(int user_id,String reason,int amount,String date) async{

    final db = await database;

    return db.insert('user_details', {'user_id':user_id,'reason':reason,'amount_of_debut':amount,'date':date});
  }

  Future<List<Map<String, dynamic>>> getUsersDebut(int userId) async {
    final db = await database;
    return db.query('user_details',where: 'user_id = ?',whereArgs: [userId] );
  }
}
