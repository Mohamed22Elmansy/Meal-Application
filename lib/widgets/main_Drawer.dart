import 'package:flutter/material.dart';
import '../screens/filter_screen.dart';

class Main_Drawer extends StatelessWidget {
  const Main_Drawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: Column(
        children: [
          Container(

            margin: EdgeInsets.only(bottom: 10),
            width: double.infinity,
            height: 140,
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              "   Cooking UP!!",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontFamily: "font2",
                fontSize: 33,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          BuildListTile(
            "Meals",
            Icons.restaurant,
            () => Navigator.of(context).pushReplacementNamed("/"),
          ),
          BuildListTile(
            "Filters",
            Icons.settings,
            () => Navigator.of(context)
                .pushReplacementNamed(Filter_Screen.routeName),
          ),
        ],
      ),
    );
  }

  Widget BuildListTile(String title, IconData icon, Function function) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios_rounded),
      leading: Icon(
        icon,
        size: 25,
      ),
      onTap: function,
    );
  }
}
