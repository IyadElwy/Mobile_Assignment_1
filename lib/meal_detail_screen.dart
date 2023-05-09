import 'package:flutter/material.dart';
import './recipedList.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  MealDetailScreen();

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = RecipesList.recipesList.firstWhere((meal) {
      return meal.id == mealId;
    });

    Widget buildSectionTitle(BuildContext ctx, String title) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          title,
          style: Theme.of(ctx).textTheme.titleMedium,
        ),
      );
    }

    Widget buildContainer(Widget child) {
      return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 150,
        width: 400,
        child: child,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            margin: const EdgeInsets.all(6),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            height: 300,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: Image.network(
                selectedMeal.imageURL,
                fit: BoxFit.cover,
              ),
            ),
          ),
          buildSectionTitle(context, "Ingredients"),
          buildContainer(ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                color: Theme.of(context).accentColor,
                child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(selectedMeal.ingredients[index])),
              );
            },
            itemCount: selectedMeal.ingredients.length,
          )),
          buildSectionTitle(context, "Steps"),
          Text(selectedMeal.steps),
        ]),
      ),
    );
  }
}
