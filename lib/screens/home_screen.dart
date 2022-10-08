// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/widgets/destination_carousel.dart';
import 'package:travel_app/widgets/exclusive_hotel_carousel.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.personWalking,
    FontAwesomeIcons.personBiking,
  ];

  int _selectedIconIndex = 0;

  Widget _buildIcons(int index) {
    return GestureDetector(
      onTap: () => setState(() {
        _selectedIconIndex = index;
      }),
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: _selectedIconIndex == index
              ? Theme.of(context).secondaryHeaderColor
              : Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Icon(
          _icons[index],
          size: 25,
          color: _selectedIconIndex == index
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C2C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.050, right: width * 0.150),
            child: Text(
              "What would you like to find?",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ..._icons.asMap().entries.map((item) {
                return _buildIcons(item.key);
              })
            ],
          ),
          SizedBox(
            height: 20,
          ),
          DestinationCarousel(),
          SizedBox(
            height: 20,
          ),
          ExclusiveHotels(),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
