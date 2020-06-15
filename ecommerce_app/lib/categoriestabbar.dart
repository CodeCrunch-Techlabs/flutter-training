import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class CategoriesTabs extends StatefulWidget {
  @override
  _CategoriesTabsState createState() => _CategoriesTabsState();
}

class _CategoriesTabsState extends State<CategoriesTabs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      child: DefaultTabController(
        length: 6,
        child: TabBar(
          unselectedLabelColor: Theme.of(context).primaryColor,
          indicatorColor: Colors.transparent,
          isScrollable: true,
          labelColor: Colors.orange[200],
          tabs: const <Tab>[
            const Tab(text: 'All'),
            const Tab(text: 'Chair'),
            const Tab(text: 'Table'),
            const Tab(text: 'Bed'),
            const Tab(text: 'Sofas'),
            const Tab(text: 'Stools'),
          ],
        ),
      ),
    );
  }
}
