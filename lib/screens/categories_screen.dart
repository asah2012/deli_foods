import 'package:flutter/material.dart';
import '../widget/category_item.dart';
import '../data/dummy_data.dart';

class CategoriesScreen extends StatefulWidget {
  static const screenPath = '/categories';
  CategoriesScreen();

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: DUMMY_CATEGORIES
          .map((cat) => CategoryItem(cat.id, cat.color, cat.title))
          .toList(),
    );
  }
}
