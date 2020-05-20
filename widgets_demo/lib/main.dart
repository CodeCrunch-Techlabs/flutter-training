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
        body: PageViewPage(),
      )
    );
  }
}



// Check this link https://api.flutter.dev/flutter/widgets/PageController-class.html to get info about FutureBuilder widget.
//https://www.youtube.com/watch?v=J1gE9xvph-A&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=10&pbjreload=10.

class PageViewPage extends StatefulWidget {
  @override
  _PageViewPageState createState() => _PageViewPageState();
}

class _PageViewPageState extends State<PageViewPage> {

  final controller = PageController(
    initialPage: 0,
  );


  @override
  Widget build(BuildContext context) {
    return Container(
      child : Scaffold(
        body: PageView(
          controller : controller,
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            HomePage(),
            SecondPage(),
            ThirdPage()
          ],
        ),
      ),
    );
  }
}


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 100.0,
            width: 200.0,
            color: Colors.red,
          ),
          SizedBox(height: 20.0),
          Container(
            height: 100.0,
            width: 200.0,
            color: Colors.red,
          ),
          SizedBox(height: 20.0),
          Container(
            height: 100.0,
            width: 200.0,
            color: Colors.red,
          ),
          SizedBox(height: 20.0),
          Container(
            height: 100.0,
            width: 200.0,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 100.0,
            width: 200.0,
            color: Colors.blue,
          ),
          SizedBox(height: 20.0),
          Container(
            height: 100.0,
            width: 200.0,
            color: Colors.blue,
          ),
          SizedBox(height: 20.0),
          Container(
            height: 100.0,
            width: 200.0,
            color: Colors.blue,
          ),
          SizedBox(height: 20.0),
          Container(
            height: 100.0,
            width: 200.0,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 100.0,
            width: 200.0,
            color: Colors.green,
          ),
          SizedBox(height: 20.0),
          Container(
            height: 100.0,
            width: 200.0,
            color: Colors.green,
          ),
          SizedBox(height: 20.0),
          Container(
            height: 100.0,
            width: 200.0,
            color: Colors.green,
          ),
          SizedBox(height: 20.0),
          Container(
            height: 100.0,
            width: 200.0,
            color: Colors.green,
          ),
        ],
      ),
    );;
  }
}





