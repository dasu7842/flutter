import 'package:flutter/material.dart';
import 'nextscreen.dart';


void main() {
  runApp(MaterialApp(home: myapp(),debugShowCheckedModeBanner: false,));
}

class myapp extends StatefulWidget {
  const myapp({super.key});

  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {

  List<String> name =
  [
    "Darshan zapadiya",
    "Jenil dobariya",
    "Groww",
    "Angel one",
    "Microsoft account team"
  ];

  List<String> subject =
  [
    "Resume",
    "CEO",
    "Urgent declare annual income again",
    "Your Equity portfolio is here",
    "Microsoft account security code"
  ];

  List<String> date =
  [
    "13 April",
    "16 April",
    "19 April",
    "20 April",
    "2 june",
  ];

  List<String> img =
  [
    "assets/profile1.png",
    "assets/profile1.png",
    "assets/profile1.png",
    "assets/profile1.png",
    "assets/profile1.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Email"),backgroundColor: Colors.blueGrey,),
      body: Container(
        margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: ListView.builder(
            itemCount: name.length,
            itemBuilder: (context,index){
              return Card
                (
                child: ListTile
                  (
                  leading: Image.asset(img[index]),
                  title: Text(name[index],style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text(subject[index]),
                  trailing: Container(
                    child: Column(
                      children:
                      [
                        Text(date[index]),
                        SizedBox(height: 5,),
                        Icon(Icons.star_border_purple500_sharp),
                      ],
                    ),
                  ),

                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => nextscreen(index: index)));
                  },
                ),
              );
            }),
      ),
    );
  }
}


