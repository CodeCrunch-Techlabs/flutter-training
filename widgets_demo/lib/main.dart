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
       child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: <Widget>[
           Container(
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
             ),
           ),
           Container(
              child: AnimatedPage()
           )
         ],
       ),
    );
  }
}

// Check this link https://api.flutter.dev/flutter/widgets/AnimatedContainer-class.html to get info about AnimatedContainer widget.

class AnimatedPage extends StatefulWidget {
  @override
  _AnimatedPageState createState() => _AnimatedPageState();
}

class _AnimatedPageState extends State<AnimatedPage> {

  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Center(
        child: AnimatedContainer(
          width: selected ? 100.0 : 300.0,
          height: selected ? 100.0 : 100.0,
          color: selected ? Colors.red : Colors.blue,
          alignment: selected ? Alignment.center : AlignmentDirectional.topCenter,
          duration: Duration(seconds:2),
          curve: Curves.fastOutSlowIn,
          child: Container(
          ),
        ),
      ),
    );
  }
}



