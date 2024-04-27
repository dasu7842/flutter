/*Create an application to input 2 numbers from user and all numbers
 between those 2 numbers in next activity*/
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp(),debugShowCheckedModeBanner: false
    ,));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  TextEditingController num1=TextEditingController();
  TextEditingController num2=TextEditingController();
  List<double> numbers=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
       appBar: AppBar(title: Text("'Project 3"),backgroundColor: Colors.red,),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children:
            [
              TextFormField(controller: num1,decoration: InputDecoration(label: Text("Enter a Number 1"),border: OutlineInputBorder(),prefixIcon: Icon(Icons.numbers),),),
              SizedBox(height: 15,),
          
              TextFormField(controller: num2,decoration: InputDecoration(label: Text("Enter a Number 2"),border: OutlineInputBorder(),prefixIcon: Icon(Icons.numbers),),),
              SizedBox(height: 15,),
          
              ElevatedButton(onPressed: ()
              {
                setState(()
                {
                  numbers.clear();
                  double firstnumber=double.parse(num1.text);
                  double secondnumber=double.parse(num2.text);
                  for(double i=firstnumber+1;i<secondnumber;i++)
                    {
                      numbers.add(i);
                    }
          
                });
              }, child: Text("Ok")),
              Text('output:${numbers.toString()}')
          
          
            ],
          ),
        ),
      ),
    );
  }
}
