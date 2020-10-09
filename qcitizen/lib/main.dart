import 'package:flutter/material.dart';
import 'package:qcitizen/screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.green,
          textTheme: TextTheme(
              headline5: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              bodyText1: TextStyle(fontSize: 15.0, color: Colors.black),
              bodyText2: TextStyle(fontSize: 12.0, color: Colors.purple))),
      home: WelcomeScreen(),
    );
  }
}
