
enum MealsComplexity {
  Simple,
  Challenging,
  Hard,
}

enum MealsAffordability{
  Affordable,
  Pricey,
  Luxurious
}

class Meals{
  final String mealId;
  final List<String> categories;
  final String mealTitle;
  final String mealImage; //Use network image, not store in the computer locally
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final MealsComplexity complexity;
  final MealsAffordability affordable;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meals(
      {required this.mealId,
      required this.categories,
      required this.mealTitle,
      required this.mealImage,
      required this.ingredients,
      required this.steps,
      required this.duration,
      required this.complexity,
      required this.affordable,
      required this.isGlutenFree,
      required this.isLactoseFree,
      required this.isVegan,
      required this.isVegetarian});
}