import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:traveldairy/Screens/Places_List_Screen.dart';
import 'package:traveldairy/Provider/Places_Provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(ctx) => GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: PlacesListScreen(),
      ),
    );
  }
}




