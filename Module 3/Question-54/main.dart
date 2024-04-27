/*create an application to increate font size when plus button click and
 decrease when minus button click*/

import 'package:flutter/material.dart';

void main() {
 runApp(MaterialApp(home: (MyApp()),debugShowCheckedModeBanner: false,));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{
  double current = 40.0;
  final min = 10;
  final max = 100;

  void increaseFontSize()
  {
    setState(() {
      if (current < max) {
        current += 2;
      }
    });
  }

  void decreaseFontSize()
  {
    setState(() {
      if (current > min) {
        current -= 2;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar(
        title: Text('Font Size'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Dasuu',style:TextStyle(fontSize: current,color: Colors.orange),),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [
                ElevatedButton(
                  onPressed: increaseFontSize,
                  child: Text('+'),
                ),
                SizedBox(width: 40.0),
                ElevatedButton(
                  onPressed: decreaseFontSize,
                  child: Text('-'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
