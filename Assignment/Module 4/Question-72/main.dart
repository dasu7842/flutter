import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MaterialApp(home: MyApp(),debugShowCheckedModeBanner: false,) );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{
  void initState() {
    super.initState();
    Permissions();
  }
  Future<void> Permissions() async
  {
    var status = await Permission.phone.request();
    if (status.isDenied) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Request for permission"),
            content: Text("Grant Permissiones for phone call"),
            actions:
            [
              TextButton(child: Text("Deny",style: TextStyle(color: Colors.red),),

                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(child: Text("Allow",style: TextStyle(color: Colors.green),),
                onPressed: () async {
                  await openAppSettings();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar(title: Text('Phone App'),),
      body: Center
        (
        child: Text('Permissin for phone',style: TextStyle(color: Colors.blue),),

      ),
    );
  }
}
