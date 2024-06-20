import 'package:flutter/material.dart';

import 'SecondScreen.dart';

void main() {
  runApp(MaterialApp(home: MyApp(),debugShowCheckedModeBanner: false,) );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController num1=TextEditingController();
  TextEditingController num2=TextEditingController();
  double _sum=0;

  void _result()
  {
    double number1=double.tryParse(num1.text) ?? 0;
    double number2=double.tryParse(num2.text) ?? 0;

    setState(() {
      _sum =number1+number2;
    });
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SecondScreen(sum:_sum)));

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold
      (
       appBar: AppBar(title: Text('Summation App'),backgroundColor: Colors.blue,),
       body: Center
         (
          child: Column
            (
             mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              TextFormField
                (
                controller: num1,
                decoration: InputDecoration(hintText: "Enter a 1st number",border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10,),

              TextFormField
                (
                 controller: num2,
                decoration: InputDecoration(hintText: "Enter a second number",border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
              ),
              ElevatedButton(onPressed: ()
              {
                _result();
                },child: Text('Sum',style: TextStyle(color: Colors.green),))
            ],
          ),
       ),
    );
  }
}
