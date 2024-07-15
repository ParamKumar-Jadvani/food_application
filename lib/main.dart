import 'package:flutter/material.dart';
import 'package:food_application/screens/views/detail_page.dart';
import 'package:food_application/screens/views/favorite_page.dart';
import 'package:food_application/screens/views/home_page.dart';
import 'package:food_application/screens/views/meal_page.dart';
import 'package:food_application/screens/views/recipe_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        'detail_Page': (context) => const DetailPage(),
        'favorite_Page': (context) => const FavoritePage(),
        'recipe_Page': (context) => const RecipePage(),
        'meal_Page': (context) => const MealPage(),
      },
    );
  }
}
