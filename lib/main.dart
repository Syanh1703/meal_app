import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../models/meals.dart';
import './screen/filter_screen.dart';
import './screen/tab_screen.dart';
import './screen/categories_screen.dart';
import './screen/category_meals_screen.dart';
import './screen/meal_details_screen.dart';

void main()
{
  runApp(MealApp());
}
const String appName = 'Meal App';

class MealApp extends StatefulWidget{
  @override
  State<MealApp> createState() => _MealAppState();
}

class _MealAppState extends State<MealApp> {
  //10_06: Store filter that user set
  Map<String,bool> _filterSent = {
    'gluten' : false,
    'lactose': false,
    'vegan' : false,
    'vegetarian': false,
  };

  List<Meals> _availableMeals = DUMMY_MEALS;

  //11_06: List of Favourite Meals
  List<Meals> _favMeals = [];

  void _setFilters(Map<String,bool> filterData){
      setState(() {
        _filterSent = filterData;
        _availableMeals = DUMMY_MEALS.where((meal) {
          if(_filterSent['gluten'] == true && !meal.isGlutenFree){
            return false;
          }
          if(_filterSent['lactose'] == true && !meal.isLactoseFree){
            return false;
          }
          if(_filterSent['vegan'] == true && !meal.isVegan){
            return false;
          }
          if(_filterSent['vegetarian'] == true && !meal.isVegetarian){
            return false;
          }
          return true;
        }).toList();
      });
  }

  void _toggleFavouriteMeal(String id)
  {
      final existingFavMealIndex = _favMeals.indexWhere((index) => index.mealId == id);//Check whether the meal exists in the list
      if (existingFavMealIndex >= 0){
        //11_06: remove the meal
        setState(() {
          _favMeals.removeAt(existingFavMealIndex);
        });
      }
      else
        {
          setState(() {
            _favMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.mealId == id));//11_6: Detect the fav meal by the ID
          });
        }
  }

  //11_06: Check if the meal is chosen favourite or not

  bool _isMealFavourite(String id){
    return _favMeals.any((meal) => meal.mealId == id);
  }
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
          title: appName,
          //home: TabScreen(), //02_06: Entry point of the application
        routes: {
            '/': (ctx) => TabScreen(_favMeals),
            CategoryMealScreen.categoryMeal: (ctx) => CategoryMealScreen(_availableMeals),
            MealDetailsScreen.routeNameMeal:(ctx) => MealDetailsScreen(_toggleFavouriteMeal,_isMealFavourite),
            FilterScreen.filterRouteName: (ctx) => FilterScreen(_setFilters, _filterSent),
        },
        // onGenerateRoute: (settings){ //05_06: Callback when the app navigated to the named route
        //     print(settings.arguments);
        //     return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
        // },
        onUnknownRoute: (settings){//In case the specific route cannot be found
          /**
           * Avoid crash
           */
          return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
        },
        theme: ThemeData(
          appBarTheme: const AppBarTheme(titleTextStyle: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold
          ),
          ),
          primarySwatch: Colors.blueGrey,
          accentColor: Colors.amber,
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
      );
  }
}

class MyMealAppHomePage extends StatefulWidget{
  @override
  _MyMealAppHomePageState createState() {
    return _MyMealAppHomePageState();
  }
}

class _MyMealAppHomePageState extends State<MyMealAppHomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MEAL APP', style: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
      body: const Center(
        child: Text('Navigation Time', style: TextStyle(
          fontSize: 18,
        ),
        ),
      ),
    );
  }
}