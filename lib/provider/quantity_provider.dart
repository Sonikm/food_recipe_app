import 'package:flutter/material.dart';

class QuantityProvider extends ChangeNotifier {
  int _currentNumber = 1;
  List<double> _baseIngredientAmounts = [];
  int get currentNumber => _currentNumber;

  // Set intial ingredient amounts
  void setBaseIngredients(List<double> amounts) {
    _baseIngredientAmounts = amounts;
    notifyListeners();
  }

  // Update ingredinet amouts based on the quantity
  List<String> get updateIngredientAmouts {
    return _baseIngredientAmounts
        .map<String>((amount) => (amount * _currentNumber).toStringAsFixed(1))
        .toList();
  }

  // increase servings

  void increaseQuantity() {
    _currentNumber++;
    notifyListeners();
  }

  // decrease servings
  void decreaseQuantity() {
    if (_currentNumber > 1) {
      _currentNumber--;
      notifyListeners();
    }
  }
}
