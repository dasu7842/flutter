/*create an application to change background when button is clicked*/

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: (MyApp()),debugShowCheckedModeBanner: false,));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Color backgroundcolor = Colors.white;

  void backgroundcolorChange(){
    setState(() {
      backgroundcolor = Colors.red;

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
         appBar: AppBar(title: Text('Background color'),backgroundColor: Colors.blue,),


        body: Container(
          color: backgroundcolor,
    child: Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children:
    [
    ElevatedButton(onPressed: backgroundcolorChange, child: Text('Change Color')),
    SizedBox(height: 20,),

    ]
        )

        )
    )
    );
  }
}
