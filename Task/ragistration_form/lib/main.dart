
import 'package:flutter/material.dart';
import 'package:ragistration_form/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp
    (
      theme: ThemeData
        (
          fontFamily:AutofillHints.language,



      ),
      debugShowCheckedModeBanner: false,
      home:nextscreen()
  ));
}
