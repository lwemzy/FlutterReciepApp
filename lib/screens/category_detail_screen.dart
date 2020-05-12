import 'package:flutter/material.dart';
import 'package:RecipeApp/dummy_data.dart';
import 'package:RecipeApp/models/meal.dart';
import 'package:RecipeApp/widgets/meal_item.dart';

class CategoryDetailScreen extends StatelessWidget {
  static const String routeName = '/category_detail_screen';
  final List<Meal> availableMeals;

  const CategoryDetailScreen({Key key, this.availableMeals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    List<Meal> meals = availableMeals
        .where((meal) => meal.categories.contains(args['id']))
        .toList();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(args['title']),
        ),
        body: ListView.builder(
          itemCount: meals.length,
          itemBuilder: (BuildContext context, int index) {
            return MealItem(meals: meals, index: index);
          },
        ),
      ),
    );
  }

  // InkWell buildInkWell(BuildContext context, List<Meal> meals, int index) {

  // }
}
