import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:foodapp/Widgets/Main__Drawer.dart';

class SettingsScreen extends StatefulWidget {

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _vegetarian = false;

  bool _vegan = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings'),),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust your meal selection',style: Theme.of(context).textTheme.title,),
          ),
          Expanded(child:ListView(
            children: [
              SwitchListTile(
                title: Text('Vegetarian'),
                value: _vegetarian,
                subtitle: Text('Only include vegetarian meals'),
                onChanged: (newValue){
                  setState(() {
                    _vegetarian = newValue;
                  });
                },
              ),
              SwitchListTile(
                title: Text('Vegan'),
                value: _vegan,
                subtitle: Text('Only include Vegan meals'),
                onChanged: (newValue){
                  setState(() {
                    _vegan = newValue;
                  });
                },
              )
            ],
          ))
        ],
      )
    );
  }
}
