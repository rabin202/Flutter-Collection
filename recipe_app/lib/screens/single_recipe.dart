import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe.dart';

class SingleRecipe extends StatelessWidget {
  final Recipe singleRecipe;
  SingleRecipe({super.key,required this.singleRecipe});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        automaticallyImplyActions: false,
        backgroundColor: Color.fromARGB(255, 199, 93, 44),
        title: Text(singleRecipe.title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),),
        centerTitle: true,
      ) ,
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(200, 255, 251, 241),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Preparation:",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),),
              SizedBox(height: 10,),
              Text(singleRecipe.preparationSteps,
              style: TextStyle(
                fontSize: 25,
              ),),
              SizedBox(height: 10,),
              Text("Cooking Time:",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),),
              Text("${singleRecipe.cookingTimeInHours} Hrs",
              style: TextStyle(
                fontSize: 25,
              ),),
              SizedBox(height: 10,),
              Text("Ingredients:",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),),
              for(String ingredient in singleRecipe.ingredients)
                Text(ingredient,
                style: TextStyle(
                  fontSize: 25
                ),),

            ],
          ),
        ),
      ),
    );
  }
}
