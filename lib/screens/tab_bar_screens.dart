import 'package:flutter/material.dart';
import '../widget/my_drawer.dart';
import './categories_screen.dart';
import './favorites_screen.dart';

class TabBarScreen extends StatefulWidget {
  static const screenPath = '/tabbarscreen';
  TabBarScreen();

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  int _selectedIndex = 0;
  List<Map<String, bool>> _filters = [];
  List<Map<String, Object>> _pages = [];

  @override
  void didChangeDependencies() {
    setState(() {
      _filters =
          ModalRoute.of(context)?.settings.arguments as List<Map<String, bool>>;
      _pages = [
        {
          "title": 'Delicious Food App',
          "page": CategoriesScreen(_filters),
        },
        {
          "title": "Favorites",
          "page": const FavoritesScreen(),
        }
      ];
    });
    super.didChangeDependencies();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
