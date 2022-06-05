import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailsScreen extends StatelessWidget{

  static const String routeNameMeal = '/meal_detail';

  Widget _buildSectionPage(String text, BuildContext context){
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Text(text, style: Theme.of(context).textTheme.titleLarge,),
    );
  }


  Widget _buildContainer(Widget subWidget){
    return Container(
      decoration: BoxDecoration(
          color: Colors.white70,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 300,
      width: 300,
      child: subWidget,
    );
  }
  
  Widget _cardBuilder(String input, BuildContext context){
    return Card(
      color: Theme.of(context).accentColor,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(input, style: const TextStyle(
          fontSize: 20
        ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as Map<String,String>;//Receive data to the other screen
    final id = mealId['id'].toString();
    final mealName = mealId['title'].toString();
    final selectedMeal = DUMMY_MEALS.firstWhere((meals) {
      return meals.mealId == id;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(mealName, style: const TextStyle(
          fontSize: 25,
        ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              child: Image.network(selectedMeal.mealImage,
              fit: BoxFit.cover,
              ),
            ),
            _buildSectionPage('Ingredients', context),
            _buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => _cardBuilder(selectedMeal.ingredients[index], context),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            _buildSectionPage('Steps', context),
            _buildContainer(
              ListView.builder(
                  itemBuilder:(ctx, index) => Column(
                    children: <Widget> [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${index + 1}'),
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      const Divider(), //Add the horizontal line
                    ],
                  ),
              itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

}