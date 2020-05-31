import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomepage(),
    );
  }
}

class MyHomepage extends StatelessWidget {
  const MyHomepage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context ,MockBandInfo bandInfo) {
    return  ListTile(
      title: Row(
        children: <Widget>[
          Expanded(  
            child: Text( 
              bandInfo.name,
              style: Theme.of(context).textTheme.headline,
            ),
          ),
          Container(  
            decoration: BoxDecoration(  
              color: Color(0xffddddff),

            ),
            padding: EdgeInsets.all(10.0),
            child: Text(bandInfo.votes.toString(),
            style: Theme.of(context).textTheme.display1,),
          )
        ],
      ),
      onTap: (){
        print("Should increase vote here");
      },
    );
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(  
      appBar: AppBar(  
        title: Text(title),
      ),
      body:  StreamBuilder(
        stream: Firestore.instance.collection('bandnames').snapshots(),
              child: ListView.builder(
          itemExtent: 80.0,
          itemCount: _buildList.lenght,
          itemBuilder: (context ,_buidList[index]),
        ),
      ),
    );
  }
}
