import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/category_meal.dart';


class Category_Meal_Screen extends StatefulWidget {
  static const String routeName = "Category_Meal_Screen";
  final List<Meal> availableMeals;
  Category_Meal_Screen(this.availableMeals);

  @override
  _Category_Meal_ScreenState createState() => _Category_Meal_ScreenState();
}

class _Category_Meal_ScreenState extends State<Category_Meal_Screen> {
  Map<String, String> routArg;
  String mealId;
  String mealTitle;
  List<Meal> categoryMeals;

  @override
  void didChangeDependencies() {
    routArg =
    ModalRoute.of(context).settings.arguments as Map<String, String>;
    mealId = routArg["id"];
    mealTitle = routArg["title"];
    categoryMeals=widget.availableMeals.where((meal) {
      return meal.categories.contains(mealId);
    }).toList();
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          mealTitle,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: ListView.builder(itemBuilder: (_,index){
        return Category_Meal_Item(categoryMeals[index]  );
      },
      itemCount: categoryMeals.length,
      ),
    );


  }

}
