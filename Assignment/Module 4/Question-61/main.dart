import 'package:flutter/material.dart';
import 'cartscreen.dart';
import 'foodscreen.dart';

void main() {
  runApp(MaterialApp(home: homepage(),debugShowCheckedModeBanner: false,));
}

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage>
{
  List screens = [foodscreen(), CartScreen(),];
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
        bottomNavigationBar: BottomNavigationBar
          (
           items:
           [
             BottomNavigationBarItem
               (icon: Icon(Icons.menu),
               label: 'Home',
               backgroundColor: Colors.yellowAccent
             ),
            BottomNavigationBarItem
            (icon: Icon(Icons.add_shopping_cart),
            label: 'Search',
            backgroundColor: Colors.yellowAccent
            )
           ],
          type: BottomNavigationBarType.shifting,
          currentIndex: selectedIndex,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.black,
          onTap: _onItemTapped,
        ),
       body: screens[selectedIndex],
    );
  }
}
