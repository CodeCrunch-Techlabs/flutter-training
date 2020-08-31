import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:foodapp/Widgets/Main__Drawer.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings'),),
      drawer: MainDrawer(),
      body: Center(
        child: Text("Settings!!"),
      ),
    );
  }
}
