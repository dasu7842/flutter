import 'package:flutter/material.dart';
import '../dbHelper.dart';
import '../model.dart';

class UserBloodRequest extends StatefulWidget {
  @override
  _UserBloodRequestState createState() => _UserBloodRequestState();
}

class _UserBloodRequestState extends State<UserBloodRequest> {
  final _formKey = GlobalKey<FormState>();
  String? _bloodType;
  int? _quantity;
  String? _message;

  void _submitRequest() async {
    if (_formKey.currentState!.validate()) {
      final request = BloodRequestModel(
        bloodType: _bloodType!,
        quantity: _quantity!,
        message: _message ?? '',
      );

      final dbHelper = DatabaseHelper();
      await dbHelper.insertRequest(request);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Blood request submitted!')),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Request Blood'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Blood Type',
                  border: OutlineInputBorder(),
                ),
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
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Quantity',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  _quantity = int.tryParse(value);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a quantity';
                  }
                  if (int.tryParse(value) == null || int.parse(value)! <= 0) {
                    return 'Please enter a valid quantity';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Message (optional)',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  _message = value;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitRequest,
                child: Text('Send Request'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
