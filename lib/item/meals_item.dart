import 'package:flutter/material.dart';
import 'package:meal_app/models/meals.dart';

class MealsItem extends StatelessWidget{
  final String title;
  final String imageUrl;
  final int duration;
  final MealsComplexity complexity;
  final MealsAffordability affordability;

  MealsItem({
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability
});

  String get complexityText{

    switch(complexity){
      case MealsComplexity.Simple:
        return 'Simple';
      case MealsComplexity.Challenging:
        return 'Challenging';
      case MealsComplexity.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get affordableText{
    switch(affordability){
      case MealsAffordability.Affordable:
        return 'Affordable';
      case MealsAffordability.Pricey:
        return 'Pricey';
      case MealsAffordability.Luxurious:
        return 'Luxurious';
      default:
        return 'Every price is worthy';
    }
  }

  void selectMeal(){}

  final double borderDimension = 15;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: selectMeal,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderDimension),
          ),
          elevation: 4,
          margin: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Stack(
                //Put elements on top of each other
                children: <Widget>[
                  ClipRRect(
                    //04_06: Force the image into a certai form
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(borderDimension),
                      topRight: Radius.circular(borderDimension),
                    ),
                    child: Image.network(
                      imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right : 10,
                    child: Container(
                      width: 280,
                      color: Colors.black54,
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 20,
                      ),
                      child: Text(title, style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      //Duration
                      children: <Widget>[
                        const Icon(
                          Icons.schedule),
                        const SizedBox(
                          width: 8,
                        ),
                        Text('$duration minutes', style: const TextStyle(
                          fontSize: 16,),
                        ),
                      ],
                    ),
                    Row(
                      //Complexity
                      children: <Widget>[
                        const Icon(Icons.work),
                        const SizedBox(width: 8,),
                        Text(complexityText, style: const TextStyle(
                          fontSize: 14,
                        ),
                        ),
                      ],
                    ),
                    Row(
                      //Affordable
                      children: <Widget>[
                        const Icon(Icons.attach_money),
                        const SizedBox(width: 8,),
                        Text(affordableText, style: TextStyle(
                          fontSize: 14,
                        ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }

}