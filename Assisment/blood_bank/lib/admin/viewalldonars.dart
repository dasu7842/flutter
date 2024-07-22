import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'donarpage.dart';

class ViewAllDonors extends StatefulWidget
{
  @override
  _ViewAllDonorsState createState() => _ViewAllDonorsState();
}

class _ViewAllDonorsState extends State<ViewAllDonors> {
  late Future<Database> _database;

  @override
  void initState() {
    super.initState();
    _database = _initDatabase();
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'blood_bank.db');
    return openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE donors (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        blood_group TEXT,
        location TEXT
      )
    ''');
  }

  Future<List<Map<String, dynamic>>> _getDonors(Database db) async {
    return db.query('donors');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View All Donors', style: TextStyle(fontWeight: FontWeight.w800)),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder<Database>(
        future: _database,
        builder: (context, databaseSnapshot) {
          if (databaseSnapshot.connectionState == ConnectionState.done) {
            if (databaseSnapshot.hasData) {
              return FutureBuilder<List<Map<String, dynamic>>>(
                future: _getDonors(databaseSnapshot.data!),
                builder: (context, querySnapshot) {
                  if (querySnapshot.connectionState == ConnectionState.done) {
                    if (querySnapshot.hasData) {
                      List<Map<String, dynamic>> donors = querySnapshot.data!;
                      if (donors.isNotEmpty) {
                        return ListView.builder(
                          itemCount: donors.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(donors[index]['name']),
                              subtitle: Text('Blood Group: ${donors[index]['blood_group']}, Location: ${donors[index]['location']}'),
                            );
                          },
                        );
                      } else {
                        return Center(child: Text('No donors found'));
                      }
                    } else if (querySnapshot.hasError) {
                      return Center(child: Text('Error: ${querySnapshot.error}'));
                    } else {
                      return Center(child: Text('No data found'));
                    }
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              );
            } else if (databaseSnapshot.hasError) {
              return Center(child: Text('Error: ${databaseSnapshot.error}'));
            } else {
              return Center(child: Text('No database found'));
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddDonorPage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}