import 'package:flutter/material.dart';

//Import other files
import '/dummy_data.dart';
import '../item/categories_item.dart';

class CategoriesScreen extends StatelessWidget{
  final double widthToHeightRatio = 1.5;

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(8),
        children: DUMMY_CATEGORIES.map(
            (catData) => CategoriesItem(catData.itemId, catData.title, catData.backgroundColor)
        ).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250,
          childAspectRatio: widthToHeightRatio,
          crossAxisSpacing: 20,
          mainAxisExtent: 150,
        ),
      );
  }
  
}