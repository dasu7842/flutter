import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Model extends StatelessWidget
{
  late List list;

  Model({required this.list});

  @override
  Widget build(BuildContext context)
  {

      return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
        (
        crossAxisCount: 2,
      ),
          itemCount: list.length,
          itemBuilder: (context,index)
          {
            return Card(
              margin: EdgeInsets.all(15),
              color: Colors.red[100],
              child: ListTile
                (
                title: Text(list[index]['category_name']),
                subtitle:Image.network(list[index]['category_image'],width: double.infinity,),
              ),
            );
          }
      );


  }
}