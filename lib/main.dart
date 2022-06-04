import 'package:flutter/material.dart';
import 'package:meal_app/screen/category_meals_screen.dart';
import './screen/categories_screen.dart';
import './screen/category_meals_screen.dart';

void main()
{
  runApp(MealApp());
}
const String appName = 'Meal App';

class MealApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
          title: appName,
          home: CategoriesScreen(), //02_06: Entry point of the application
        routes: {
            CategoryMealScreen.categoryMeal: (ctx) => CategoryMealScreen()
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