import 'package:flutter/material.dart';
import 'Audio.dart';
import 'Gallery.dart';
import 'vidio.dart';

void main() {
  runApp(MaterialApp(home:MyApp(),debugShowCheckedModeBanner: false,) );
}
class MyApp extends StatefulWidget
{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{

  List screens = [gallery(), video(),audio()];
  int selectedIndex = 0;

  void _onItemTapped(int index)
  {
    setState(()
    {
      selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar(
        title: Text('Contact List'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: screens[selectedIndex],
      drawer: Drawer(
        child: ListView(
          children:
          [
            UserAccountsDrawerHeader(

              accountName: Text("Darshan Zapadiya"),
              accountEmail: Text("darshan7842@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor:Colors.blue,
                child: Text("D",
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
              decoration: BoxDecoration(color: Colors.blue),

            ),

            ListTile(
              leading: Icon(Icons.home), title: Text("gallery"),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(0);

              },
            ),
            ListTile(
              leading: Icon(Icons.person), title: Text("video"),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(1);
              },
            ),
            ListTile(
              leading: Icon(Icons.music_note), title: Text("audio"),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(2);
              },
            ),

          ],
        ),
      ),

    );
  }
}