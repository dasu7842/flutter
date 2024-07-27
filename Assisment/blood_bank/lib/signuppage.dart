import 'package:flutter/material.dart';
import 'dbHelper.dart';
import 'loginpage.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _ageController = TextEditingController();
  final _passwordController = TextEditingController();
  final _databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        backgroundColor: Colors.red,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center the form
              children:
              [
                Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: Image.asset(
                    'assets/blood.png',
                    height: 100,
                    width: 100,
                  ),
                ),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username',border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _ageController,
                  decoration: InputDecoration(labelText: 'Age',border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a Age';
                    }
                    return null;
                  },
                ),
              SizedBox(height: 20),

              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password',border: OutlineInputBorder()),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _signUp,
                child: Text('Sign Up'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
              )
           ]
          ),
        ),
      ),
    );
  }

  void _signUp() async
  {
    if (_formKey.currentState!.validate()) {
      await _databaseHelper.insertUser({
        'username': _usernameController.text,
        'password': _passwordController.text,
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }
  }
}
