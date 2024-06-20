import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(home: MyaApp(),debugShowCheckedModeBanner: false,));
}

class MyaApp extends StatelessWidget {
  const MyaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar(
        title: Text("APPBAR",style: TextStyle(color: Colors.green),),backgroundColor: Colors.blue,
        actions: [
          IconButton(onPressed: ()
          {
            showDialog(context: context, builder: (context) {
              return AlertDialog
                (
                title: Text("Are you confirm to logout ?"),
                actions:
                [
                  ElevatedButton(onPressed: ()
                  {
                    Navigator.pop(context);
                  }, child: Text("No",style: TextStyle(color: Colors.orange),)),

                  ElevatedButton(onPressed: ()
                  {
                    SystemNavigator.pop();
                  }, child: Text("Yes",style: TextStyle(color: Colors.orange)))
                ],
              );
            },
            );
          }, icon:Icon(Icons.logout))
        ],
      ),
    );
  }
}
