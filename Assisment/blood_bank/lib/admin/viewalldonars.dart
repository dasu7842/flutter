import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class ViewDonorPage extends StatefulWidget {
  const ViewDonorPage({super.key});

  @override
  State<ViewDonorPage> createState() => _ViewDonorPageState();
}

class _ViewDonorPageState extends State<ViewDonorPage> {
  List<Map<String, dynamic>> _donors = [];

  @override
  void initState() {
    super.initState();
    _loadDonors();
  }

  Future<void> _loadDonors() async {
    final database = await openDatabase('blood_bank.db');

    final List<Map<String, dynamic>> donors = await database.query('donors');

    setState(() {
      _donors = donors;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Donors',style: TextStyle(fontWeight: FontWeight.w800),),
        backgroundColor: Colors.blue,
      ),
      body: _donors.isEmpty
          ? Center(child: Text('No donors found'))
          : ListView.builder(
        itemCount: _donors.length,
        itemBuilder: (context, index) {
          final donor = _donors[index];
          return ListTile(
            title: Text('Donor ID: ${donor['id']}'),
            subtitle: Text('Name: ${donor['name']} - Blood Group: ${donor['bloodGroup']} - Location: ${donor['location']}'),
          );
        },
      ),
    );
  }
}