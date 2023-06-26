import 'package:deli_foods/screens/favorite_meal_detail_screen.dart';
import 'package:deli_foods/screens/favorites_screen.dart';

import '../model/meals.dart';
import '../screens/filter_screen.dart';
import './data/dummy_data.dart';

import './screens/meal_detail_screen.dart';

import 'screens/categories_detail_screen.dart';

import './screens/tab_bar_screens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _mealList = DUMMY_MEALS;
  List<Meal> _favoriteMealList = [];
  List<Map<String, bool>> _currentFilters = [];

  void _addToFavorite(Meal favoriteMeal) {
    if (!_favoriteMealList.any((meal) => meal.id == favoriteMeal.id)) {
      setState(() {
        _favoriteMealList.add(favoriteMeal);
      });
    }
  }

  void _removeFromFavorite(Meal favoriteMeal) {
    if (_favoriteMealList.any((meal) => meal.id == favoriteMeal.id)) {
      setState(() {
        _favoriteMealList.remove(favoriteMeal);
      });
    }
  }

  void _updateMealList(selectedFilters) {
    print("inside updateMeal list");
    List<Meal> tempMealList = [];
    bool isVeganFilter = selectedFilters[0]['isVegan'] as bool;
    bool isVegetarianFilter = selectedFilters[1]['isVegetarian'] as bool;
    bool isGlutenFreeFilter = selectedFilters[2]['isGlutenFree'] as bool;
    bool isLactoseFreeFilter = selectedFilters[3]['isLactoseFree'] as bool;

    for (int i = 0; i < DUMMY_MEALS.length; i++) {
      if (!isVeganFilter || DUMMY_MEALS[i].isVegan) {
        if (!isVegetarianFilter || DUMMY_MEALS[i].isVegetarian) {
          if (!isGlutenFreeFilter || DUMMY_MEALS[i].isGlutenFree) {
            if (!isLactoseFreeFilter || DUMMY_MEALS[i].isLactoseFree) {
              tempMealList.add(DUMMY_MEALS[i]);
            }
          }
        }
      }
    }
    setState(() {
      _mealList = tempMealList;
      _currentFilters = selectedFilters;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'deliMenu',
      theme: ThemeData(
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: const TextTheme(
            titleLarge: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 18,
                fontWeight: FontWeight.bold),
            bodyLarge: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 16,
                fontWeight: FontWeight.bold),
            bodyMedium: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 14,
                fontWeight: FontWeight.normal)), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink).copyWith(secondary: Colors.amber),
      ),
      //home: const CategoriesScreen(title: 'Delicious Food App'),
      home: TabBarScreen(_favoriteMealList),
      //home : CategoriesScreen(),

      routes: {
        TabBarScreen.screenPath: (ctx) => TabBarScreen(_favoriteMealList),
        CategoryDetailScreen.screenPath: (ctx) =>
            CategoryDetailScreen(_mealList),
        MealDetailScreen.screenPath: (ctx) => MealDetailScreen(_addToFavorite),
        FilterScreen.screenPath: (ctx) =>
            FilterScreen(_currentFilters, _updateMealList),
        FavoriteMealDetail.screenPath: (ctx) =>
            FavoriteMealDetail(_removeFromFavorite),
      },
    );
  }
}

/*
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "DeliFood",
    home: CategoriesScreen(),);

    /*Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(
        child: CategoriesScreen(),
      ),
    );*/
  }
}
*/
