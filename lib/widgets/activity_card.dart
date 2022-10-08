// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:travel_app/models/activity_model.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;
  ActivityCard(this.activity);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: width,
      height: 200,
      // color: Colors.grey,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Positioned(
            right: 0,
            left: 20,
            child: Container(
              height: 200,
              padding: EdgeInsets.only(left: width * .28),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: width * 0.30,
                        child: Text(
                          activity.name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "\$${activity.price}",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "per pax",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        activity.type,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "*****",
                        style: TextStyle(
                            color: Color.fromARGB(255, 215, 190, 0),
                            fontSize: 25),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      ...activity.startTimes.map(
                        (time) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            margin: EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                              color: Theme.of(context).secondaryHeaderColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              time,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.redAccent,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 5)
                ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                width: width * 0.30,
                height: 180,
                image: AssetImage(activity.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
