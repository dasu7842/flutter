import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home:MyApp(),debugShowCheckedModeBanner: false,));
}

class MyApp extends StatefulWidget
{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{
  Color _selectedColor = Colors.white;

  void _changeColor(Color color) {
    setState(() {
      _selectedColor = color;
    });
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar(title: Text('color change'),),
        backgroundColor: Colors.yellow,
        body: Container
          (
             color: _selectedColor,
             child: Center
               (
                 child: Column
                   (
                     mainAxisAlignment: MainAxisAlignment.start,
                   children:
                   [
                     RadioListTile(
                       title: Text('red'),
                       value: Colors.redAccent,
                       groupValue: _selectedColor,
                       onChanged: (Color? value) {
                         _changeColor(value!);
                       },
                     ),
                     RadioListTile(
                       title: Text('green'),
                       value: Colors.greenAccent,
                       groupValue: _selectedColor,
                       onChanged: (Color? value) {
                         _changeColor(value!);
                       },
                     ),
                     RadioListTile(
                       title: Text('Yellow'),
                       value: Colors.yellow,
                       groupValue: _selectedColor,
                       onChanged: (Color? value) {
                         _changeColor(value!);
                       },
                     ),
                   ],
                   ),
               ),
          ),
      );
  }
}
