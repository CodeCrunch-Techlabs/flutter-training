import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

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
          body: MainScreen(),
        ));
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Main Screen'),
        ),
        body: GestureDetector(
          child: Hero(
            tag: 'imageHero',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(500.0),
              child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQx-_naJsnKHbBVP2Zn_Zz1SWwkpf8XdIH0tOM9StkNDBGJ5Fo6&usqp=CAU'),
            ),
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return DetailScreen();
            }));
          },
        ));
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQx-_naJsnKHbBVP2Zn_Zz1SWwkpf8XdIH0tOM9StkNDBGJ5Fo6&usqp=CAU'),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
