import "package:flutter/material.dart";

void main() {
  runApp(PlaceHolderPage());
}

class PlaceHolderPage extends StatefulWidget {
  @override
  _PlaceHolderState createState() => _PlaceHolderState();
}

class _PlaceHolderState extends State<PlaceHolderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Place HOlder"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Placeholder(
              color: Colors.red,
              strokeWidth: 4,
              fallbackWidth: 100,
              fallbackHeight: 100,
            ),
            SizedBox(height: 20),
            Container(
              // constraints: BoxConstraints.expand(height: 100, width: 100),
              child: Placeholder(
                color: Colors.blueAccent,
                strokeWidth: 4,
                fallbackWidth: 10,
                fallbackHeight: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
