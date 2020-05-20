import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: HomePage(),
      )
    );
  }
}



// Check this link https://www.youtube.com/watch?v=R9C5KMJKluE&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=12 to get info about SliverAppBar widget.

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FadeInImage(
        placeholder: NetworkImage(
          'https://www.slingshotvoip.com/wp-content/uploads/2019/12/placeholder-300x200.png',
        ),
        fadeInDuration: const Duration(seconds: 2),
        fadeOutDuration: const Duration(seconds: 2),
        image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSsv8_v99tAqX1CGOw-5zpCDmQoQ2aKQBTz_la5s6M7k-LZpC49&usqp=CAU'),
      ),
    );
  }
}






