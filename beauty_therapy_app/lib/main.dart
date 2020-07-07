import 'package:beauty_therapy_app/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      
        seconds: 14,
        navigateAfterSeconds: new HomePage(),
        title: new Text(
          'Welcome  Fast-Food App',
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
        ),
        image: new Image.asset('images/splash.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(
            color: Colors.amberAccent[200], fontWeight: FontWeight.bold),
        photoSize: 100.0,
        loaderColor: Colors.amberAccent[200]);
  }
}
