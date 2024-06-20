import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'main.dart';
class addpage extends StatefulWidget {
  const addpage({super.key});

  @override
  State<addpage> createState() => _addpageState();
}

class _addpageState extends State<addpage> {

  TextEditingController name=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar(title: Text('add page'),),backgroundColor: Colors.cyan,
      body: Center
        (
        child: Column
          (
          children:
          [
            TextFormField
              (
              controller: name,
              decoration: InputDecoration
                (
                label: Text('Enter a name'),
                border: OutlineInputBorder(),

              ),
            ),
            SizedBox(height: 10,),

            ElevatedButton(

                onPressed: ()
                {
                  _insert();
                  print("Inserted");
                  Navigator.push(context,MaterialPageRoute(builder: (context) => MyApp()));
                },
                child: Text('INSERT',style: TextStyle(fontSize: 20,color: Colors.green),))
          ],
        ),
      ),
    );
  }

  void _insert()
  {
    var url = Uri.parse("https://darshan7842.000webhostapp.com/api78/insert.php");
    http.post(url,body:
    {
      "name":name.text.toString(),
    });
  }
}
