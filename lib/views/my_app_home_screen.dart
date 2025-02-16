import 'package:flutter/material.dart';
import 'package:food_recipe_app/data/categories_data.dart';
import 'package:food_recipe_app/data/recipes_data.dart';
import 'package:food_recipe_app/models/recipe_model.dart';
import 'package:food_recipe_app/utils/app_colors.dart';
import 'package:food_recipe_app/views/view_all_items.dart';
import 'package:food_recipe_app/widgets/banner.dart';
import 'package:food_recipe_app/widgets/food_items_display.dart';
import 'package:food_recipe_app/widgets/my_icon_button.dart';
import 'package:iconsax/iconsax.dart';

class MyAppHomeScreen extends StatefulWidget {
  const MyAppHomeScreen({super.key});

  @override
  State<MyAppHomeScreen> createState() => _MyAppHomeScreenState();
}

class _MyAppHomeScreenState extends State<MyAppHomeScreen> {
  late final List<Recipe> allRecipes = getRecipes();
  List<Recipe> filteredRecipes = [];
  String currentCategory = "All";

  @override
  void initState() {
    super.initState();
    filteredRecipes = allRecipes; // Show all recipes initially
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kbackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    headerParts(),
                    searchBar(),
                    bannerToExplore(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "Categories",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    selectCategory(),
                    SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Quick & Easy",
                          style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 0.1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => ViewAllItems()),
                            );
                          },
                          child: Text(
                            "View all",
                            style: TextStyle(
                              color: AppColors.kBannerColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 5, left: 15),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children:
                        filteredRecipes
                            .map((e) => FoodItemsDisplay(recipes: e))
                            .toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SingleChildScrollView selectCategory() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          categoriesData.length,
          (index) => GestureDetector(
            onTap: () {
              setState(() {
                currentCategory = categoriesData[index].name;

                // Filter recipes based on category
                filteredRecipes =
                    currentCategory == 'All'
                        ? allRecipes
                        : allRecipes
                            .where(
                              (recipe) => recipe.category == currentCategory,
                            )
                            .toList();
              });
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color:
                    categoriesData[index].name == currentCategory
                        ? AppColors.kBannerColor
                        : Colors.white,
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              margin: EdgeInsets.only(right: 20),
              child: Text(
                categoriesData[index].name,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color:
                      categoriesData[index].name == currentCategory
                          ? Colors.white
                          : Colors.grey.shade600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding searchBar() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 22),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          prefixIcon: const Icon(Iconsax.search_normal),
          fillColor: Colors.white,
          border: InputBorder.none,
          hintText: "Search any recipe",
          hintStyle: TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Row headerParts() {
    return Row(
      children: [
        Text(
          "What are you\ncooking today?",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            height: 1,
          ),
        ),
        const Spacer(),
        MyIconButton(icon: Iconsax.notification, pressed: () {}),
      ],
    );
  }
}
