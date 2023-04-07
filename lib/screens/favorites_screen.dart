import 'package:flutter/material.dart';
import '../model/meals.dart';
import '../widget/meal_item.dart';

class FavoritesScreen extends StatefulWidget {
  static const screenPath = '/favoriteScreen';
  List<Meal> favoriteMeals;
  final Function removeMeal;
  FavoritesScreen(this.favoriteMeals, this.removeMeal);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (ctx, index) {
              return MealItem(
                meal: widget.favoriteMeals[index],
                removeItem: widget.removeMeal,
              );
            },
            itemCount: widget.favoriteMeals.length,
          ),
        ),
      ],
    );
  }
}
