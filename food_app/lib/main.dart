import 'package:flutter/material.dart';

import 'package:foodapp/Screens/Tabs_Screen.dart';
import 'package:foodapp/dummy_data.dart';
import 'package:foodapp/model/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String, bool> _filters = {
    'vegetarian' : false,
    'vegan' : false
  };

  List<Meal> _favoritedMeals = [];

  void _toggleFavorite(String mealId){
      final existingIndex = _favoritedMeals.indexWhere((meal) => meal.id == mealId );

      if(existingIndex >= 0){
        setState(() {
          _favoritedMeals.removeAt(existingIndex);
        });
      }
      else{
        setState(() {
          _favoritedMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        fontFamily: 'Architects',
        textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          body1: TextStyle(fontSize: 14)
        )
      ),
      home: TabsScreen(_favoritedMeals),
    );
  }
}

