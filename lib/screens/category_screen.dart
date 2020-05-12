import 'package:flutter/material.dart';
import 'package:RecipeApp/dummy_data.dart';
import 'package:RecipeApp/widgets/category_item.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 0.0),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1,
        children: DUMMY_CATEGORIES
            .map((category) => CategoryItem(
                  color: category.color,
                  id: category.id,
                  title: category.title,
                ))
            .toList(),
      ),
    );
  }
}
