import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'details.dart';

class Model extends StatelessWidget
{
  late List list;
  Model({required this.list});

  @override
  Widget build(BuildContext context)
  {
    return ListView.builder
      (
        itemCount: list.length,
        itemBuilder: (context,i)
        {
          return ListTile
            (
            title:
            Column(children:
            [

              Text(list[i]["name"],style: TextStyle(fontWeight: FontWeight.bold),),


            ],),

            onTap: ()
            {
              Navigator.push(context,MaterialPageRoute(builder: (context) => Details(list:list,index:i)));
            },
          );
        });
  }


}