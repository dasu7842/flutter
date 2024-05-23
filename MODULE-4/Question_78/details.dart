import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'edit.dart';
import 'main.dart';

class Details extends StatefulWidget
{

  late List list;
  late int index;

  Details({required this.list,required this.index});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text("Update"),),
      body: Center
        (
        child: Column
          (
          children:
          [
            Text(
              widget.list[widget.index]['name'],
              style: TextStyle(fontSize: 20.0),
            ),

            MaterialButton(
              child: Text("Edit"),
              color: Colors.yellowAccent,
              onPressed: ()
              {
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> Edit(list:widget.list,index:widget.index)));
              },
            ),

            MaterialButton(
                child: Text("Delete"),
                color: Colors.deepPurpleAccent,
                onPressed: ()
                {

                  deletealert();
                }
            )
          ],
        ),
      ),
    );
  }

  void confirm()
  {
    var url = "https://darshan7842.000webhostapp.com/api78/delete.php";
    http.post(Uri.parse(url),body:
    {
      'id':widget.list[widget.index]['id'],

    });
    Navigator.of(context).push
      (MaterialPageRoute(builder: (BuildContext context)=> MyApp()));
  }

  void deletealert()
  {
    showDialog(context: context, builder: (BuildContext context)
    {
     return AlertDialog
        (
         title: Text('Delete Alert'),
         content: Text("Are you sure want to delete ?"),
       actions:
       [
         MaterialButton(onPressed: (){
           Navigator.of(context).pop();
         },
        child: Text('No'),
         ),

         MaterialButton(onPressed: ()
         {
           confirm();
         },
           child: Text('Yes'),
         )


       ],
      );
    });

  }
}