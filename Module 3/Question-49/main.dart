import 'package:flutter/material.dart';
import 'package:q_49/secondscrren.dart';

void main() {
  runApp(MaterialApp( home: secondscrren(),debugShowCheckedModeBanner: false,));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text('Screen'),),
      body: Center
        (
         child: SingleChildScrollView(
           child: Column
           
             (
             children:
             [
               Container
                 (
                 color: Colors.red,height: 250,
               ),
               SizedBox(height: 10,),
               Container(
                 child: GridView.count
                   (
                     crossAxisCount: 2,
                     mainAxisSpacing: 4.0,
                     crossAxisSpacing: 4.0,
                     physics: NeverScrollableScrollPhysics(),
                     shrinkWrap:true ,
                   children: List.generate(4, (index)
                   {
                     return Container(
                       color: Colors.blue,height: 150,
                     );
                     
                   }),
           
                 ),
               ),
               SizedBox(height: 10,),
               Container(
                 child: GridView.count
                   (
                   crossAxisCount: 3,
                   mainAxisSpacing: 4.0,
                   crossAxisSpacing: 4.0,
                   shrinkWrap:true ,
                   children: List.generate(9, (index)
                   {
                     return Container(
                       color: Colors.yellow,height: 150,
                     );
           
                   }),
           
                 ),
               )
           
             ],
           ),
         ),
      ),
    );
  }
}
