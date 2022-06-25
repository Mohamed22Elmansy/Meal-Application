import 'package:flutter/material.dart';
import '../models/meal.dart';

class Meal_Details_Screen extends StatefulWidget {
  static const routeName = "Meal_Details_Screen";
   Function FavouriteMeal;
   Function IsFavourite;
  Meal_Details_Screen(this.FavouriteMeal,this.IsFavourite);

  @override
  _Meal_Details_ScreenState createState() => _Meal_Details_ScreenState();
}

class _Meal_Details_ScreenState extends State<Meal_Details_Screen> {
  @override
  Widget build(BuildContext context) {
    final thisMeal = ModalRoute.of(context).settings.arguments as Meal;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        child: Icon(widget.IsFavourite(thisMeal.id)? Icons.star : Icons.star_border),
        onPressed: (){
         setState(() {
           widget.FavouriteMeal(thisMeal.id);
         });
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          thisMeal.title,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(
                thisMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Title("Ingredients"),
            BuildList(ListView.builder(
              itemBuilder: (_, index) {
                return Card(
                  color: Colors.amber,
                  margin: EdgeInsets.all(5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Text(
                      thisMeal.ingredients[index],
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                );
              },
              itemCount: thisMeal.ingredients.length,
            )),
            Title("Steps"),
            BuildList(ListView.builder(
              itemBuilder: (_, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text("# ${index+1}"),
                      ),
                      title: Text(
                        thisMeal.steps[index],
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    Divider(),
                  ],
                );
              },
              itemCount: thisMeal.steps.length,
            )),
          ],
        ),
      ),
    );
  }
}

Widget Title(String text) {
  return Container(
    margin: EdgeInsets.symmetric(
      vertical: 10,
    ),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 25,
        color: Colors.black,
        fontFamily: "font3",
        fontWeight: FontWeight.w600,
        letterSpacing: 2,
      ),
    ),
  );
}

Widget BuildList(Widget child) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(
        20,
      ),
      border: Border.all(
        color: Colors.black54,
      ),
    ),
    margin: EdgeInsets.symmetric(
      vertical: 10,
    ),
    padding: EdgeInsets.all(6.0),
    width: 230,
    height: 150,
    child: child,
  );
}
