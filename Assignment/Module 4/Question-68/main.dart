import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MenuContextState();
}

class _MenuContextState extends State<MyApp> {
  List<String> menu = ['pizza', 'burger', 'samosa', 'kachori', 'momos'];

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar
        (
        title: Text("Context Menu"),backgroundColor: Colors.blue,
      ),
      body: ListView.builder(

        itemCount: menu.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(menu[index]),
            onLongPress: () {
              _showMenu(context, menu[index],);
            },
          );
        },
      ),
    );
  }

  void _showMenu(BuildContext context, String item, ) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container
          (
          child: Column
            (
            mainAxisSize: MainAxisSize.min,
            children:
            [
              ListTile(
                leading: Icon(Icons.edit),
                title: Text('Edit'),
                onTap: () {
                  print('Edit: $item');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.visibility),
                title: Text('View'),
                onTap: ()
                {
                  print('View: $item');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.delete),
                title: Text('Delete'),
                onTap: ()
                {
                  setState(() {
                    menu.remove(item);
                  });
                  print('Delete: $item');
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
