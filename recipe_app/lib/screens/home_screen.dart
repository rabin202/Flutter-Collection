import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/recipe_card.dart';
import 'package:recipe_app/screens/add_recipe.dart';


final List<Recipe> recipes = [
  Recipe(
    title: "Margherita Pizza",
    preparationSteps:
    "Prepare the dough, spread tomato sauce evenly, add mozzarella cheese and basil leaves, then bake until the crust turns golden brown.",
    ingredients: [
      "Pizza Dough",
      "Tomato Sauce",
      "Mozzarella Cheese",
      "Basil Leaves",
    ],
    cookingTimeInHours: 1,
  ),

  Recipe(
    title: "Chicken Momo",
    preparationSteps:
    "Mix minced chicken with spices and vegetables, prepare the wrappers, fill and fold the momos, then steam until fully cooked.",
    ingredients: [
      "Chicken Mince",
      "Flour",
      "Onion",
      "Garlic",
      "Ginger",
    ],
    cookingTimeInHours: 2,
  ),

  Recipe(
    title: "Pancakes",
    preparationSteps:
    "Mix flour, eggs, milk, and sugar into a smooth batter. Pour onto a heated pan and cook both sides until golden brown.",
    ingredients: [
      "Flour",
      "Eggs",
      "Milk",
      "Sugar",
      "Butter",
    ],
    cookingTimeInHours: 1,
  ),

  Recipe(
    title: "Spaghetti Carbonara",
    preparationSteps:
    "Cook the spaghetti, fry the bacon, prepare the egg and cheese mixture, then combine everything together while the pasta is hot.",
    ingredients: [
      "Spaghetti",
      "Eggs",
      "Parmesan Cheese",
      "Bacon",
      "Black Pepper",
    ],
    cookingTimeInHours: 1,
  ),

  Recipe(
    title: "Caesar Salad",
    preparationSteps:
    "Wash and chop the lettuce, add croutons and parmesan cheese, then toss everything together with Caesar dressing.",
    ingredients: [
      "Romaine Lettuce",
      "Croutons",
      "Parmesan Cheese",
      "Caesar Dressing",
    ],
    cookingTimeInHours: 1,
  ),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          toolbarHeight: 70,
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 199, 93, 44),
          title: Text("RECIPES",
          style: TextStyle(
            fontSize: 30,
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),),
        ),
          body: ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              return RecipeCard(
                recipe: recipes[index],
                onTap: (){},
              );
            },
          ),
      bottomNavigationBar: BottomNavigationBar(
            currentIndex: 0,
            items: [
            BottomNavigationBarItem(icon: Icon(Icons.home)
            ,label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.add),
            label: "Add Recipe"),

            ],
            onTap: (index) async {
              if (index == 1) {
                final recipe = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddRecipeScreen()));
                if (recipe != null) {
                  setState(() {
                    recipes.add(recipe);
                  });
                }
              }
            }
        )
    );
  }
}
