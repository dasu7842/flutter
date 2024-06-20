import 'package:flutter/material.dart';
import 'package:q_74/screen.dart';


void main() {
  runApp(MaterialApp(home: MyApp(),debugShowCheckedModeBanner: false,));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar(title: Text('main screen'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Text("Main Screen",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,wordSpacing: 5.0),),

            SizedBox(height: 20,),

            MaterialButton(
              color: Colors.redAccent,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => scrren()));
              },child: Text("Go to next Page"),
            ),
          ],
        ),
      ),
    );
  }
}

