import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home:MyApp(),debugShowCheckedModeBanner: false) );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{
  String selected = '';
  List<String> cities = ['Botad', 'Rajkot', 'Vadodara', 'Junagadh', 'Ahmadabad',];
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar(title: Text('City'),),
      body: Center
        (
        child: Column
          (
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            SizedBox(height: 60,),
            ElevatedButton(onPressed: () {
              showdialog(context);
            },
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
              child: Container(height: 45,
                decoration: BoxDecoration(
                  color: Colors.black,),
                child: Center(
                  child: Text("select name of cities",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800),),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text(selected,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800),)
          ],
          
        ),
      ),
    );
  }

  void showdialog(BuildContext context)
  {
    showDialog(
      context: context,
      builder: (BuildContext context)
      {
        return AlertDialog
          (
            title: Text('list of cities'),
            content: Container(
              width: double.maxFinite,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: cities.length,
                itemBuilder: (BuildContext context, int index)
                {
                  return ListTile
                    (
                    title: Text(cities[index]),
                    onTap: ()
                    {
                      setState(() {selected = cities[index];});
                      Navigator.of(context).pop();
                    },
                  );
                },
              ),
            )
        );
      },
    );
  }
}
