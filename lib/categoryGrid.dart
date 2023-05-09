import './categoryCard.dart';
import 'package:flutter/material.dart';
import './categoriesList.dart';

class CategoryGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('El Matbakh'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 30,
        children: CategoryList.categoriesList.map((c) {
          return CategoryCard(cat: c);
        }).toList(),
      ),
    );
  }
}
