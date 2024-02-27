import 'package:flutter/material.dart';
import 'package:travel_app/models/hotel_model.dart';
import 'package:travel_app/widgets/exclusive_hotel_card.dart';

class ExclusiveHotels extends StatelessWidget {
  const ExclusiveHotels({super.key});

  @override
  Widget build(BuildContext context) {
    print("In exlcusive hotel lengths is ${hotels.length}");
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                "Exclusive Hotels",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              Text(
                "See All",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 300,
          // color: Colors.grey,
          // margin: EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) {
              return ExclusiveHotelCard(hotels[index]);
            }),
            itemCount: hotels.length,
          ),
        )
      ],
    );
  }
}
