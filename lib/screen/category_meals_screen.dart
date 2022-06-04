import 'package:flutter/material.dart';
import 'package:meal_app/item/meals_item.dart';
import '/dummy_data.dart';

class CategoryMealScreen extends StatelessWidget{

  static const String categoryMeal = '/category-meals' ; //Const var for project-scope use

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'].toString();
    final categoryPageId = routeArgs['id'].toString();
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryPageId);
    } ).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle, style: const TextStyle(
          fontSize: 25,
        ),),
      ),
      body : ListView.builder(itemBuilder: (ctx, index){
          //Output the meal
          return MealsItem(title: categoryMeals[index].mealTitle,
              imageUrl: categoryMeals[index].mealImage,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordable);
      },
        itemCount: categoryMeals.length,),
    );
  }

}