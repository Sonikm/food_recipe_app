import 'package:flutter/material.dart';
import 'package:food_recipe_app/provider/favorite_provider.dart';
import 'package:food_recipe_app/provider/quantity_provider.dart';
import 'package:food_recipe_app/utils/app_colors.dart';
import 'package:food_recipe_app/widgets/my_icon_button.dart';
import 'package:food_recipe_app/widgets/quantity_increment_decrements.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class RecipeDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> recipes;
  const RecipeDetailsScreen({super.key, required this.recipes});

  @override
  State<RecipeDetailsScreen> createState() => _RecipeDetailsScreenState();
}

class _RecipeDetailsScreenState extends State<RecipeDetailsScreen> {
  // initialize base ingredient amounts in the provider
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      List<double> baseAmounts =
          widget.recipes['ingredientsAmounts']
              .map<double>((amount) => double.parse(amount.toString()))
              .toList();

      Provider.of<QuantityProvider>(
        context,
        listen: false,
      ).setBaseIngredients(baseAmounts);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    final quantityProvider = Provider.of<QuantityProvider>(context);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: startCookingAndFavoriteButton(provider),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: widget.recipes['img'],
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2.1,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(widget.recipes['img']),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 10,
                  right: 10,
                  child: Row(
                    children: [
                      MyIconButton(
                        icon: Icons.arrow_back_ios_new,
                        pressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Spacer(),
                      MyIconButton(icon: Iconsax.notification, pressed: () {}),
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 396,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),

            Center(
              child: Container(
                width: 40,
                height: 8,
                decoration: BoxDecoration(color: Colors.grey.shade300),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.recipes['name'],
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Iconsax.flash_1, size: 20, color: Colors.grey),
                      Text(
                        "${widget.recipes['cal']} Cal",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
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
                      Icon(Iconsax.clock, size: 20, color: Colors.grey),
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
                  SizedBox(height: 10),
                  // for rating
                  Row(
                    children: [
                      Icon(Iconsax.star1, color: Colors.amberAccent),
                      SizedBox(width: 5),
                      Text(
                        "${widget.recipes["rating"]}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("/5"),
                      SizedBox(width: 5),
                      Text(
                        "${widget.recipes['review'].toString()} Reviews",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ingredients",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 10),
                          Text(
                            "How many servings?",
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                      Spacer(),
                      QuantityIncrementDecrements(
                        currentNumber: quantityProvider.currentNumber,
                        onAdd: () => quantityProvider.increaseQuantity(),
                        onRemove: () => quantityProvider.decreaseQuantity(),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),
                  // List of ingredients
                  Column(
                    children: [
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // ingredients image
                          Column(
                            children:
                                widget.recipes['ingredientsImage']
                                    .map<Widget>(
                                      (imageUrl) => Container(
                                        height: 60,
                                        width: 60,
                                        margin: EdgeInsets.only(bottom: 10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          image: DecorationImage(
                                            image: AssetImage(imageUrl),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                          ),
                          SizedBox(width: 20),
                          // ingredients Names
                          Column(
                            children:
                                widget.recipes['ingredientsName']
                                    .map<Widget>(
                                      (name) => Container(
                                        height: 60,
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: Center(
                                          child: Text(
                                            name,
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey.shade400,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                          ),
                          // SizedBox(width: 20),
                          // ingredients amounts
                          Spacer(),
                          Column(
                            children:
                                quantityProvider.updateIngredientAmouts
                                    .map<Widget>(
                                      (amount) => Container(
                                        height: 60,
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: Center(
                                          child: Text(
                                            "$amount gm",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey.shade400,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  FloatingActionButton startCookingAndFavoriteButton(
    FavoriteProvider provider,
  ) {
    return FloatingActionButton.extended(
      onPressed: () {},
      backgroundColor: Colors.transparent,
      elevation: 0,
      label: Row(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.kprimaryColor,
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 13),
              foregroundColor: Colors.white,
            ),
            onPressed: () {},
            child: Text(
              "Start Cooking",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ),
          SizedBox(width: 10),
          IconButton(
            style: IconButton.styleFrom(
              shape: CircleBorder(
                side: BorderSide(color: Colors.grey.shade300, width: 2),
              ),
            ),
            onPressed: () {
              provider.toggleFavorite(widget.recipes);
            },
            icon: Icon(
              provider.isExist(widget.recipes) ? Iconsax.heart5 : Iconsax.heart,
              color:
                  provider.isExist(widget.recipes) ? Colors.red : Colors.black,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }
}
