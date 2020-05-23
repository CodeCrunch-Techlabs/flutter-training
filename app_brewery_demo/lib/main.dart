import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text(
            "MyApp",
          ),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Center(
          child: Image(
            image: NetworkImage(
                'https://instagram.famd3-1.fna.fbcdn.net/v/t51.2885-19/s320x320/35001356_194081827920671_952156350731780096_n.jpg?_nc_ht=instagram.famd3-1.fna.fbcdn.net&_nc_ohc=GCAhM4XnNhAAX_yuJt3&oh=fedb0f724406f3d27eee2b74fef3ef4a&oe=5EE7019B'),
          ),
        ),
      ),
    ),
  );
}
