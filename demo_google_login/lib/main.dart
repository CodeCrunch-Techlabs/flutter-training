import 'package:demo_google_login/ui/home.dart';
import 'package:demo_google_login/ui/login.dart';
import 'package:demo_google_login/ui/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Google login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
        if (!snapshot.hasData || snapshot.data == null) return LoginPage();
        if (snapshot.connectionState == ConnectionState.waiting)
          return SplashPage();

        return HomePage();
      },
    );
  }
}
