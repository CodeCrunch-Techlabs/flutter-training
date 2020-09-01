import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:foodapp/Screens/Categories_Screen.dart';
import 'package:foodapp/Screens/Favorites_Screen.dart';
import 'package:foodapp/Widgets/Main__Drawer.dart';
import 'package:foodapp/model/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {


  int _selectPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    final List<Map<String, dynamic>> _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavoriteScreen(widget.favoriteMeals ), 'title': 'Your Favourite'}
    ];

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectPageIndex]['title']),
        ),
        drawer: MainDrawer(),
        body: _pages[_selectPageIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectPageIndex,
          onTap: _selectPage,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), title: Text('Categories')),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), title: Text('Favorite'))
          ],
        ),
      ),
    );
  }
}
