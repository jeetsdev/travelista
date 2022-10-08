// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/models/destination_model.dart';
import 'package:travel_app/widgets/activity_card.dart';

class DestinationScreen extends StatefulWidget {
  final Destination destination;
  DestinationScreen(this.destination);
  @override
  State<DestinationScreen> createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 4),
                        blurRadius: 5),
                  ],
                ),
                child: Hero(
                  tag: widget.destination.city,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: AssetImage(widget.destination.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 50,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      padding: EdgeInsets.all(0),
                      constraints: BoxConstraints(),
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      iconSize: 30,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.search,
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.stacked_bar_chart,
                          size: 30,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                left: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.destination.city,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.locationArrow,
                              color: Colors.white60,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              widget.destination.country,
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
                ),
              )
            ],
          ),
          // SizedBox(
          //   height: 20,
          // ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: ListView.builder(
                padding: EdgeInsets.only(top: 20),
                itemBuilder: ((context, index) {
                  return ActivityCard(widget.destination.activities[index]);
                }),
                itemCount: widget.destination.activities.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
