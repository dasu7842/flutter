import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home:MyApp(),debugShowCheckedModeBanner: false ,) );
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{
  double redValue = 0.0;
  double greenValue = 0.0;
  double blueValue = 0.0;

  void _updateBackgroundColor()
  {
    setState(() {});
  }
  @override
  Widget build(BuildContext context)
  {
    {
      Color backgroundColor = Color.fromRGBO(
        redValue.toInt(),
        greenValue.toInt(),
        blueValue.toInt(),
        1.0,
      );
    return Scaffold
      (
        appBar: AppBar(title: Text('sick bar'),),
        body: Container
          (
            color: backgroundColor,
            padding: EdgeInsets.all(10.00),
            child: Column
              (
               mainAxisAlignment: MainAxisAlignment.center,
               children:
               [
                 Text('bg color'),
                 SizedBox(height: 20.0,),
                 Slider(
                   value: redValue,
                   min: 0.0,
                   max: 250.0,
                   onChanged: (value) {
                     setState(() {
                       redValue = value;
                       _updateBackgroundColor();
                     });
                   },
                 ),
                 Slider(
                   value: greenValue,
                   min: 0.0,
                   max: 250.0,
                   onChanged: (value) {
                     setState(() {
                       greenValue = value;
                       _updateBackgroundColor();
                     });
                   },
                 ),
                 Slider(
                   value: blueValue,
                   min: 0.0,
                   max: 250.0,
                   onChanged: (value) {
                     setState(() {
                       blueValue = value;
                       _updateBackgroundColor();
                     }
                     );
                   },
                 ),
               ],
            ),
        ),
    );
    }
  }
  }
