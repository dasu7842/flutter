import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp(),debugShowCheckedModeBanner: false,));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isChecked=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
        appBar: AppBar(title: Text('textview',style: TextStyle(color: Colors.red),),),
        body: Center
          (
          child: Column
            (
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              Checkbox
                (
                  value: _isChecked, onChanged: (bool?value)
              {
                setState(()
                {
                  _isChecked=value??false;
                });
              }
              ),
              if(_isChecked)


                  Text('Textview displayed', style: TextStyle(
                      fontSize: 50, fontWeight: FontWeight.bold))



            ],

          ),

          )


    );
  }
}
