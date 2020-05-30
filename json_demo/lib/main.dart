import 'package:flutter/material.dart';
import 'package:jsondemo/Screens/cat_breeds.dart';


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
      home: CatBreedsPage(title: 'Cats House'),
    );
  }
}


class CatBreedsPage extends StatefulWidget {
  // 1
  CatBreedsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CatBreedsPageState createState() => _CatBreedsPageState();
}
class _CatBreedsPageState extends State<CatBreedsPage> {

  @override
  void initState(){
    super.initState();
    getCatData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // 2
        title: Text(widget.title),
      ),
      // 3
      body: Container(
        child: Text("Hello"),
      )
    );
  }
}
