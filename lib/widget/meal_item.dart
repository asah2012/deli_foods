import 'package:deli_foods/screens/meal_detail_screen.dart';
import 'package:flutter/material.dart';
import '../model/meals.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final Function removeItem;

  const MealItem({required this.meal, required this.removeItem});

  selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailScreen.screenPath, arguments: {
      'mealId': meal.id
    }).then((result) => {if (result != null) removeItem(result)});
  }

  String get complexityText {
    switch (meal.complexity) {
      case Complexity.Simple:
        return "Simple";
      case Complexity.Hard:
        return "Hard";
      case Complexity.Challenging:
        return "Challenging";
      default:
        return "Unknown";
    }
  }

  String get affordabilityText {
    switch (meal.affordability) {
      case Affordability.Affordable:
        return "Affordable";
      case Affordability.Pricey:
        return "Pricey";
      case Affordability.Luxurious:
        return "Expensive";
      default:
        return "Unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(
                      meal.imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )),
                Positioned(
                    bottom: 10,
                    right: 5,
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: Text(
                        meal.title,
                        softWrap: true,
                        style: const TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            backgroundColor: Colors.black45,
                            color: Colors.white),
                      ),
                    )),
              ],
            ),
            const Padding(padding: EdgeInsets.fromLTRB(30, 10, 0, 0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    const Padding(padding: EdgeInsets.all(2)),
                    const Icon(
                      Icons.schedule,
                    ),
                    const Padding(padding: EdgeInsets.all(2)),
                    Text(meal.duration.toString(),
                        style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.work, color: Colors.black38),
                    const Padding(padding: EdgeInsets.all(2)),
                    Text(complexityText,
                        style: Theme.of(context).textTheme.bodyLarge)
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.attach_money, color: Colors.black38),
                    const Padding(padding: EdgeInsets.all(2)),
                    Text(affordabilityText,
                        style: Theme.of(context).textTheme.bodyLarge),
                    const Padding(padding: EdgeInsets.all(2)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
