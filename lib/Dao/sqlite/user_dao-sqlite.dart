import 'package:our_finances/Dao/sqlite/db-helper-sqlite.dart';
import 'package:our_finances/Models/user.dart';
import 'package:sqflite/sqflite.dart';

class UserDaoSqlite {
  final DbSqlite dbHelper;

  UserDaoSqlite ({required this.dbHelper});

  Future<int> insertUser(User user) async {
    final db = await dbHelper.database;
    return await db.insert(
        'user',
        user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}