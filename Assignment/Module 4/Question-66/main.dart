import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home:MyApp(),debugShowCheckedModeBanner: false,) );
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
       appBar: AppBar(title: Text('Date Picker',style: TextStyle(color: Colors.blue),),),
      body: Center(
        child: TextField(
          controller: date,
          readOnly: true,
          decoration: InputDecoration
            (
              hintText: "Select Date",
              prefixIcon: IconButton(onPressed: ()
              {
                showDatePicker(context: context, firstDate: DateTime(1980), lastDate: DateTime(2050)).then((value) {
                  date.text = value.toString();
                });
              }, icon: Icon(Icons.calendar_month))
          ),
        ),
      ),
    );
  }
}


