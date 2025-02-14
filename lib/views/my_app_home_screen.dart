import 'package:flutter/material.dart';
import 'package:food_recipe_app/data/categories_data.dart';
import 'package:food_recipe_app/data/recipes.dart';
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
  List recipeCategories = categorisData;
  String currentCategory = "All";

  List filterableRecipes = recipes;

  @override
  Widget build(BuildContext context) {
    // print("filterable:  ${filterableRecipes}");
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
                            // we have to make a function later
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
                        filterableRecipes
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
          recipeCategories.length,
          (index) => GestureDetector(
            onTap: () {
              setState(() {
                currentCategory = recipeCategories[index];
                filterableRecipes =
                    currentCategory == "All"
                        ? recipes
                        : recipes
                            .where(
                              (recipe) => recipe['category'] == currentCategory,
                            )
                            .toList();
              });
            },

            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color:
                    recipeCategories[index] == currentCategory
                        ? AppColors.kBannerColor
                        : Colors.white,
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              margin: EdgeInsets.only(right: 20),
              child: Text(
                "${categorisData[index]} ",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color:
                      recipeCategories[index] == currentCategory
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
