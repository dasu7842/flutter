import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AddDonorPage extends StatefulWidget {
  @override
  _AddDonorPageState createState() => _AddDonorPageState();
}

class _AddDonorPageState extends State<AddDonorPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  String? _bloodType;
  String? _location;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Donor'),
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(18.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name', border: OutlineInputBorder()),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Blood Type', border: OutlineInputBorder()),
                value: _bloodType,
                items: [
                  'A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-',
                ].map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _bloodType = value;
                  });
                },
                validator: (value) => value == null ? 'Please select a blood type' : null,
              ),
              SizedBox(height: 15),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Location', border: OutlineInputBorder()),
                value: _location,
                items: [
                  'Surendranagar', 'Botad', 'Vadodara', 'Surat', 'Rajkot', 'Ahmedabad', 'Jamnagar', 'Gandhinagar',
                ].map((loc) {
                  return DropdownMenuItem(
                    value: loc,
                    child: Text(loc),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _location = value;
                  });
                },
                validator: (value) => value == null ? 'Please select a location' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async
                {
                  if (_formKey.currentState!.validate()) {
                    final database = await _initDatabase();
                    int donorId = await database.insert('donors', {
                      'name': nameController.text,
                      'blood_group': _bloodType,
                      'location': _location,
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Donor details added with ID $donorId')),
                    );

                    nameController.clear();
                    setState(() {
                      _bloodType = null;
                      _location = null;
                    });
                    Navigator.pop(context); // Go back to ViewAllDonors
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: Text('Add Donor', style: TextStyle(fontWeight: FontWeight.w800)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'blood_bank.db');
    return openDatabase(path, version: 1);
  }
}