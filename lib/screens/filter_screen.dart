import 'package:flutter/material.dart';
import '../widgets/main_Drawer.dart';

class Filter_Screen extends StatefulWidget {
  final Function function;
  final Map<String , bool> _filters ;

  static const String routeName = "Filter_Screen";

  const Filter_Screen(this.function ,this._filters);



  @override
  _Filter_ScreenState createState() => _Filter_ScreenState();
}

class _Filter_ScreenState extends State<Filter_Screen> {

  bool _GlutenFree = false;
  bool _Vegan = false;
  bool _Vegetarian = false;
  bool _LactoseFree = false;

  Widget BuildSwhichListTile(
      bool value, String title, String subtitle, Function function) {
    return SwitchListTile(
        value: value,
        title: Text(title),
        subtitle: Text(subtitle),
        onChanged: function);
  }
  @override
  void initState() {
    _GlutenFree = widget._filters["GlutenFree"];
    _LactoseFree= widget._filters["LactoseFree"];
    _Vegetarian=widget._filters["Vegetarian"];
    _Vegan=widget._filters["Vegan"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Main_Drawer(),
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              setState(() {
                Map<String , bool> _filters={
                  "GlutenFree" :_GlutenFree,
                  "LactoseFree" : _LactoseFree,
                  "Vegan" : _Vegan,
                  "Vegetarian" : _Vegetarian,
                };
                widget.function(_filters);
              });
              Navigator.of(context).pushReplacementNamed("/");
            },
          ),
        ],
        title: Text(
          "Setting",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontFamily: 'font1',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust Your Meal Selection",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: "font2",
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                BuildSwhichListTile(
                  _GlutenFree,
                  "Gluten Free",
                  "Only Contain Gluten Free Meals",
                  (newvalue) {
                    setState(
                      () {
                        _GlutenFree = newvalue;
                      },
                    );
                  },
                ),
                BuildSwhichListTile(
                  _LactoseFree,
                  "Lactose Free",
                  "Only Contain Lactose Free Meals",
                  (newvalue) {
                    setState(
                      () {
                        _LactoseFree = newvalue;
                      },
                    );
                  },
                ),
                BuildSwhichListTile(
                  _Vegan,
                  "Vegan",
                  "Only Contain Vegan Meals",
                  (newvalue) {
                    setState(
                      () {
                        _Vegan = newvalue;
                      },
                    );
                  },
                ),
                BuildSwhichListTile(
                  _Vegetarian,
                  "Vegetarian",
                  "Only Contain Vegetarian Meals",
                  (newvalue) {
                    setState(
                      () {
                        _Vegetarian = newvalue;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
