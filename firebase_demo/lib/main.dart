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
  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              document['name'],
              style: Theme.of(context).textTheme.headline,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xffddddff),
            ),
            padding: EdgeInsets.all(10.0),
            child: Text(
              document['votes'].toString(),
              style: Theme.of(context).textTheme.display1,
            ),
          )
        ],
      ),
      onTap: () {
        Firestore.instance.runTransaction((transaction) async {
          DocumentSnapshot freshSnap =
              await transaction.get(document.reference);
          await transaction
              .update(freshSnap.reference, {'votes': freshSnap['votes'] + 1});
        });
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('bandnames').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Text("Loading...!");
          return ListView.builder(
            itemExtent: 80.0,
            itemCount: snapshot.data.documents.lenght,
            itemBuilder: (context, index) =>
                _buildListItem(context, snapshot.data.documents[index]),
          );
        },
      ),
    );
  }
}
