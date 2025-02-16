class RecipeCategory {
  final String name;

  const RecipeCategory({required this.name});
}

const List<RecipeCategory> categoriesData = [
  RecipeCategory(name: "All"),
  RecipeCategory(name: "Dinner"),
  RecipeCategory(name: "Lunch"),
  RecipeCategory(name: "Breakfast"),
];
