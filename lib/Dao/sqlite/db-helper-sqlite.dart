import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbSqlite {
  static const _dbName = "our_finances.db";
  static const _dbVersion = 1;

  static final DbSqlite instance = DbSqlite._internal();
  DbSqlite._internal();

  static Database? _db;

  Future<Database> get database async {
    if(_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  _initDB() async {
    final db = await openDatabase(
      join(await getDatabasesPath(), _dbName),
      version: _dbVersion,
      onCreate: _onCreate,
    );
    await db.execute('PRAGMA foreign_keys = ON');
    return db;
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS user(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        name TEXT NOT NULL,
        balance NUMERIC NOT NULL
      );
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS category(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        name TEXT NOT NULL,
        icon NUMERIC NOT NULL
      );
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS payment(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        name TEXT NOT NULL,
        date TEXT NOT NULL,
        description TEXT,
        balance NUMERIC NOT NULL,
        category INTEGER NOT NULL,
        id_user INTEGER NOT NULL,
        FOREIGN KEY(category) REFERENCES
        category(id),
        FOREIGN KEY(id_user) REFERENCES
        user(id)
      );
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS revenue(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        name TEXT NOT NULL,
        date TEXT NOT NULL,
        description TEXT,
        balance NUMERIC NOT NULL,
        category INTEGER NOT NULL,
        id_user INTEGER NOT NULL,
        FOREIGN KEY(category) REFERENCES
        category(id),
        FOREIGN KEY(id_user) REFERENCES
        user(id)
      );
    ''');
  }

  Future close() async{
    if (_db != null) {
      await _db!.close();
      _db = null;
    }
  }
}