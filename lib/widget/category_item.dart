import '../screens/categories_detail_screen.dart';

import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final Color color;
  final String title;
  final String id;

  CategoryItem(this.id, this.color, this.title);

  void selectedCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryDetailScreen.screenPath,
        arguments: {'categoryId': id});

    // Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
    //   return CategoryDetailScreen();
    // }));
  }

  @override
  Widget build(BuildContext context) {
    print("inside categoryItem build");
    return InkWell(
      onTap: () => {selectedCategory(context)},
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
