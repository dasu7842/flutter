
import 'package:flutter/material.dart';
import 'package:ragistration_form/splashscreen.dart';

void main()
{
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
