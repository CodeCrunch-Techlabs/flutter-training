import 'package:flutter/material.dart';
import 'package:flutter_cointopper/screens/account_screen.dart';
import 'package:flutter_cointopper/screens/airdrop_screen.dart';
import 'package:flutter_cointopper/screens/dashboard.dart';
import 'package:flutter_cointopper/screens/ico_screen.dart';
import 'package:flutter_cointopper/screens/news_Screen.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex = 0;
  final widgetOptions = [
    NewsScreen(),
    IcoScreen(),
    AirdropScreen(),
    Dashboard(),
    AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.web,
            ),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.donut_large,
            ),
            label: 'ICOs',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_airport,
            ),
            label: 'AirDrops',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
            ),
            label: 'Account',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey[400],
        onTap: onItemTapped,
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
