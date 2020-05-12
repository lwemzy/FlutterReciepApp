import 'package:flutter/material.dart';
import 'package:RecipeApp/models/meal.dart';
import 'package:RecipeApp/widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> faves;

  const FavoriteScreen({Key key, this.faves}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: faves.length,
      itemBuilder: (BuildContext context, int index) {
        return MealItem(meals: faves, index: index);
      },
    );
  }
}
