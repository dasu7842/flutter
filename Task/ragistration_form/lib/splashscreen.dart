import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'login.dart';

class nextscreen extends StatefulWidget
{
  const nextscreen({super.key});

  @override
  State<nextscreen> createState() => nextscreenState();
}

class nextscreenState extends State<nextscreen>
{

  @override
  void initState()
  {
    // TODO: implement initState
    super.initState();

    Timer
      (
        Duration(seconds: 4), () =>
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()))
    );
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      body: Center
        (
          child: Lottie.network
            (
              "https://darshan7842.000webhostapp.com/project1/splash.json",
              // width: 250,
              // height: 250
          )

      ),
    ) ;
  }
}