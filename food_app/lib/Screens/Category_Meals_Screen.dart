import 'package:flutter/material.dart';
import 'package:foodapp/dummy_data.dart';

import 'package:foodapp/Widgets/Meal_Item.dart';

import 'package:foodapp/model/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  final String categoryId;
  final String categoryTitle;

  CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String categoryTitle;
  List<Meal> displayedMeals;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    displayedMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(widget.categoryId);
    }).toList();
  }


  void removeMeal(String mealId){
      setState(() {
        displayedMeals.removeWhere((meal) => meal.id  == mealId );
      });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: Text(widget.categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: displayedMeals[index].id,
              title: displayedMeals[index].title,
              imageUrl: displayedMeals[index].imageUrl,
              duration: displayedMeals[index].duration,
              complexity: displayedMeals[index].complexity,
              affordability: displayedMeals[index].affordability,
              removeItem: removeMeal,
            );
          },
          itemCount: displayedMeals.length,
        ));
  }
}
