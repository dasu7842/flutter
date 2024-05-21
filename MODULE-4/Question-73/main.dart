//Write a code to display Splash Screen using Activity
import 'dart:async';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'splashscreen.dart';

void main()
{
  runApp( MaterialApp(home:MyApp(),debugShowCheckedModeBanner: false,));
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    Timer(
      Duration(seconds: 10),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => splashscreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Lottie.asset("assets/animation.json",height: 600,width: 600)
          ],
        ),
      ),
    );
  }
}


