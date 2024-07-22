import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class UpdateDonarPage extends StatefulWidget {
  const UpdateDonarPage({super.key});

  @override
  State<UpdateDonarPage> createState() => _UpdateDonarPageState();
}

class _UpdateDonarPageState extends State<UpdateDonarPage>
{
  final _formKey = GlobalKey<FormState>();
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController bloodGroupController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
       appBar: AppBar(title: Text('Update Donar'),
       backgroundColor: Colors.blue,
       ),

      body: Form
        (
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: idController,
                decoration: InputDecoration(labelText: 'Donor ID',border: OutlineInputBorder()),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the donor ID';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name',border: OutlineInputBorder()),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: bloodGroupController,
                decoration: InputDecoration(labelText: 'Blood Group',border: OutlineInputBorder()),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the blood group';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: locationController,
                decoration: InputDecoration(labelText: 'Location',border: OutlineInputBorder()),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the location';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final database = openDatabase(
                      join(await getDatabasesPath(), 'blood_bank.db'),
                    );

                    await database.then((db) {
                      db.update(
                        'donors',
                        {
                          'name': nameController.text,
                          'blood_group': bloodGroupController.text,
                          'location': locationController.text,
                        },
                        where: 'id = ?',
                        whereArgs: [int.parse(idController.text)],
                      );
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Donor details updated')),
                    );

                    idController.clear();
                    nameController.clear();
                    bloodGroupController.clear();
                    locationController.clear();
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: Text('Update Donor'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
