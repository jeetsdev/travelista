// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:travel_app/models/hotel_model.dart';

class FindScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("In find scrren hotel length is ${hotels.length}");
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Search & Filter",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.stacked_bar_chart,
                  size: 25,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                label: Text("Search here"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "All Hotels",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemBuilder: (_, index) {
                  return Container(
                    height: 200,
                    margin: EdgeInsets.symmetric(vertical: 20),
                    color: Colors.amber,
                  );
                },
                itemCount: 5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
