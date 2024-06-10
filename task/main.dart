import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _mobilenumber;
  String? _password;
  String? _confirmPassword;
  bool _isMale = false;
  bool _isFemale = false;
  List<String> _hobbies = ['Cricket', 'Hockey', 'Tennis', 'Reading'];
  Map<String, bool> _selectedHobbies = {};
  List<String> _cities = ['Rajkot', 'Botad', 'Ahmadabad', 'Vadodara', 'Surat'];
  String? _selectedCity;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState()
  {
    super.initState();
    for (String hobby in _hobbies) {
      _selectedHobbies[hobby] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar(
        title: Text('Sign Up', style: TextStyle(fontWeight: FontWeight.bold)),
         backgroundColor: Colors.red[100],
      ),
      body: Stack
        (
        children:
        [
          Positioned.fill(
            child: Image.asset( 'assets/img.jpg',fit: BoxFit.cover)
          ),

          SingleChildScrollView
            (
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'First Name',
                      hintText: 'Enter first name',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.greenAccent[70]
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _firstName = value;
                    },
                  ),

                  SizedBox(height: 18.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Last Name',
                      hintText: 'Enter last name',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.greenAccent[70]
                    ),
                    validator: (value)
                    {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _lastName = value;
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter email',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                      filled: true,
                      fillColor: Colors.greenAccent[70]
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value;
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Mobile Number',
                      hintText: 'Enter mobile number',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.greenAccent[70],
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a mobile number';
                      }
                      if (value.length != 10) {
                        return 'Mobile number must be 10 digits';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _mobilenumber = value;
                    },
                  ),
                  SizedBox(height: 16.0),
                  Text('Hobbies', style: TextStyle(fontWeight: FontWeight.bold)),
                  Column(
                    children: _hobbies.map((hobby) {
                      return CheckboxListTile(
                        title: Text(hobby),
                        value: _selectedHobbies[hobby],
                        onChanged: (value) {
                          setState(() {
                            _selectedHobbies[hobby] = value!;
                          });
                        },
                        activeColor: Colors.greenAccent[70],
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16.0),
                  Text('Gender', style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    children:
                    [
                      Expanded(
                        child: ListTile(
                          title: const Text('Male', style: TextStyle(fontWeight: FontWeight.bold)),
                          leading: Radio<bool>(
                            value: true,
                            groupValue: _isMale,
                            onChanged: (value) {
                              setState(() {
                                _isMale = value!;
                                _isFemale = !value;
                              });
                            },
                            activeColor: Colors.greenAccent[70],
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: const Text('Female', style: TextStyle(fontWeight: FontWeight.bold)),
                          leading: Radio<bool>(
                            value: true,
                            groupValue: _isFemale,
                            onChanged: (value) {
                              setState(() {
                                _isFemale = value!;
                                _isMale = !value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Select City',
                      hintText: 'Please select a city',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.greenAccent[70]
                    ),
                    items: _cities.map((String city) {
                      return DropdownMenuItem<String>(
                        value: city,
                        child: Text(city),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedCity = newValue;
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Please select a city';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 18.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter password',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.greenAccent[70]
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      return null;
                    },
                    obscureText: true,
                    onSaved: (value) {
                      _password = value;
                    },
                  ),
                  SizedBox(height: 18.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      hintText: 'Confirm your password',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.greenAccent[70]
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != _password) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    obscureText: true,
                    onSaved: (value) {
                      _confirmPassword = value;
                    },
                  ),
                  SizedBox(height: 30.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      child: Text('Sign Up', style: TextStyle(fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(10)
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      child: Text('Log In', style: TextStyle(fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _submitForm()
  {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      print('First Name: $_firstName');
      print('Last Name: $_lastName');
      print('Email: $_email');
      print('Mobile Number: $_mobilenumber');
      List<String> selectedHobbies = [];
      _selectedHobbies.forEach((key, value) {
        if (value) {
          selectedHobbies.add(key);
        }
      });
      print('Hobbies: $selectedHobbies');
      print('City: $_selectedCity');
      print('Gender: ${_isMale ? 'Male' : 'Female'}');
      print('Password: $_password');
    }
  }
}
