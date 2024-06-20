import 'package:flutter/material.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _MyAppState();
}

class _MyAppState extends State<splashscreen> {
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Welcome To Splash Screen",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40.0),)],
        ),
      ),
    );
  }
}