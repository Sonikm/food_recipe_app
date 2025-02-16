import 'package:flutter/material.dart';
import 'package:food_recipe_app/models/recipe_model.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<Recipe> _favoriteRecipes = [];

  List<Recipe> get favorites => _favoriteRecipes;

  // Toggle favorite product state
  void toggleFavorite(Recipe product) {
    String productId = product.id.toString();

    if (_favoriteRecipes.any((recipe) => recipe.id.toString() == productId)) {
      _favoriteRecipes.removeWhere(
        (recipe) => recipe.id.toString() == productId,
      );
    } else {
      _favoriteRecipes.add(product);
    }

    notifyListeners();
  }

  // Check if product exists in favorites
  bool isExist(Recipe product) {
    return _favoriteRecipes.any(
      (recipe) => recipe.id.toString() == product.id.toString(),
    );
  }
}
