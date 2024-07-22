import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Bank',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SearchDonorsPage(),
    );
  }
}

class SearchDonorsPage extends StatefulWidget {
  @override
  _SearchDonorsPageState createState() => _SearchDonorsPageState();
}

class _SearchDonorsPageState extends State<SearchDonorsPage> {
  late Future<Database> _database;
  List<Map<String, dynamic>> _donors = [];
  String _searchQuery = '';

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

  void _updateSearchQuery(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Donors'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(56.0),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              onChanged: _updateSearchQuery,
              decoration: InputDecoration(
                hintText: 'Search by name or blood group',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ),
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
                      _donors = querySnapshot.data!;
                      // Filter donors based on the search query
                      List<Map<String, dynamic>> filteredDonors = _donors.where((donor) {
                        return donor['name'].toLowerCase().contains(_searchQuery.toLowerCase()) ||
                            donor['blood_group'].toLowerCase().contains(_searchQuery.toLowerCase());
                      }).toList();

                      if (filteredDonors.isNotEmpty) {
                        return ListView.builder(
                          itemCount: filteredDonors.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(filteredDonors[index]['name']),
                              subtitle: Text('Blood Group: ${filteredDonors[index]['blood_group']}, Location: ${filteredDonors[index]['location']}'),
                            );
                          },
                        );
                      } else
                      {
                        return Center(child: Text('No donors found'));
                      }
                    } else if (querySnapshot.hasError)
                    {
                      return Center(child: Text('Error: ${querySnapshot.error}'));
                    } else
                    {
                      return Center(child: Text('No data found'));
                    }
                  } else
                  {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              );
            } else if (databaseSnapshot.hasError)
            {
              return Center(child: Text('Error: ${databaseSnapshot.error}'));
            } else
            {
              return Center(child: Text('No database found'));
            }
          } else
          {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}