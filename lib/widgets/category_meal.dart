import 'package:flutter/material.dart';
import '../screens/meal_details_screen.dart';
import '../models/meal.dart';

class Category_Meal_Item extends StatelessWidget {
  final Meal selectedMeal;


  String get complexcity {
    switch (selectedMeal.complexity) {
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      default:
        return "UnKnown";
        break;
    }
  }

  String get affordability {
    switch (selectedMeal.affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      default:
        return "UnKnown";
        break;
    }
  }

  const Category_Meal_Item(this.selectedMeal  );

  void SelectMeal(BuildContext ctx){
    Navigator.of(ctx).pushNamed(Meal_Details_Screen.routeName,
    arguments: selectedMeal
    );

  }



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> SelectMeal(context),
      child: Card(
        margin: EdgeInsets.all(8),
        elevation: 15,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 110),
                    child: Text(
                      "Loading Image...",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                ClipRRect(
                  child: Image.network(
                    selectedMeal.imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                Positioned(
                  child: Container(
                    color: Colors.black54,
                    padding: EdgeInsets.only(
                      top: 5,
                      left: 10,
                      bottom: 3,
                    ),
                    width: MediaQuery.of(context).size.width/1.5,
                    child: Text(
                      selectedMeal.title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  bottom: 20,
                  right: 8,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      Text(" ${selectedMeal.duration} min"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      Text(" $complexcity"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      Text(affordability),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
