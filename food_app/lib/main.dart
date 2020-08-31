import 'package:flutter/material.dart';

import 'package:foodapp/Screens/Categories_Screen.dart';
import 'package:foodapp/Screens/Tabs_Screen.dart';

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
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        fontFamily: 'Architects',
        textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          body1: TextStyle(fontSize: 14)
        )
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabsScreen(),
    );
  }
}
