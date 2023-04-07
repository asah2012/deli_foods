import 'package:deli_foods/screens/tab_bar_screens.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  FilterScreen({super.key});
  static const screenPath = '/FilterScreen';

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List<Map<String, bool>> selectedFilter = [];

  void _onUpdate(int listIndex, Map<String, bool> selectedItem, bool value) {
    String selectedKey = selectedItem.keys.first;
    selectedItem[selectedKey] = value;
    setState(() {
      selectedFilter.removeAt(listIndex);
      selectedFilter.insert(listIndex, selectedItem);
    });
  }

  void _saveFilter() {
    Navigator.of(context)
        .popAndPushNamed(TabBarScreen.screenPath, arguments: selectedFilter);
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedFilter = [
        {'isVegan': false},
        {'isVegetarian': false},
        {'isGlutenFree': false},
        {'isLactoseFree': false},
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
        actions: [
          IconButton(onPressed: _saveFilter, icon: Icon(Icons.save)),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Search your menus",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (ctx, index) {
              Map<String, bool> selectedItem = selectedFilter[index];
              return SwitchListTile(
                title: Text(selectedItem.keys.first,
                    style: Theme.of(context).textTheme.bodyLarge),
                subtitle: Text(
                  'Select to choose ${selectedItem.keys.first} meal',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                value: selectedItem.values.first,
                onChanged: (value) {
                  _onUpdate(index, selectedItem, value);
                },
              );
            },
            itemCount: selectedFilter.length,
          ))
        ],
      ),
    );
  }
}
