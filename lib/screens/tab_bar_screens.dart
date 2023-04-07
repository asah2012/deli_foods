import 'package:flutter/material.dart';
import '../widget/my_drawer.dart';
import './categories_screen.dart';
import './favorites_screen.dart';
import '../model/meals.dart';

class TabBarScreen extends StatefulWidget {
  static const screenPath = '/tabbarscreen';
  List<Meal> _favoriteMealList;
  TabBarScreen(this._favoriteMealList);

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  int _selectedIndex = 0;
  List<Map<String, Object>> _pages = [];

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    _pages = [
      {
        "title": 'Delicious Food App',
        "page": CategoriesScreen(),
      },
      {
        "title": "Favorites",
        "page": FavoritesScreen(widget._favoriteMealList, () {}),
      }
    ];
    String _title = _pages[_selectedIndex]['title'] as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      drawer: MyDrawer(),
      body: _pages[_selectedIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          currentIndex: _selectedIndex,
          items: const [
            BottomNavigationBarItem(
              label: 'Category',
              icon: Icon(Icons.category),
            ),
            BottomNavigationBarItem(
                label: 'Favorites', icon: Icon(Icons.favorite)),
          ]),
    );
  }
}
