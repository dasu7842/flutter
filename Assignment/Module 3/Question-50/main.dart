/*  Create an application to take input number from user and print its
reverse number in TextField */
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: 'Reverse Number App',

      home: ReverseNumberScreen(),debugShowCheckedModeBanner: false,
    );
  }
}

class ReverseNumberScreen extends StatefulWidget {
  @override
  _ReverseNumberScreenState createState() => _ReverseNumberScreenState();
}

class _ReverseNumberScreenState extends State<ReverseNumberScreen> {
  TextEditingController _numberController = TextEditingController();
  String _reversedNumber = '';
  Color backgroundcolor=Colors.red;

  void _reverseNumber() {
    setState(() {
      String number = _numberController.text;
      String reversed = number.split('').reversed.join('');
      _reversedNumber = reversed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reverse Number'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter your number',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton( // Changed from RaisedButton to ElevatedButton
              onPressed: _reverseNumber,
              child: Text('Reverse'),
            ),
            SizedBox(height: 20),
            Text(
              'Reversed Number: $_reversedNumber',
              style: TextStyle(fontSize: 30),
            ),


          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }
}
