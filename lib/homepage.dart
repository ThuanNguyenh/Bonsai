import 'package:bonsai_shop/model/post.dart';
import 'package:bonsai_shop/model/post.dart';
import 'package:bonsai_shop/network/data.dart';
import 'package:bonsai_shop/screens/products/AllProducts.dart';
import 'package:bonsai_shop/screens/blog/Blogs.dart';
import 'package:bonsai_shop/screens/products/Orders.dart';
import 'package:flutter/material.dart';
import 'package:bonsai_shop/screens/home/home.dart';
import 'package:bonsai_shop/screens/products/productDetail.dart';
import 'package:bonsai_shop/screens/accounts/profile.dart';
import 'package:bonsai_shop/model/post.dart';
import 'model/post.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List Screens = [
    Home(data: data.last),
    Orders(),
    Blogs(),
    Profile(),
  ];
  int _selectedIndex = 0;

  //State class
  // int _page = 0;
  // GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront),
            label: 'Cửa hàng',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.document_scanner),
            label: 'Đơn hàng',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'Bài viết',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Tài Khoản',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.lightGreen[900],
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
