import 'package:flutter/material.dart';
import './1.2%20dummy_data.dart';
import './models/meal.dart';
import './screens/filter_screen.dart';
import './screens/taps_Screen.dart';

import './screens/category_meal_screen.dart';
import './screens/meal_details_screen.dart';
import './screens/category_screen.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "GlutenFree": false,
    "LactoseFree": false,
    "Vegan": false,
    "Vegetarian": false,
  };

  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favouriteMeals = [];

  void FavouriteMeals(String id) {
    final mealIndex = favouriteMeals.indexWhere((meal) {
    return  meal.id == id;
    });
    if (mealIndex >= 0) {
      favouriteMeals.removeAt(mealIndex);
    } else {
      favouriteMeals.add(DUMMY_MEALS.firstWhere((meal) {
       return meal.id == id;
      }));
    }
  }
  bool IsFavourite(String id){
    return favouriteMeals.any((meal ){return meal.id==id;});
  }

  void SetFilters(Map<String, bool> filters) {
    setState(() {
      _filters = filters;
      availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters["GlutenFree"] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters["LactoseFree"] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters["Vegan"] && !meal.isVegan) {
          return false;
        }
        if (_filters["Vegetarian"] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Meal App",
      initialRoute: "/",
      routes: {
        "/": (context) => Taps_Screen(favouriteMeals),
        Category_Meal_Screen.routeName: (context) =>
            Category_Meal_Screen(availableMeals),
        Meal_Details_Screen.routeName: (context) => Meal_Details_Screen(FavouriteMeals,IsFavourite),
        Filter_Screen.routeName: (context) =>
            Filter_Screen(SetFilters, _filters),
      },
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              headline1: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: 'font2',
                  fontWeight: FontWeight.bold),
            ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text(
            "MEAl APP",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontFamily: 'font1',
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Category_Screen(),
      ),
    );
  }
}
