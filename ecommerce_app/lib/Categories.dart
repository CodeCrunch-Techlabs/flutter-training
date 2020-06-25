import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class CategoriesTabs extends StatefulWidget {
  @override
  _CategoriesTabsState createState() => _CategoriesTabsState();
}

class _CategoriesTabsState extends State<CategoriesTabs> {

  var _tabsname = ['All','Chair','Table','Bed','Sofas','Stools'];


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      child: DefaultTabController(
        length: _tabsname.length,
        child: TabBar(
          unselectedLabelColor: Theme.of(context).primaryColor,
          indicatorColor: Colors.transparent,
          isScrollable: true,
          labelColor: Theme.of(context).secondaryHeaderColor,
          tabs:  <Tab>[
            for(var tab in _tabsname) Tab(text: tab )
          ],
        ),
      ),
    );
  }
}
