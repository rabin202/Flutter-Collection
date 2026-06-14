import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/screens/single_recipe.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final VoidCallback onTap;
  const RecipeCard({super.key,required this.recipe, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SingleRecipe(singleRecipe:recipe,)),
        );
      },
      child: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: Card(
          color: Color.fromARGB(200, 255, 251, 241),
          child: Container(
            decoration: BoxDecoration(
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Center(child: Text(recipe.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    color: Color.fromARGB(255,250, 129, 47),
                  ),)),
                  Divider(
                    color: Color.fromARGB(255,250, 129, 47),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          spacing: 5,
                          children: [
                            Icon(Icons.alarm),
                            Text("${recipe.cookingTimeInHours} Hrs"),
                          ],
                        ),

                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                    width:100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                                      child: Text(recipe.ingredients[0],textAlign: TextAlign.center,),
                                    )),
                                SizedBox(width: 20,),
                                if(recipe.ingredients.length>1)
                                  Container(
                                  width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                                      child: Text(recipe.ingredients[1],textAlign: TextAlign.center,),
                                    )),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                if(recipe.ingredients.length>2)
                                  Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                                      child: Text(recipe.ingredients[2],textAlign: TextAlign.center,),
                                    )),
                                SizedBox(width: 20,),
                                if(recipe.ingredients.length>=4)
                                  Container(
                                    width: 100,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                                        child: Text(recipe.ingredients[3],textAlign: TextAlign.center,),
                                      )),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
