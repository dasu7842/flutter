import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

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
    _loadDonors();
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'blood_bank.db');
    return openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS donors (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        blood_group TEXT,
        location TEXT
      )
    ''');
  }

  Future<void> _loadDonors() async {
    final database = await _database;
    final donors = await database.query('donors');
    setState(() {
      _donors = donors;
    });
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
      body: _donors.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _donors.length,
        itemBuilder: (context, index) {
          if (_searchQuery.isEmpty) {
            return ListTile(
              title: Text(_donors[index]['name'] ?? ''),
              subtitle: Text(
                  'Blood Group: ${_donors[index]['blood_group'] ?? ''}, Location: ${_donors[index]['location'] ?? ''}'),
            );
          } else if ((_donors[index]['name'] ?? '')
              .toLowerCase()
              .contains(_searchQuery.toLowerCase()) ||
              ((_donors[index]['blood_group'] ?? '')
                  .toLowerCase()
                  .contains(_searchQuery.toLowerCase()))) {
            return ListTile(
              title: Text(_donors[index]['name'] ?? ''),
              subtitle: Text(
                  'Blood Group: ${_donors[index]['blood_group'] ?? ''}, Location: ${_donors[index]['location'] ?? ''}'),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
