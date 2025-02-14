import 'package:flutter/material.dart';
import 'package:food_recipe_app/provider/favorite_provider.dart';
import 'package:food_recipe_app/views/recipe_details_screen.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class FoodItemsDisplay extends StatefulWidget {
  final Map<String, dynamic> recipes;
  const FoodItemsDisplay({super.key, required this.recipes});

  @override
  State<FoodItemsDisplay> createState() => _FoodItemsDisplayState();
}

class _FoodItemsDisplayState extends State<FoodItemsDisplay> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeDetailsScreen(recipes: widget.recipes),
          ),
        );
      },

      child: Container(
        // decoration: BoxDecoration(color: Colors.red),
        margin: EdgeInsets.only(right: 10),
        width: 230,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: widget.recipes['img'],
                  child: Container(
                    width: double.infinity,
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(widget.recipes['img']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  widget.recipes['name'],
                  maxLines: 1,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),

                Row(
                  children: [
                    Icon(Iconsax.flash_1, size: 16, color: Colors.grey),
                    Text(
                      "${widget.recipes['cal']} Cal",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      " · ",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.grey,
                      ),
                    ),
                    Icon(Iconsax.clock, size: 16, color: Colors.grey),
                    const SizedBox(width: 5),
                    Text(
                      "${widget.recipes['time']}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // for favorite button
            Positioned(
              right: 5,
              top: 5,
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.white,
                child: InkWell(
                  onTap: () {
                    provider.toggleFavorite(widget.recipes);
                  },
                  child: Icon(
                    provider.isExist(widget.recipes)
                        ? Iconsax.heart5
                        : Iconsax.heart,
                    color:
                        provider.isExist(widget.recipes)
                            ? Colors.red
                            : Colors.black,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
