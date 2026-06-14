import 'package:recipe_app/models/recipe.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/screens/home_screen.dart';


class AddRecipeScreen extends StatefulWidget {
  const AddRecipeScreen({super.key});

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final _formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final ingredientsController = TextEditingController();
  final processController = TextEditingController();
  final cookingTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Add Recipe"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255,250, 129, 47),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsetsGeometry.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(200, 255, 251, 241),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: titleController,
                      decoration: InputDecoration(
                        labelText: 'Recipe Title',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter recipe title';
                        }
                        return null;
                      },
                    ),
                      SizedBox(height: 10,),
                      TextFormField(
                        controller: processController,
                      decoration: InputDecoration(
                        labelText: 'Preparation Process',
                        border: OutlineInputBorder(),
                      ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter preparation process';
                          }
                          return null;
                        },
                      ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: ingredientsController,
                        decoration: InputDecoration(
                          labelText:
                          "Ingredients(e.g 'Milk,Egg,Cashew')",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter ingredients';
                          }
                          return null;
                        },
                        ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: cookingTimeController,
                          decoration: InputDecoration(
                            labelText: 'Cooking Time(in Hours)',
                            border: OutlineInputBorder(),
                          ),
                            validator: (value) {
                              if (value == null || value
                                  .trim()
                                  .isEmpty) {
                                return 'Please enter cooking time';
                              }

                              if (int.tryParse(value) == null && double.tryParse(value)==null) {
                                return 'Enter a valid number';
                              }
                              return null;
                            }
                          ),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Color.fromARGB(255,250, 129, 47),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {

                List<String> ingredients =
                ingredientsController.text
                    .split(',')
                    .map((e) => e.trim())
                    .where((e) => e.isNotEmpty)
                    .toList();

                Recipe newRecipe = Recipe(title: titleController.text,
                    preparationSteps: processController.text,
                    ingredients: ingredients,
                    cookingTimeInHours: double.parse(cookingTimeController.text));
                Navigator.pop(context, newRecipe);

              }
            },
            child: const Text('Save Recipe',
            style: TextStyle(
              color: Colors.white,
            ),),
          )
            ],
      ),
    );
  }
}
