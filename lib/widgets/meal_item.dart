import 'package:flutter/material.dart';
import 'package:RecipeApp/models/meal.dart';
import 'package:RecipeApp/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final List<Meal> meals;
  final int index;

  const MealItem({
    Key key,
    this.meals,
    this.index,
  }) : super(key: key);

  String itemComplexity(Complexity item) {
    if (item == Complexity.Simple)
      return 'Simple';
    else if (item == Complexity.Hard)
      return 'Hard';
    else if (item == Complexity.Challenging)
      return 'Challenging';
    else
      return 'Unknown';
  }

  String itemAffordability(Affordability item) {
    if (item == Affordability.Affordable)
      return 'Affordable';
    else if (item == Affordability.Luxurious)
      return 'Luxurious';
    else if (item == Affordability.Pricey)
      return 'Expensive';
    else
      return 'Unknown';
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // show meal recipe and instructions
      onTap: () => Navigator.of(context)
          .pushNamed(MealDetailScreen.routeName, arguments: meals[index].id),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image.network(
                      meals[index].imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      color: Colors.white30,
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        '${meals[index].title}',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.schedule),
                        SizedBox(
                          width: 6,
                        ),
                        Text('${meals[index].duration} min'),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.work),
                        SizedBox(
                          width: 6,
                        ),
                        Text(itemComplexity(meals[index].complexity)),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.attach_money),
                        SizedBox(
                          width: 6,
                        ),
                        Text(itemAffordability(meals[index].affordability)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
