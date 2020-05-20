import 'package:flutter/cupertino.dart';
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
        body: HomePage(),
      )
    );
  }
}



// Check this link https://api.flutter.dev/flutter/widgets/Table-class.html to get info about FutureBuilder widget.

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Table(
        columnWidths: { 0: FractionColumnWidth(.1), 1: FractionColumnWidth(.2)},
        border: TableBorder.all(color: Colors.black),
        defaultVerticalAlignment:TableCellVerticalAlignment.middle,
        children: [
             TableRow(
               children: [
                 TableCell(
                   child: Text('ID'),
                 ),
                 TableCell(
                   child: Text('NAME'),
                 ),
                 TableCell(
                   child: Text('OCCUPATION'),
                 ),
                 TableCell(
                   child: Text('WORK EXPERIANCE'),
                 )
               ]
             ),
          TableRow(
              children: [
                TableCell(
                  child: Text('1'),
                ),
                TableCell(
                  child: Text('James'),
                ),
                TableCell(
                  child: Text('Web Developer'),
                ),
                TableCell(
                  child: Text('5 Years'),
                )
              ]
          ),
          TableRow(
              children: [
                TableCell(
                  child: Text('2'),
                ),
                TableCell(
                  child: Text('John'),
                ),
                TableCell(
                  child: Text('Flutter Developer'),
                ),
                TableCell(
                  child: Text('3 Years'),
                )
              ]
          ),
          TableRow(
              children: [
                TableCell(
                  child: Text('3'),
                ),
                TableCell(
                  child: Text('Angela'),
                ),
                TableCell(
                  child: Text('Flutter Developer'),
                ),
                TableCell(
                  child: Text('10 Years'),
                )
              ]
          )
        ],
      ),
    );
  }
}






