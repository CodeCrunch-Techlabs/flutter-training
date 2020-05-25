

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
          body: MyHome(),
        ));
  }
}

//check this https://www.youtube.com/watch?v=zpO6n_oZWw0&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=69.

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {


  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
           body: Builder(
             builder: (context) => FlatButton(
               child: Text('Show a SnackBar'),
               onPressed: (){
                 Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("Hello !!"),
                 ));
               },
             ),
           ),
      ),
    );
  }
}
