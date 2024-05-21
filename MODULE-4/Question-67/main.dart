import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp
      (
      debugShowCheckedModeBanner: false,
      home: OptionsMenu(),
    );
  }
}

class OptionsMenu extends StatelessWidget {
  const OptionsMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
       appBar: AppBar
         (
         actions:
         [
           IconButton(onPressed: (){}, icon: Icon(Icons.person)),
           IconButton(onPressed: (){SystemNavigator.pop();}, icon: Icon(Icons.logout))
         ],
       ),
    );
  }
}


