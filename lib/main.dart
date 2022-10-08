// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:travel_app/bottomBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Travel App',
        theme: ThemeData(
          primaryColor: const Color(0xFF3EBACE),
          secondaryHeaderColor: const Color(0xFFD8ECF1),
          scaffoldBackgroundColor: const Color(0xFFF3F5F7),
        ),
        debugShowCheckedModeBanner: false,
        home: BottomBar());
  }
}
