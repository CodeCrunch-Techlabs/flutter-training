import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'login/google.dart';

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
        seconds: 10,
        navigateAfterSeconds: new GoogleLogin(),
        title: new Text(
          'Welcome To Studentdesk',
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
        ),
        image: new Image.asset('assets/logo.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader:
            new TextStyle(color: Colors.blue[300], fontWeight: FontWeight.bold),
        photoSize: 100.0,
        loaderColor: Colors.green);
  }
}
