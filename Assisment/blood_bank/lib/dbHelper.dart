//db helper
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'blood_requests.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE requests (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        bloodType TEXT,
        quantity INTEGER,
        message TEXT,
        status TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT NOT NULL,
        password TEXT NOT NULL
      )
    ''');
    await db.execute('''
      CREATE TABLE admins (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT NOT NULL,
        password TEXT NOT NULL
      )
    ''');
  }

  Future<int> insertRequest(BloodRequestModel request) async {
    final db = await database;
    return await db.insert('requests', request.toMap());
  }

  Future<List<BloodRequestModel>> getRequests() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('requests');
    return List.generate(maps.length, (i) {
      return BloodRequestModel(
        id: maps[i]['id'],
        bloodType: maps[i]['bloodType'],
        quantity: maps[i]['quantity'],
        message: maps[i]['message'],
        status: maps[i]['status'],
      );
    });
  }

  Future<void> updateRequest(BloodRequestModel request) async {
    final db = await database;
    await db.update(
      'requests',
      request.toMap(),
      where: 'id = ?',
      whereArgs: [request.id],
    );
  }

  Future<int> insertUser(Map<String, dynamic> user) async {
    final db = await database;
    return await db.insert('users', user);
  }

  Future<int> insertAdmin(Map<String, dynamic> admin) async {
    final db = await database;
    return await db.insert('admins', admin);
  }

  Future<Map<String, dynamic>?> getUser(String username) async {
    final db = await database;
    final result = await db.query('users', where: 'username = ?', whereArgs: [username]);
    return result.isNotEmpty ? result.first : null;
  }

  Future<Map<String, dynamic>?> getAdmin(String username) async {
    final db = await database;
    final result = await db.query('admins', where: 'username = ?', whereArgs: [username]);
    return result.isNotEmpty ? result.first : null;
  }
}
