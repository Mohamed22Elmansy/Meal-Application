import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../1.2 dummy_data.dart';

class Category_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: GridView(
        padding: EdgeInsets.all(15),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
        ),
        children: DUMMY_CATEGORIES
            .map((catItem) => Category_Item(
                  color: catItem.color,
                  id: catItem.id,
                  title: catItem.title,
                ))
            .toList(),
      ),
    );
  }
}
