import 'package:flutter/material.dart';
import 'package:RecipeApp/dummy_data.dart';
import 'package:RecipeApp/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = '/meal_detail_screen';
  final Function isFavorite;
  final Function toggleFavorites;

  const MealDetailScreen({
    Key key,
    this.isFavorite,
    this.toggleFavorites,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String args = ModalRoute.of(context).settings.arguments;

    List<Meal> meal = DUMMY_MEALS.where((val) => val.id == args).toList();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '${meal[0].title}',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Card(
                  child: Image.network(
                    meal[0].imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Ingredients',
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  height: 10,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: meal[0].ingredients.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${meal[0].ingredients[index]}'),
                    );
                  },
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Steps',
                  style: TextStyle(fontSize: 25),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: meal[0].steps.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          '# ${index + 1}',
                          style: Theme.of(context).textTheme.body1,
                        ),
                        backgroundColor: Colors.amber,
                      ),
                      title: Text(
                        '${meal[0].steps[index]}',
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => toggleFavorites(meal[0].id),
          backgroundColor: Colors.amber,
          child: Icon(isFavorite(meal[0].id) ? Icons.star : Icons.star_border),
        ),
      ),
    );
  }
}
