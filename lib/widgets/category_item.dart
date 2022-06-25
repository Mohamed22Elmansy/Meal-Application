import 'package:flutter/material.dart';
import '../screens/category_meal_screen.dart';

class Category_Item extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  Category_Item({
    @required this.color,
    @required this.id,
    @required this.title,
  });

  void SelectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      Category_Meal_Screen.routeName,
      arguments: {
        "id": id,
        "title": title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => SelectMeal(context),
      borderRadius: BorderRadius.circular(
        18,
      ) ,
      splashColor: color,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            18,
          ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [color.withOpacity(.7), color],
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      ),
    );
  }
}
