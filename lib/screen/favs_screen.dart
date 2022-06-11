import 'package:flutter/material.dart';
import '../item/meals_item.dart';
import '../models/meals.dart';

class FavouriteTab extends StatelessWidget{

  List<Meals> favouriteMeals = [];
  FavouriteTab(this.favouriteMeals);

  static const favsRouteName = '/favourite';

  final String noFavMeal = 'You have no favourite meals yet';

  @override
  Widget build(BuildContext context) {
    if(favouriteMeals.isEmpty){
      return Center(
        child: Text(noFavMeal, style: TextStyle(
          fontSize: 20,
        ),
        ),
      );
    }
    else
      {
        return ListView.builder(itemBuilder: (ctx, index){
          //Output the meal
          return MealsItem(
            id: favouriteMeals[index].mealId,
            title: favouriteMeals[index].mealTitle,
            imageUrl: favouriteMeals[index].mealImage,
            duration: favouriteMeals[index].duration,
            complexity: favouriteMeals[index].complexity,
            affordability: favouriteMeals[index].affordable,);
        },
          itemCount: favouriteMeals.length,);
      }
  }

}