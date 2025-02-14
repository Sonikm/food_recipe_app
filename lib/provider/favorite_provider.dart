import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _favoriteRecipes = [];

  List<Map<String, dynamic>> get favorites => _favoriteRecipes;

  // Toggle favorite product state
  void toggleFavorite(Map<String, dynamic> product) {
    String productId = product['id'].toString();

    if (_favoriteRecipes.any(
      (recipe) => recipe['id'].toString() == productId,
    )) {
      _favoriteRecipes.removeWhere(
        (recipe) => recipe['id'].toString() == productId,
      );
    } else {
      _favoriteRecipes.add(product);
    }

    notifyListeners();
  }

  // Check if product exists in favorites
  bool isExist(Map<String, dynamic> product) {
    return _favoriteRecipes.any(
      (recipe) => recipe['id'].toString() == product['id'].toString(),
    );
  }
}
