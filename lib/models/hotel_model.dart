// To parse this JSON data, do
//
//     final Hotel = HotelFromJson(jsonString);

// import 'package:meta/meta.dart';
import 'dart:convert';

List<Hotel> HotelFromJson(String str) =>
    List<Hotel>.from(json.decode(str).map((x) => Hotel.fromJson(x)));

String HotelToJson(List<Hotel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Hotel {
  Hotel({
    required this.title,
    required this.id,
    required this.location,
    required this.area,
    required this.city,
    required this.favorite,
    required this.rent,
    required this.type,
    required this.exclusive,
    required this.img,
  });

  String title;
  String id;
  String location;
  String area;
  String city;
  bool favorite;
  int rent;
  String type;
  bool exclusive;
  String img;

  factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
        title: json["title"],
        id: json["id"],
        location: json["location"],
        area: json["area"],
        city: json["city"],
        favorite: json["favorite"],
        rent: json["rent"],
        type: json["type"],
        exclusive: json["exclusive"],
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "id": id,
        "location": location,
        "area": area,
        "city": city,
        "favorite": favorite,
        "rent": rent,
        "type": type,
        "exclusive": exclusive,
        "img": img,
      };
}

// ! Old data to look for

// class Hotel {
//   String title;
//   String id;
//   String location;
//   String area;
//   String city;
//   bool favorite;
//   double rent;
//   String type;
//   String img;
//   bool exclusive;

//   Hotel({
//     required this.title,
//     required this.id,
//     required this.location,
//     required this.area,
//     required this.city,
//     required this.favorite,
//     required this.rent,
//     required this.type,
//     required this.img,
//     required this.exclusive,
//   });
// }

List<Hotel> hotels = [];




// final List<Hotel> hotels = [
//   Hotel(
//     imageUrl: 'assets/images/hotel0.jpg',
//     name: 'Palm Harbour',
//     address: '909 Woodland St, DDN',
//     price: 175,
//   ),
//   Hotel(
//     imageUrl: 'assets/images/hotel1.jpg',
//     name: 'Cove Red',
//     address: '92 The Choco Street, NY',
//     price: 300,
//   ),
//   Hotel(
//     imageUrl: 'assets/images/hotel2.jpg',
//     name: 'Hocus Pocus',
//     address: '210 US Highway, Highland Lake, FL',
//     price: 240,
//   ),
// ];


  // Hotel(
  //   title: "Rose Cottage",
  //   id: "item1",
  //   location: "2699 Green Valley, Highland Lake, NY",
  //   area: "8 x 10",
  //   city: "New York",
  //   favorite: false,
  //   rent: 2300,
  //   type: "house",
  //   img:
  //       "https://photos.zillowstatic.com/fp/aad672369c04e959cb1bc4a2271a1f64-cc_ft_1536.webp",
  //   exclusive: true,
  // ),
