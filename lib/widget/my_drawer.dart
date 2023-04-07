import 'package:deli_foods/screens/categories_screen.dart';
import 'package:deli_foods/screens/tab_bar_screens.dart';
import 'package:flutter/material.dart';
import '../screens/categories_detail_screen.dart';
import '../screens/filter_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.blueAccent,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child:
                  Text('Menu', style: Theme.of(context).textTheme.titleLarge),
            ),
            ListTile(
                title: Text(
                  'Meals',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                onTap: () => Navigator.of(context)
                    .pushReplacementNamed(TabBarScreen.screenPath)),
            ListTile(
                title: Text(
                  'Filters',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                onTap: () =>
                    Navigator.of(context).pushNamed(FilterScreen.screenPath)),
          ],
        ));
  }
}
