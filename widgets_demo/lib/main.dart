import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  Future<String> _calculation = Future<String>.delayed(
    Duration(seconds: 3),
        () => 'Data Loaded',
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
        child: Center(
          child: FutureBuilder<String>(
          future: _calculation, // a previously-obtained Future<String> or null
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
      List<Widget> children;
      if (snapshot.hasData) {
          children = <Widget>[
            Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('Result: ${snapshot.data}'),
            )
          ];
      } else if (snapshot.hasError) {
          children = <Widget>[
            Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('Error: ${snapshot.error}'),
            )
          ];
      } else {
          children = <Widget>[
            SizedBox(
              child: CupertinoActivityIndicator(
                radius: 40,
              ),
              width: 60,
              height: 60,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('Awaiting result...'),
            )
          ];
      }
      return Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
      ),
      );
          },
          ),
        ),
    );
  }
}

