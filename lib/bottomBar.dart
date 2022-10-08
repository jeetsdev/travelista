// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:travel_app/screens/find_screen.dart';
import 'package:travel_app/screens/home_screen.dart';
import 'package:travel_app/screens/profile_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedNavbarindex = 0;
  void _onTapNavBar(int index) {
    print(index);
    setState(() {
      _selectedNavbarindex = index;
    });
  }

  static List<Widget> _widgetOptions = <Widget>[
    MyHomePage(),
    FindScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedNavbarindex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://res.cloudinary.com/dz7duml2h/image/upload/v1655813192/images_xhru8q.jpg"),
              radius: 15.0,
            ),
            label: "",
          ),
        ],
        selectedFontSize: 0,
        iconSize: 30,
        currentIndex: _selectedNavbarindex,
        onTap: _onTapNavBar,
      ),
    );
  }
}
