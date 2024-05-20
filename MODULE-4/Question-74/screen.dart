import 'package:flutter/material.dart';
import 'main.dart';

class scrren extends StatefulWidget {
  const scrren({super.key});

  @override
  State<scrren> createState() => _scrrenState();
}

class _scrrenState extends State<scrren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
       appBar: AppBar(title: Text('second screen'),),
      body: Center
        (
        child: Column
          (
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Text("Second Screen",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,wordSpacing: 5.0),),

            SizedBox(height: 25,),

            MaterialButton(
              color: Colors.redAccent,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
              },child: Text("Go to previous Page"),
            ),
          ],
        ),
      ),
    );
  }
}
