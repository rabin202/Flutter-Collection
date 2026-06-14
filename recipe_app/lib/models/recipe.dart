class Recipe {
  final String title;
  final String preparationSteps;
  final double cookingTimeInHours;
  final List<String> ingredients;

  Recipe({
    required this.title,
    required this.preparationSteps,
    required this.ingredients,
    required this.cookingTimeInHours,
  });
}