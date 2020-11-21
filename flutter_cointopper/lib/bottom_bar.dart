import 'package:flutter/material.dart';
import 'package:flutter_cointopper/screens/account_screen.dart';
import 'package:flutter_cointopper/screens/airdrop_screen.dart';
import 'package:flutter_cointopper/screens/dashboard.dart';
import 'package:flutter_cointopper/screens/ico_screen.dart';
import 'package:flutter_cointopper/screens/news_screen.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex = 0;
  final widgetOptions = [
    Dashboard(),
    IcoScreen(),
    AirdropScreen(),
    NewsScreen(),
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
                Icons.home,
              ),
              title: Text(
                'Home',
                style: TextStyle(),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.donut_large,
              ),
              title: Text(
                'ICOs',
                style: TextStyle(),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.local_airport,
              ),
              title: Text(
                'AirDrops',
                style: TextStyle(),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.web,
              ),
              title: Text(
                'News',
                style: TextStyle(),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
              ),
              title: Text(
                'Account',
                style: TextStyle(),
              )),
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
