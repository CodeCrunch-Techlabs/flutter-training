import 'package:flutter/material.dart';
import 'package:foodapp/dummy_data.dart';

import 'package:foodapp/Category_Item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(24),
      children: DUMMY_CATEGORIES.map((cateData) {
        return CategoryItem(cateData.id, cateData.title, cateData.color);
      }).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
    );
  }
}
