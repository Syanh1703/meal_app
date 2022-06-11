import 'package:flutter/material.dart';
import '../item/meals_item.dart';
import '../models/meals.dart';

class CategoryMealScreen extends StatefulWidget{

  static const String categoryMeal = '/category-meals' ;

  List<Meals> availableMeals = [];
  CategoryMealScreen(this.availableMeals);

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {

  String categoryTitle = '';
  List<Meals> categoryMeals = [];
  var _isInitialized = false;

  @override
  void initState() {
    //08_06: Did not work with of(context)
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_isInitialized){
      final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'].toString();
      final categoryPageId = routeArgs['id'].toString();
      categoryMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryPageId);
      } ).toList();
      _isInitialized = true;
    }
    super.didChangeDependencies();
  }

 //Const var for project-scope use
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle, style: const TextStyle(
          fontSize: 25,
        ),),
      ),
      body : ListView.builder(itemBuilder: (ctx, index){
          //Output the meal
          return MealsItem(
              id: categoryMeals[index].mealId,
              title: categoryMeals[index].mealTitle,
              imageUrl: categoryMeals[index].mealImage,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordable,);
      },
        itemCount: categoryMeals.length,),
    );
  }
}