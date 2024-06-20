/* Write a code to display simple alert dialog with title, description and
icon when button is clicked */

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home:MyApp(),debugShowCheckedModeBanner: false,) );
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
      appBar: AppBar(title: Text('Dialog',style: TextStyle(color: Colors.orange),),backgroundColor: Colors.blue,),
      body: Center(
        child:
        Padding(
          padding: EdgeInsets.all(20.0),
          child: ElevatedButton(onPressed: ()
          {
            showdialog(context);
          },
            child: Container
              (height: 60,
              decoration: BoxDecoration(
                color: Colors.redAccent,),
              child: Center(
                child: Text("Show Dialog",style: TextStyle(color: Colors.black,),),
              ),
            ),
          ),
        ),
       ),
    );
  }
}

void showdialog(BuildContext context)
{
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Dialog Open'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Discription'),
              Text('add your data'),
            ],
          ),
        ),
        actions: [
          TextButton(child: Text('close',style: TextStyle(color: Colors.blue),), onPressed: ()
          {
            Navigator.of(context).pop();
          },
          ),
        ],
      );
    },
  );
}

