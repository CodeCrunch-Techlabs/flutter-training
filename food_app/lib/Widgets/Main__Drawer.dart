import 'package:flutter/material.dart';

import 'package:foodapp/Screens/Tabs_Screen.dart';
import 'package:foodapp/Screens/Settings_Screen.dart';


class MainDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
              width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColor,
            child: Text('Cooking Up!!',style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),),
          ),
          SizedBox(height: 20,),
          ListTile(
            leading: Icon(Icons.restaurant, size: 27),
            title: Text('Meals', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Architects'),),
            onTap: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_){
                return TabsScreen(null);
              }));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, size: 27),
            title: Text('Settings', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Architects'),),
            onTap: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_){
                return SettingsScreen();
              }));
            },
          )
        ],
      ),
    );
  }
}
