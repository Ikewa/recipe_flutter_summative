import 'package:flutter/material.dart';
import 'ingredient_item.dart';

class IngredientList extends StatelessWidget {
  final List<dynamic> ingredients;
  const IngredientList({super.key, required this.ingredients});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: ingredients.length,
      itemBuilder: (context, index) {
        // Safely extract data with fallback values
        int quantity = (ingredients[index]['quantityt'] as num?)?.toInt() ?? 1;
        String imageUrl = ingredients[index]['image'] ?? '';
        String measure = ingredients[index]['measure'] ?? 'N/A';
        String food = ingredients[index]['food'] ?? 'Unknown';

        return IngredientItem(
          quantity: quantity.toString(),
          imageUrl: imageUrl,
          measure: measure,
          food: food,
        );
      },
    );
  }
}
