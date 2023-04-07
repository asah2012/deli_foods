enum Complexity { Simple, Challenging, Hard }

enum Affordability { Affordable, Pricey, Luxurious }

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> steps;
  final int duration;
  final List<String> ingredients;
  final Complexity complexity;
  final Affordability affordability;
  bool isVegan = true;
  bool isVegetarian = true;
  bool isGlutenFree = true;
  bool isLactoseFree = true;

  Meal(
      {required this.title,
      required this.steps,
      required this.duration,
      required this.complexity,
      required this.affordability,
      required this.ingredients,
      required this.isVegetarian,
      required this.isVegan,
      required this.isGlutenFree,
      required this.isLactoseFree,
      required this.imageUrl,
      required this.id,
      required this.categories});
}
