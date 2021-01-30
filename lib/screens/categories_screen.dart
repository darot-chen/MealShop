import 'package:flutter/material.dart';
import 'package:shop_app/widgets/category_item.dart';

import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: EdgeInsets.all(15),
        children: DUMMY_CATEGORIES
            .map(
              (catData) => CategoryItem(
                id: catData.id,
                title: catData.title,
                color: catData.color,
              ),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          childAspectRatio: 3 / 2,
        ),
      ),
    );
  }
}
