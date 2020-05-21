import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;


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
          body: Home(),
        ));
  }
}



class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
            elevation: 0.0,
            title: new Text("Flutter Experiments",
              style: new TextStyle(
                  color: Colors.white,
                  fontFamily: 'Nunito',
                  letterSpacing: 1.0
              ),
            ),
            backgroundColor: new Color(0xFF2979FF),
            centerTitle: true
        ),
        body: MyHomePage()
        );
  }
}

//check this https://medium.com/flutter-community/a-deep-dive-into-draggable-and-dragtarget-in-flutter-487919f6f1e4.


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> _list = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();


  void _addItem() {
    final int _index = _list.length;
    _list.insert(_index,_index);
    _listKey.currentState.insertItem(_index);
  }

  void _removeItem() {
    final int _index = _list.length-1;
    _listKey.currentState.removeItem(_index,(context,animation)=> Container()); /// what I'm supposed to do here
    _list.removeAt(_index);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

        child: AnimatedList(
          key: _listKey,
          initialItemCount: 0,
          itemBuilder: (BuildContext context, int index, Animation animation) {
            return _buildItem(_list[index].toString(),animation);
          },),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              FloatingActionButton(
                onPressed:()=> _addItem(),
                tooltip: 'Increment',
                child: Icon(Icons.add),),
              FloatingActionButton(
                onPressed: ()=>_removeItem(),
                tooltip: 'Decrement',
                child: Icon(Icons.remove),),
            ],),
        ],),
    );
  }

  Widget _buildItem(String _item, Animation _animation) {
    return SizeTransition(
      sizeFactor: _animation,
      child: Card(
        child: ListTile(
          title: Text(
            _item,
          ),
        ),
      ),
    );
  }
}

