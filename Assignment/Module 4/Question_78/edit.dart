import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

class Edit extends StatefulWidget
{
  late List list;
  late int index;

  Edit({required this.list,required this.index});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit>
{



  TextEditingController name = TextEditingController();


  @override
  void initState()
  {
    // TODO: implement initState
    // super.initState();

    name = TextEditingController(text: widget.list[widget.index]['name']);

  }


  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text("Index is ${widget.index}"),),
      body: Center
        (
        child: Column
          (
          children:
          [
            TextFormField(controller: name,decoration: InputDecoration(hintText: "Enter Your name"),),
            SizedBox(height: 10,),

            ElevatedButton(onPressed: ()
            {
              _updatedata();
              Navigator.push(context,MaterialPageRoute(builder: (context) => MyApp()));



            }, child: Text("Update"))
          ],
        ),
      ),
    );
  }

  void _updatedata()
  {
    var url = Uri.parse("https://darshan7842.000webhostapp.com/api78/update.php");
    http.post(url,body:
    {
      "id":widget.list[widget.index]['id'],
      "name":name.text.toString(),


    });
  }
}