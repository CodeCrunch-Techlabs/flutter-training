import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomepage(),
    );
  }
}

class Kitten {
  const Kitten({this.name, this.description, this.age, this.imageUrl});
  final String name;
  final String description;
  final int age;
  final String imageUrl;
}

final String server =
    defaultTargetPlatform == TargetPlatform.android ? "10.0.2.2" : "localhost";
final List<Kitten> _kittens = <Kitten>[
  Kitten(
    name: "Jaydip Patel",
    description: "web developer",
    age: 25,
    imageUrl:
         "images/abc5",
  ),
  Kitten(
    name: "Rinkesh Patel",
    description: "web developer",
    age: 25,
    imageUrl:
        "images/abc1",
  ),
  Kitten(
    name: "Virendra Mehta",
    description: "Ios developer",
    age: 23,
    imageUrl:
        "images/abc2",
  ),
  Kitten(
    name: "Hitesh Chavda",
    description: "Android developer",
    age: 24,
    imageUrl:
         "images/abc3",
  ),
  Kitten(
    name: "Kishan Jadav",
    description: "Wordpress Developer",
    age: 26,
    imageUrl:
        "images/abc4",
  ),
];

class MyHomepage extends StatelessWidget {
  Widget _dialogBuilder(BuildContext context, Kitten kitten) {
    return SimpleDialog(
      children:[
        Image.network(
          kitten.imageUrl,
          fit: BoxFit.fill,
        ),
        Padding(  
          padding: EdgeInsets.all(16.0),
          child: Column(   
            children: <Widget>[

            ],
          ),
        )
      ],
    );
  }

  Widget _listItemBuilder(BuildContext context, int index) {
    return GestureDetector(
      onTap: () => showDialog(
          context: context,
          builder: (context) => _dialogBuilder(context, _kittens[index])),
      child: Container(
        padding: EdgeInsets.only(left: 16.0),
        alignment: Alignment.centerLeft,
        child: Text(_kittens[index].name,
            style: Theme.of(context).textTheme.headline6),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Available Kittens"),
      ),
      body: ListView.builder(
        itemBuilder: _listItemBuilder,
        itemCount: _kittens.length,
        itemExtent: 60.0,
      ),
    );
  }
}
