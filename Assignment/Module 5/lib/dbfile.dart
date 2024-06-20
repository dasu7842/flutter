import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqfliteoffline1/model.dart';

class dbhelper
{
  static final dbhelper _instance =dbhelper._internal();
  static Database? _database;

  factory dbhelper()
  {
    return _instance;
  }
  dbhelper._internal();

  Future<Database> get database async
  {
    if (_database !=null)
      return _database!;
    _database =await _initDb();

    return _database!;
  }
  Future<Database> _initDb() async {
    String path = join(await getDatabasesPath(), 'darshan.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }


  Future _onCreate(Database db, int version) async
  {
    await db.execute('''
      CREATE TABLE table1 (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        desc TEXT,
        date TEXT,
        time TEXT,
        priority INTEGER,
        isCompleted INTEGER
      )
    ''');
}

  Future<int> insert(perform p) async
  {
    Database db = await database;
    return await db.insert('table1', p.toMap());
  }

  Future<int> delete(int id) async
  {
    Database db = await database;
    return await db.delete(
      'table1',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<perform>> get() async
  {
    Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('table1');
    return List.generate(maps.length, (i) {
      return perform.fromMap(maps[i]);
    });
  }

  Future<int> update(perform p) async {
    Database db = await database;
    return await db.update(
      'table1',
      p.toMap(),
      where: 'id = ?',
      whereArgs: [p.id],
    );
  }
  }