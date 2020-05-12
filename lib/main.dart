import 'package:flutter/material.dart';

import 'dummy_data.dart';
import 'models/meal.dart';
import 'screens/category_detail_screen.dart';
import 'screens/filters_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/tab_screen.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Meal> _faves = [];
  List<Meal> _availableMeals = DUMMY_MEALS;
  Map<String, bool> _stateFilters = {};

  void _setFilters(Map<String, bool> filteredData) {
    _stateFilters = filteredData;
    setState(() {
      _availableMeals = DUMMY_MEALS.where((meal) {
        // if gluten, display on gluten products
        if (filteredData['gluten'] && !meal.isGlutenFree) return false;
        if (filteredData['lactose'] && !meal.isLactoseFree) return false;
        if (filteredData['vegan'] && !meal.isVegan) return false;
        if (filteredData['veggie'] && !meal.isVegetarian) return false;
        return true;
      }).toList();
    });
  }

  void _toggleFave(String id) {
    // check an item is a favorite already
    final int index = _faves.indexWhere((meal) => meal.id == id);

    // if exists in collection remove it else add it
    if (index >= 0) {
      setState(() {
        _faves.removeAt(index);
      });
    } else {
      setState(() {
        _faves.add(DUMMY_MEALS.firstWhere((meal) => meal.id == id));
      });
    }
  }

  bool _isFave(String id) {
    return _faves.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Demo',
      theme: ThemeData.dark(),
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (_) => TabScreen(favorites: _faves),
        CategoryDetailScreen.routeName: (_) => CategoryDetailScreen(
              availableMeals: _availableMeals,
            ),
        MealDetailScreen.routeName: (_) => MealDetailScreen(
              isFavorite: _isFave,
              toggleFavorites: _toggleFave,
            ),
        FiltersScreen.routeName: (_) => FiltersScreen(
              setFilters: _setFilters,
              savedFilters: _stateFilters,
            ),
      },
    );
  }
}
