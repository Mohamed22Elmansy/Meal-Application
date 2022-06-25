import 'package:flutter/foundation.dart';

enum Complexity { Simple, Challenging, Hard }
enum Affordability { Luxurious, Affordable, Pricey }

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;
  final Complexity complexity;
  final Affordability affordability;

  const Meal({
    @required this.affordability,
    @required this.categories,
    @required this.complexity,
    @required this.duration,
    @required this.id,
    @required this.imageUrl,
    @required this.ingredients,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
    @required this.steps,
    @required this.title,
  });
}
