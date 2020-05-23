
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:fluttertoast/fluttertoast.dart';


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
          body: Home(),
        ));
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
            elevation: 0.0,
            title: new Text(
              "Flutter Experiments",
              style: new TextStyle(
                  color: Colors.white,
                  fontFamily: 'Nunito',
                  letterSpacing: 1.0),
            ),
            backgroundColor: new Color(0xFF2979FF),
            centerTitle: true),
        body: MyHome());
  }
}

//check this https://stackoverflow.com/questions/58586031/what-is-the-proper-way-to-implement-cupertinoactionsheet.

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {


  @override
  Widget build(BuildContext context) {
    return  Container(
       child: Center(
         child: Card(
           elevation: 20,
           child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
               mainAxisSize: MainAxisSize.min,
               children: <Widget>[
                 StatefulBuilder(builder:
                     (BuildContext context, StateSetter setState) {
                   return CupertinoButton(
                     child: Text(
                       'Click me',
                       style: TextStyle(color: Colors.black),
                     ),
                     onPressed: () {
                       final act = CupertinoActionSheet(
                           title: Text('Select Option'),
                           message: Text('Which option you would like to select?'),
                           actions: <Widget>[
                             CupertinoActionSheetAction(
                               child: Text('Yes'),
                               onPressed: () {
                                 print('Yes');
                               },
                             ),
                             CupertinoActionSheetAction(
                               child: Text('No'),
                               onPressed: () {
                                 print('No');
                               },
                             ),
                             CupertinoActionSheetAction(
                               child: Text('Can\'t say anything'),
                               onPressed: () {
                                 print('Can\'t say anything');
                               },
                             )
                           ],
                           cancelButton: CupertinoActionSheetAction(
                             child: Text('Cancel'),
                             onPressed: () {
                               Navigator.pop(context);
                             },
                           ));
                       showCupertinoModalPopup(
                           context: context,
                           builder: (BuildContext context) => act);
                     },
                   );
                 })
               ]),
         ),
       ),

    );
  }
}
