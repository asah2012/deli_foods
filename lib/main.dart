import 'package:deli_foods/screens/filter_screen.dart';

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
  // This widget is the root of your application.
  //List<Map<String, bool>> filters = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'deliMenu',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
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
                fontWeight: FontWeight.normal)),
      ),
      //home: const CategoriesScreen(title: 'Delicious Food App'),
      home: TabBarScreen(),
      //home : CategoriesScreen(),

      routes: {
        TabBarScreen.screenPath: (ctx) => TabBarScreen(),
        CategoryDetailScreen.screenPath: (ctx) => CategoryDetailScreen(),
        MealDetailScreen.screenPath: (ctx) => MealDetailScreen(),
        FilterScreen.screenPath: (ctx) => FilterScreen(),
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
