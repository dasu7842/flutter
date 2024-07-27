import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DeleteDonarPage extends StatefulWidget {
  const DeleteDonarPage({super.key});

  @override
  State<DeleteDonarPage> createState() => _DeleteDonarPageState();
}

class _DeleteDonarPageState extends State<DeleteDonarPage>
{
  final _formKey = GlobalKey<FormState>();
  final TextEditingController idController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar(title: Text('Delete Donar',style: TextStyle(fontWeight: FontWeight.w800),),
      backgroundColor: Colors.blue,),
      body: Form
        (
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(18.0),
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
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final database = openDatabase(
                      join(await getDatabasesPath(), 'blood_bank.db'),
                    );

                    await database.then((db) {
                      db.delete(
                        'donors',
                        where: 'id = ?',
                        whereArgs: [int.parse(idController.text)],
                      );
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Donor deleted')),
                    );

                    idController.clear();
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: Text('Delete Donor',style: TextStyle(fontWeight: FontWeight.bold),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
