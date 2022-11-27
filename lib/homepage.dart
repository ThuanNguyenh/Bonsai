import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:bonsai_shop/screens/home.dart';
import 'package:bonsai_shop/screens/cart.dart';
import 'package:bonsai_shop/screens/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List Screens = [
    Cart(),
    Home(),
    Profile(),
  ];
  int _selectedIndex = 1;

  //State class
  // int _page = 0;
  // GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: Colors.white,
        height: 50,
        index: _selectedIndex,
        backgroundColor: Colors.transparent,
        items:  <Widget>[
          Icon(Icons.shopping_bag_rounded, size: 30,color: Colors.lightGreen.shade900),
          Icon(Icons.home, size: 30, color: Colors.lightGreen.shade900,),
          Icon(Icons.favorite, size: 30, color: Colors.lightGreen.shade900,),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: Screens[_selectedIndex],
    );
  }
}

