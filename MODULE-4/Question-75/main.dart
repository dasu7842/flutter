import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState()
  {
    super.initState();
    toastmessage("onCreate");
  }

  @override
  void didChangeDependencies()
  {
    super.didChangeDependencies();
    toastmessage("onStart");
  }

  @override
  void deactivate()
  {
    toastmessage("onPause");
    super.deactivate();
  }

  @override
  void dispose()
  {
    toastmessage("onDestroy");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar
        (
        title: Text("Life Cycle",
          style: TextStyle(color: Colors.blue),)
      ),
      body: Center
        (
        child: ElevatedButton
          (
          onPressed: () {},
          child: Text(
            "activity",
            style: TextStyle(color: Colors.red),
          ),
        ),
      ),
    );
  }

  void toastmessage(String message)
  {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM_RIGHT,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }
}
