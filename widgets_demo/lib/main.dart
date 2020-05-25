

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

//check this https://stackoverflow.com/questions/57454851/understanding-flutters-shadermask.

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {



  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Container(
         child: ShaderMask(
             blendMode: BlendMode.srcATop,
           shaderCallback: (Rect bounds) =>
               RadialGradient(
                 center: Alignment.topLeft,
                 radius: 1.0,
                 colors: [Colors.yellow, Colors.deepOrange.shade900],
                 tileMode: TileMode.mirror,
               ).createShader(bounds),
           child: const Text('I’m burning the memories',style: TextStyle(
             fontSize: 20 , fontWeight: FontWeight.bold
           ),)
         )
      ),
    );
  }
}
