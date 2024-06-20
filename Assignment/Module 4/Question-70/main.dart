import 'package:flutter/material.dart';
import 'audio.dart';
import 'gallery.dart';
import 'vidio.dart';

void main() {
  runApp(MaterialApp(home:MyApp(),debugShowCheckedModeBanner: false,) );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
       appBar: AppBar(title: Text('Application'),),
      bottomNavigationBar: BottomNavigationBar
        (
        items:
        [
          BottomNavigationBarItem(
            icon: Icon(Icons.image_outlined),
            label: 'Gallery',
            backgroundColor: Colors.blue,

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow),
            label: 'Video',
            backgroundColor: Colors.yellow,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.audiotrack_sharp),
            label: 'audio',
            backgroundColor: Colors.pinkAccent,
          ),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
        unselectedItemColor: Colors.green,
      ),
      body: screens[selectedIndex],

    );
  }
}
