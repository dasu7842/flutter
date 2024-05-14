import 'package:flutter/material.dart';

class secondscrren extends StatefulWidget {
  const secondscrren({super.key});

  @override
  State<secondscrren> createState() => _secondscrrenState();
}

class _secondscrrenState extends State<secondscrren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
        appBar: AppBar(title: Text('screen'),backgroundColor: Colors.redAccent,),
       body: Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
       child: SingleChildScrollView(
         child: Column(
           children: [
             Container(
               child: Image.asset("assets/lake.jpg",width:double.infinity,
         
               ),
             ),
             SizedBox(height: 20,),
             Container(
         
               child: Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
               child: Row
                 (
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:
                [
                  Column
                    (
                      children:
                      [
                        Text("Oeschinen Lake Campground",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.redAccent),),
                        Text("Switzerland")
                      ],
                    ),
                  Padding(padding: EdgeInsets.only(right: 20),
                  child: Row
                    (
                     children:
                     [
                      Icon(Icons.star,color: Colors.yellow,),
                      SizedBox(width: 10,),
                       Text("40")
                     ],
         
                    ),
                  ),
         
                ],
               ),
         
               ),
             ),
             SizedBox(height: 10,),
             Container(
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children:
                 [
                   Column(
                     children:
                     [
                       Icon(Icons.call,color: Colors.greenAccent),
                       Text("CALL",style: TextStyle(color: Colors.pink)),
                     ],
                   ),
         
                   Column(
                     children:
                     [
                       Icon(Icons.send_rounded,color: Colors.greenAccent),
                       Text("ROUTE",style: TextStyle(color: Colors.pink)),
                     ],
                   ),
         
                   Column(
                     children:
                     [
                       Icon(Icons.share,color: Colors.greenAccent),
                       Text("SHARE",style: TextStyle(color: Colors.pink)),
                     ],
                   )
                 ],
               ),
             ),
         
             Padding(padding: EdgeInsets.all(15.0),
               child: Text("Lake Oeschinen lies at the foot of the Bluemlisalp in the "
                   "Bernese Alps.Situated 1,578 meters above sea level, it is one "
                   "of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a "
                   "half-hour walk through pastures and pine forest, leads you to "
                   "the lake, which warms to 20 degress Celsius in the summer.Activities "
                   "enjoyed here include rowing, and riding the summer toboggan run.",style: TextStyle(fontWeight:FontWeight.bold),),
             ),
         
         
         
           ],
         ),
       ),

       ),


    );
  }
}
