import 'package:flutter/material.dart';
import '../widgets/category_meal.dart';
import '../models/meal.dart';

class Favourite_Screen extends StatelessWidget {
  List<Meal> favouriteMeals;

  Favourite_Screen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: favouriteMeals.isEmpty
          ? Center(
              child: Text(
                "You Have No Favourite Meals , Please Add Your Favourite !",
                style: TextStyle(fontSize: 25, fontFamily: "font3",),
                textAlign: TextAlign.center,
              ),
            )
          : ListView.builder(
              itemBuilder: (_, index) {
                return Category_Meal_Item(favouriteMeals[index]);
              },
              itemCount: favouriteMeals.length,
            ),
    );
  }
}
