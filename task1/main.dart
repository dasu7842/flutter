import 'package:flutter/material.dart';
import 'dashboard.dart';

void main() {
  runApp(MaterialApp(home: MyLoginForm(), debugShowCheckedModeBanner: false));
}

class MyLoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar(title: Text("Login Form")),
      body: Center(
        child: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<LoginForm>
{
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController confirmPass = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String gender = '';
  List<String> hobbies = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.all(25.00),
        child: Column(
          children: [
            TextFormField(
              controller: firstname,
              decoration: InputDecoration(hintText: "Enter Your First Name"),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter First Name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: lastname,
              decoration: InputDecoration(hintText: "Enter Your Last Name"),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter Last Name';
                }
                return null;
              },
            ),
            SizedBox(height: 25),
            TextFormField(
              controller: email,
              decoration: InputDecoration(hintText: "Enter Your Email"),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter Email';
                }
                return null;
              },
            ),
            SizedBox(height: 25),
            Row(
              children: [
                Text('Hobbies:'),
                Checkbox(
                  value: hobbies.contains('Reading'),
                  onChanged: (value) {
                    setState(() {
                      if (value != null && value) {
                        hobbies.add('Reading');
                      } else {
                        hobbies.remove('Reading');
                      }
                    });
                  },
                ),
                Text('Reading'),
                Checkbox(
                  value: hobbies.contains('cricket'),
                  onChanged: (value) {
                    setState(() {
                      if (value != null && value) {
                        hobbies.add('cricket');
                      } else {
                        hobbies.remove('cricket');
                      }
                    });
                  },
                ),
                Text('cricket'),
              ],
            ),
            SizedBox(height: 25),
            Row(
              children: [
                Text('Gender:'),
                Radio(
                  value: 'Male',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
                Text('Male'),
                Radio(
                  value: 'Female',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
                Text('Female'),
              ],
            ),
            TextFormField(
              controller: pass,
              decoration: InputDecoration(hintText: "Enter Your Password"),
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter Password';
                }
                return null;
              },
            ),
            SizedBox(height: 25),
            TextFormField(
              controller: confirmPass,
              decoration: InputDecoration(hintText: "Confirm Your Password"),
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please confirm Password';
                } else if (value != pass.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  String email1 = email.text.toString();
                  String pass1 = pass.text.toString();

                  if (email1 == "darshan@gmail.com" && pass1 == "1234") {
                    print("Logged in Successfully");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DashboardPage()));
                  } else {
                    print("Invalid Credentials");
                  }
                }
              },
              child: Text("Login"),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {

              },
              child: Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
