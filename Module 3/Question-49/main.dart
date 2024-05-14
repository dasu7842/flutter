import 'package:flutter/material.dart';
import 'package:q_49/firstscreen.dart';
import 'package:q_49/secondscrren.dart';

void main() {
  runApp(MaterialApp( home: MyApp(),debugShowCheckedModeBanner: false,));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text('Screen'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => firstscreen()));
            }, child: Text("screen 1")),

            SizedBox(height: 20,),

            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => secondscrren()));
            }, child: Text("screen 2")),
          ],
        ),
      ),
    );
  }
}
