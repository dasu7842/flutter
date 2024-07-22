import 'package:flutter/material.dart';

class BloodRequest extends StatefulWidget {
  const BloodRequest({super.key});

  @override
  State<BloodRequest> createState() => _BloodRequestState();
}

class _BloodRequestState extends State<BloodRequest> {
  final _formKey = GlobalKey<FormState>();
  String? _bloodType;
  int? _quantity;
  String? _message;

  void _submitRequest() {
    if (_formKey.currentState!.validate()) {
      // Here you can handle the submission logic, such as sending the request to a server
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Blood request submitted!')),
      );
      // Optionally, reset the form
      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blood Request'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Blood Type',border: OutlineInputBorder()),
                value: _bloodType,
                items: [
                  'A+',
                  'A-',
                  'B+',
                  'B-',
                  'AB+',
                  'AB-',
                  'O+',
                  'O-',
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
              SizedBox(height: 20,),

              TextFormField(
                decoration: InputDecoration(labelText: 'Quantity',border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  _quantity = int.tryParse(value);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a quantity';
                  }
                  if (int.tryParse(value) == null || int.parse(value) <= 0) {
                    return 'Please enter a valid quantity';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20,),

              TextFormField(
                decoration: InputDecoration(labelText: 'Name',border: OutlineInputBorder()),
                onChanged: (value) {
                  _message = value;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton
                (
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: _submitRequest,
                child:Text('Send Request'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}