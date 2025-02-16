import 'package:flutter/material.dart';
import 'package:food_recipe_app/provider/favorite_provider.dart';
import 'package:food_recipe_app/utils/app_colors.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    final favoriteItems = provider.favorites;

    return Scaffold(
      backgroundColor: AppColors.kbackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.kbackgroundColor,
        title: Text("Favorites", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body:
          favoriteItems.isEmpty
              ? Center(
                child: Text(
                  "No favorites yet",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              )
              : ListView.builder(
                itemCount: favoriteItems.length,
                itemBuilder: (context, index) {
                  final favoriteRecipe = favoriteItems[index];

                  return Padding(
                    padding: EdgeInsets.all(15),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          // favoriteRecipe Image
                          Container(
                            width: 100,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage(favoriteRecipe.img),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          // favoriteRecipe Details
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                favoriteRecipe.name,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),

                              Row(
                                children: [
                                  Icon(
                                    Iconsax.flash_1,
                                    size: 16,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    "${favoriteRecipe.cal} Cal",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    " · ",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Icon(
                                    Iconsax.clock,
                                    size: 16,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    favoriteRecipe.time,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Spacer(),
                          // Remove Favorite Button
                          IconButton(
                            icon: Icon(Icons.favorite, color: Colors.red),
                            onPressed: () {
                              provider.toggleFavorite(favoriteRecipe);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
