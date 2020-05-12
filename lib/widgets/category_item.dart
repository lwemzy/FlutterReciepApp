import 'package:flutter/material.dart';
import 'package:RecipeApp/screens/category_detail_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String id;
  final Color color;

  const CategoryItem({
    Key key,
    this.title,
    this.id,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(
        CategoryDetailScreen.routeName,
        arguments: {
          'id': id,
          'title': title,
        },
      ),
      child: Card(
        child: Center(
          child: Text(title),
        ),
        color: color,
      ),
    );
  }
}
