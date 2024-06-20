import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
    return Scaffold(
      appBar: AppBar(title: Text("Toast Message"),backgroundColor: Colors.blue,),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            MaterialButton(
              shape: OutlineInputBorder(),
              color: Colors.yellow,
              onPressed: (){
                Fluttertoast.showToast(msg: "Positive button pressed",);
              },child: Text("Positive",style: TextStyle(color: Colors.red),),),

            SizedBox(width: 10,),

            MaterialButton(
              shape: OutlineInputBorder(),
              color: Colors.yellow,
              onPressed: (){
                Fluttertoast.showToast(msg: "Neutral button pressed");
              },child: Text("Neutral",style: TextStyle(color: Colors.blue),),),

            SizedBox(width: 10,),

            MaterialButton(
              shape: OutlineInputBorder(),
              color: Colors.yellow,
              onPressed: (){
                Fluttertoast.showToast(msg: "Negative button pressed ");
              },child: Text("Negative",style: TextStyle(color: Colors.orange),),),

          ],
        ),
      ),
    );
  }
}