import 'package:RecipeApp/screens/filters_screen.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(80.0),
            child: Center(
              child: Text(
                'Awesome Recipes',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Divider(),
          SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: () => Navigator.of(context).pushReplacementNamed('/'),
            child: ListTile(
              leading: Icon(Icons.restaurant),
              title: Text('Dishes'),
            ),
          ),
          Divider(),
          InkWell(
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(FiltersScreen.routeName),
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text('Filters'),
            ),
          ),
        ],
      ),
    );
  }
}
