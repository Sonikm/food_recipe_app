import 'package:flutter/material.dart';
import 'package:food_recipe_app/data/recipes.dart';
import 'package:food_recipe_app/utils/app_colors.dart';
import 'package:food_recipe_app/widgets/food_items_display.dart';
import 'package:food_recipe_app/widgets/my_icon_button.dart';
import 'package:iconsax/iconsax.dart';

class ViewAllItems extends StatefulWidget {
  const ViewAllItems({super.key});

  @override
  State<ViewAllItems> createState() => _ViewAllItemsState();
}

class _ViewAllItemsState extends State<ViewAllItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kbackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.kbackgroundColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          SizedBox(width: 15),
          MyIconButton(
            icon: Icons.arrow_back_ios_new,
            pressed: () {
              Navigator.pop(context);
            },
          ),
          Spacer(),
          Text(
            "Quick & Easy",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          MyIconButton(icon: Iconsax.notification, pressed: () {}),
          SizedBox(width: 15),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            SizedBox(height: 10),
            GridView.builder(
              itemCount: recipes.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.74,
              ),
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return Column(
                  children: [
                    FoodItemsDisplay(recipes: recipe),
                    Row(
                      children: [
                        Icon(Iconsax.star1, color: Colors.amberAccent),
                        SizedBox(width: 5),
                        Text(
                          "${recipe["rating"]}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("/5"),
                        SizedBox(width: 5),
                        Text(
                          "${recipe['review'].toString()} Reviews",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
