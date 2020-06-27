 
import 'package:flare_flutter_app/refresh_control.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
	platform: TargetPlatform.iOS,
      ),
      home: CupertinoRefreshControlDemo()
    );
  }
}