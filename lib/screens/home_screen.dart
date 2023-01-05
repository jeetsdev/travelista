// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/models/hotel_model.dart';

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
  List _items = [];

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/data/hotel_data.json');
    final data = await json.decode(response);
    data.asMap().entries.map((element) {
      print(element.title);
      Hotel newHotel = Hotel(
        title: element.title,
        id: element.id,
        location: element.location,
        area: element.area,
        city: element.city,
        favorite: element.favorite,
        rent: element.rent,
        type: element.type,
        img: element.img,
        exclusive: element.exclusive,
      );
      setState(() {
        hotels.add(newHotel);
      });
    });
  }

  //! Building the icons here
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

  //! Init state handler here to fetch the data
  @override
  void initState() {
    super.initState();
    readJson();
    // hotels=List.of(_items);
    print("after mapping the data hotel length is ${hotels.length}");
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ListView(
      children: [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
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
    );
  }
}
