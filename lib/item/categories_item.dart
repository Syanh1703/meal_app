import 'package:flutter/material.dart';
import '../screen/category_meals_screen.dart';

class CategoriesItem extends StatelessWidget{
  final String id;
  final String categoryTitle;
  final Color categoryColor;

  CategoriesItem(this.id, this.categoryTitle, this.categoryColor);

  void categoryMenu(BuildContext ctx){
    //Use Navigator
    Navigator.of(ctx).pushNamed(
      CategoryMealScreen.categoryMeal, arguments: {
        'id': id,
        'title':categoryTitle
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //02_06: Allow the user to tap on the object
      onTap: () => categoryMenu(context),//02_06: Navigate to the different page
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(13),
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.fromLTRB(5, 8, 5, 8),
        child: Text(categoryTitle, style: Theme.of(context).textTheme.titleLarge,),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              categoryColor.withOpacity(0.7),
              categoryColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          ),
              borderRadius: BorderRadius.circular(13),
        ),
      ),
    );
  }

}