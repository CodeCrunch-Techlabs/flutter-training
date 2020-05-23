import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
  
class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final items = List<String>.generate(20, (i) => "Item ${i + 1}");

  @override
  Widget build(BuildContext context) {
    final title = 'Dismissing Items';

    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return Dismissible( 
              key: Key(item), 
              onDismissed: (direction) { 
                setState(() {
                  items.removeAt(index);
                }); 
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text("$item dismissed")));
              }, 
              background: Container(color: Colors.red),
              child: ListTile(title: Text('$item')),
            );
          },
        ),
      ),
    );
  }
}