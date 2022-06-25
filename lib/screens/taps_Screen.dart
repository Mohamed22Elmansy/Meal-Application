
import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../screens/category_screen.dart';
import '../screens/favourite_screen.dart';
import '../widgets/main_Drawer.dart';

class Taps_Screen extends StatefulWidget {
  final List<Meal> favouriteMeals;
  Taps_Screen(this.favouriteMeals);
  @override
  _Taps_ScreenState createState() => _Taps_ScreenState();
}

class _Taps_ScreenState extends State<Taps_Screen> {
  int selectedScreen = 0;
  List taps ;
  @override
  void initState() {
    taps=[
      {
        "page": Category_Screen(),
        "title": "Categories",
      },
      {
        "page": Favourite_Screen(widget.favouriteMeals),
        "title": "Your Favourite",
      }
    ];
    super.initState();
  }

  void ONTAP(int value) {
    setState(() {
      selectedScreen = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          taps[selectedScreen]["title"],
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontFamily: 'font1',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: taps[selectedScreen]["page"],
      drawer: Main_Drawer(),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 20,
        unselectedFontSize: 10,
        currentIndex: selectedScreen,
        onTap: ONTAP,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favourite",
          ),
        ],
        elevation: 15,

        selectedItemColor: Theme.of(context).accentColor,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(
          fontFamily: "font3",
          letterSpacing: 2,
        ),
      ),
    );
  }
}
