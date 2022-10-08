// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/screens/destination_screen.dart';
import '../models/destination_model.dart';

class DestinationCard extends StatelessWidget {
  final Destination destination;

  DestinationCard(this.destination);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Routing for destination screen here
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DestinationScreen(destination),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 20, left: 10),
        width: 230,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              bottom: 10,
              child: Container(
                width: 220,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "${destination.activities.length} Activities",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        destination.description,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 4.0),
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: Hero(
                    tag: destination.city,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image(
                        width: 190,
                        height: 190,
                        fit: BoxFit.cover,
                        image: AssetImage(destination.imageUrl),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  // width: double.maxFinite,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          destination.city,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.locationArrow,
                              color: Colors.white70,
                              size: 15,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              destination.country,
                              style: TextStyle(
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
