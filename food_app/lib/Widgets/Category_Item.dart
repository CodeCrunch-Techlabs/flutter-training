import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:foodapp/Screens/Category_Meals_Screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (_){
            return CategoryMealsScreen(id, title);
        }));
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: EdgeInsets.all(1),
         alignment: Alignment.center,
        child: Text(title, style: Theme.of(context).textTheme.title,textAlign: TextAlign.center,),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
            ),
        borderRadius: BorderRadius.circular(14)),
      ),
    );
  }
}
