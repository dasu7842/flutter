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
    @override
    Widget build(BuildContext context) {
      return Scaffold
        (
         appBar: AppBar(title: Text('show images '),),
        body:Center
          (
          child: Column
          (
          children:
          [

             Row
              ( mainAxisAlignment: MainAxisAlignment.center,
              children:
              [
                Image.asset('assets/images3.jpg',width: 100,height: 100,),
                SizedBox(width: 20,),

                Image.asset('assets/images3.jpg',width: 100,height: 100,),

              ],
              ),
            SizedBox(height: 40,),
          Text('Textview',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 30,color: Colors.redAccent),),
          SizedBox(height: 20,),

             Row( mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              Image.asset('assets/images3.jpg',width: 100,height: 100,),
              SizedBox(width: 20,),
              Image.asset('assets/images3.jpg',width: 100,height: 100,),


               ],
            ),
    ]
        ),
      ),
        );
    }
  }
