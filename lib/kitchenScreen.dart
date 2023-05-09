import 'package:flutter/material.dart';
import 'category.dart';
import 'recipedList.dart';
import './recipeCard.dart';

class KitchenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Category>;
    final category = routeArgs['category'];
    final recipesInThatCategory = RecipesList.recipesList.where((element) {
      return element.categoryId.contains(category!.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category!.title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return RecipeCard(rec: recipesInThatCategory[index]);
        },
        itemCount: recipesInThatCategory.length,
      ),
    );
  }
}
