import 'package:flutter/material.dart';

class nextscreen extends StatefulWidget {

  int index;
  nextscreen({required this.index});

  @override
  State<nextscreen> createState() => _secondscreenState();
}

class _secondscreenState extends State<nextscreen> {

  late int data;
  late String title,subtitle,trailing;
  late var leading;

  @override

  void initState() {
    // TODO: implement initState
    data = widget.index;

    if(data==0)
    {
      leading = "assets/profile1.png";
      title = "Darshan Zapadiya";
      subtitle = "Resume";
      trailing = "13 April";
    }

    if(data==1)
    {
      leading = "assets/profile.png";
      title = "Jenil Dobariya";
      subtitle = "CEO";
      trailing = "16 April";
    }

    if(data==2)
    {
      leading = "assets/profile.png";
      title = "Groww";
      subtitle = "Urgent declare annual income again";
      trailing = "19 April";
    }

    if(data==3)
    {
      leading = "assets/profile.png";
      title =  "Angel one";
      subtitle = "Your Equity portfolio is here";
      trailing = "20 April";
    }

    if(data==4)
    {
      leading = "assets/profile.png";
      title = "Microsoft account team";
      subtitle =  "Microsoft account security code";
      trailing = "2 June";
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              Image.asset(leading,width: double.infinity,height: 250,),
              Text(title,style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),
              Text(subtitle,style: TextStyle(fontSize: 40,fontWeight: FontWeight.w800)),
              Text(trailing,style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800))
            ],
          ),
        ),
      ),
    );
  }
}