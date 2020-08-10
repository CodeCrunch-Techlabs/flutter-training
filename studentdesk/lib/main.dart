import 'package:flutter/material.dart';
import 'package:studentdesk/Screens/SignIn.dart';
import 'package:studentdesk/Screens/BookList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: "JosefinSans",
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BookList(),
    );
  }
}

