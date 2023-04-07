import 'package:deli_foods/data/dummy_data.dart';
import 'package:flutter/material.dart';
import '../model/meals.dart';

class FavoriteMealDetail extends StatelessWidget {
  static const screenPath = '/FavoriteMealDetail';
  Function addToFavorite;

  FavoriteMealDetail(this.addToFavorite);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    String mealId = routeArgs['mealId'] as String;
    Meal meal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              child: Image.network(
                meal.imageUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              )),
          Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                  vertical: 5, horizontal: 5),
              child: Text(
                "Ingredients",
                style: Theme.of(context).textTheme.titleLarge,
              )),
          Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 168, 185, 214)),
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Container(
                      child:
                          Text("${index + 1}  : ${meal.ingredients[index]}"));
                },
                itemCount: meal.ingredients.length,
              )),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(
                vertical: 5, horizontal: 5),
            child: Text(
              "Preperation Steps",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 168, 185, 214)),
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Container(
                      child: Text("${index + 1}  : ${meal.steps[index]}"));
                },
                itemCount: meal.steps.length,
              )),
        ],
      ),
      floatingActionButton: Wrap(
        spacing: 20,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.favorite),
            onPressed: () => addToFavorite(meal),
          ),
        ],
      ),
    );
  }
}
