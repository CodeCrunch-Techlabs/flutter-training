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
        appBar: AppBar(
          title: Text("Widgets Demo"),
        ),
        body: MyHomePage(),
      )
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: SafeArea(
         child:  Wrap(
             spacing: 3.0, // gap between adjacent chips
             runSpacing: 3.0, // gap between lines
             children: <Widget>[
               Container(
                 height: 100.0,
                 width: 100.0,
                 color: Colors.red,
               ),
               Container(
                 height: 100.0,
                 width: 100.0,
                 color: Colors.red,
               ),
               Container(
                 height: 100.0,
                 width: 100.0,
                 color: Colors.red,
               ),
               Container(
                 height: 100.0,
                 width: 100.0,
                 color: Colors.red,
               ),
               Container(
                 height: 100.0,
                 width: 100.0,
                 color: Colors.red,
               ),
               Container(
                 height: 100.0,
                 width: 100.0,
                 color: Colors.red,
               ),
             ],
           )
       ),
    );
  }
}

// Check this link https://www.youtube.com/watch?v=z5iw2SeFx2M&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=4 to get info about Wrap widget.
