import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../login.dart';
import 'package:http/http.dart' as http;
import '../model.dart';


class UserDashboardScreen extends StatefulWidget
{
  const UserDashboardScreen({super.key});

  @override
  State<UserDashboardScreen> createState() => _UserDashboardScreenState();
}

class _UserDashboardScreenState extends State<UserDashboardScreen> {

  late SharedPreferences sharedPreferences;
  late String mob;
  List<dynamic> _data = [];

  @override
  void initState()
  {
    // TODO: implement initState
    //super.initState();
    initial();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(appBar: AppBar(title: Text("Welcome"),actions:
    [
      IconButton(onPressed: ()
      {
        sharedPreferences.setBool('project', true);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
      }, icon: Icon(Icons.logout))
    ],),
        body:RefreshIndicator(
          onRefresh: _pullRefresh,
          child:  FutureBuilder<List>
            (
            future: getdata(),
            builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot)
            {
              if(snapshot.hasData)
              {
                return Model(list:snapshot.data!!);
              }
              if(snapshot.hasError)
              {
                print('Network Not Found');
              }
              return CircularProgressIndicator();
            },
          ),)
    );
  }

  void initial()async
  {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      mob = sharedPreferences.getString('mob')!;
    });
  }

  Future<List> getdata() async
  {
    var resp = await http.get(Uri.parse("https://darshan7842.000webhostapp.com/project1/category_view.php"));
    return jsonDecode(resp.body);
  }

  Future<void> _pullRefresh()async
  {
    var resp = await http.get(Uri.parse("https://darshan7842.000webhostapp.com/project1/category_view.php"));
    List<dynamic> newData = jsonDecode(resp.body);
    setState(() {
      _data = newData;
    });
    return jsonDecode(resp.body);
  }
}