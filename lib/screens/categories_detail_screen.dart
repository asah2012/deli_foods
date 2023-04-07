import 'package:deli_foods/data/dummy_data.dart';
import 'package:deli_foods/model/category.dart';
import 'package:deli_foods/model/meals.dart';
import 'package:deli_foods/widget/meal_item.dart';
import 'package:flutter/material.dart';

class CategoryDetailScreen extends StatefulWidget {
  static const screenPath = '/categoryDetails';
  List<Meal> _mealList;
  CategoryDetailScreen(this._mealList);

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  String _categoryTitle = "";
  bool _isMealDeleted = false;
  String _removedMealTitle = '';

  void removeMeal(Meal mealToRemove) {
    setState(() {
      _isMealDeleted = true;
      _removedMealTitle = mealToRemove.title;
      widget._mealList.removeWhere((meal) => meal.id == mealToRemove.id);
    });
    print("removeMeal is called, length : ${widget._mealList.length}");
  }

  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    String categoryId = args != null ? args['categoryId'] as String : '';
    print("inside categoryDetail screen $categoryId");
    Categories selectedCategory =
        DUMMY_CATEGORIES.where((category) => category.id == categoryId).first;
    _categoryTitle = selectedCategory.title;

    List<Meal> displayMeals = [];
    for (int i = 0; i < widget._mealList.length; i++) {
      List<String> mealCategoryIds = widget._mealList[i].categories;
      if (mealCategoryIds
          .any((mealCategoryId) => mealCategoryId == categoryId)) {
        displayMeals.add(widget._mealList[i]);
      }
    }

    /* List<Meal> displayMeals = widget._mealList.where((meal) => meal.categories
        .any((mealCategoryId) => mealCategoryId == categoryId)) as List<Meal>; */

    return Scaffold(
      appBar: AppBar(title: Text(_categoryTitle)),
      body: Column(
        children: [
          if (_isMealDeleted) Text('$_removedMealTitle has been Deleted'),
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return MealItem(
                  meal: displayMeals[index],
                  removeItem: removeMeal,
                );
              },
              itemCount: displayMeals.length,
            ),
          ),
        ],
      ),
      /* Column(
            children: mealIdList.map((meal) => MealItem(meal: meal)).toList())*/
    );
  }
}
