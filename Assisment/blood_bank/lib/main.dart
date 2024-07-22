import 'package:flutter/material.dart';

import 'homepage.dart';

void main()
{
  runApp(MaterialApp
    (
theme: ThemeData
  (
  fontFamily:AutofillHints.language,
  primarySwatch: Colors.red
),
  debugShowCheckedModeBanner: false,
  home: homepage(),
  ));
}

