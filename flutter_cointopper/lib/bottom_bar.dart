import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart'; 

class BottomNavigation extends StatefulWidget {
  BottomNavigation({Key key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0; 

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text('Home'), 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pages),
            title: Text('News'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            title: Text('Account'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
