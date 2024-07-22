import 'dart:async';
import 'package:path/path.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper
{
  //database name and version
  static final _databaseName = "darshan.db";
  static final _databaseVersion = 1;

  //table names
  static final table = 'table1';


  //column name
  static final id = '_id';
  static final Entry = 'entry';


  //private constructor
  DbHelper._privateConstructor();

  //database object
  static Database? _database;

  //initialization
  static final DbHelper instance = DbHelper._privateConstructor();

  Future<Database> get database async => _database ??= await _initDatabase();
  _initDatabase()async
  {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase
      (
        path, version: _databaseVersion, onCreate: _onCreate);

  }


  //database get and initialize
  Future<Database?> get database1 async
  {
    if (_database == null)
    {
      _database = await _initDatabase();
    }
    return _database;
  }
  FutureOr<void> _onCreate(Database db, int version) async
  {
    await db.execute('''
          CREATE TABLE $table (
            $id INTEGER PRIMARY KEY,
            $Entry TEXT NOT NULL
          )
          ''');

  }
  //insert
  Future<int> insert(String entry) async
  {
    Database? db = await instance.database;
    return await db.insert(table,{Entry: entry});
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table,orderBy: '$id DESC');//select * from category
  }
}
