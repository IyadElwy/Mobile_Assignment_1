import 'package:assignment_one/meal_detail_screen.dart';

import './recipe.dart';
import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  Recipe rec;
  RecipeCard({required this.rec});

  void goToSpecificRecipe(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetailScreen.routeName,
      arguments: rec.id,
    );
  } //you fill this later

  String getDifficulty(int diff) {
    if (diff == 1) {
      return 'Easy';
    } else if (diff == 2) {
      return 'Medium';
    } else
      return 'Hard';
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => goToSpecificRecipe(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                // child 1 of stack is the recipe image
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    rec.imageURL,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                // child 2 of stack is the recipe title
                Positioned.fill(
                  bottom: 0,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Container(
                      color: Colors.black38,
                      child: Center(
                          child: Text(
                        rec.title,
                        softWrap: true,
                        overflow: TextOverflow.fade,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 30),
                        textAlign: TextAlign.center,
                      )),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(getDifficulty(rec.difficulty)),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.food_bank),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(rec.isVegan ? 'Vegan' : 'Non-Vegan'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.no_food),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(rec.isVegeterian ? 'Vegeterian' : 'Non-Vegeterian')
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
