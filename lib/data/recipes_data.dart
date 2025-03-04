import 'package:food_recipe_app/models/recipe_model.dart';

const List<Map<String, dynamic>> recipesJson = [
  {
    "id": 1,
    "cal": 100,
    "category": "Dinner",
    "img": "assets/recipe_images/recipe_img1.jpg",
    "name": "Tandoori-rubbed pumpkin",
    "rating": "5",
    "review": "38",
    "time": "40 mins",
    "ingredientsImage": [
      "assets/ingredient_images/ingredient_img16.jpg",
      "assets/ingredient_images/ingredient_img5.jpg",
      "assets/ingredient_images/ingredient_img6.jpg",
      "assets/ingredient_images/ingredient_img7.jpg",
    ],
    "ingredientsName": ["Pumpkin", "Tomato", "Garlic", "Oil"],
    "ingredientsAmounts": [200, 20, 10, 10],
  },
  {
    "id": 2,
    "cal": 200,
    "category": "Lunch",
    "img": "assets/recipe_images/recipe_img4.jpg",
    "name": "Pasta",
    "rating": "4",
    "review": "59",
    "time": "20 mins",
    "ingredientsImage": [
      "assets/ingredient_images/ingredient_img4.jpg",
      "assets/ingredient_images/ingredient_img5.jpg",
      "assets/ingredient_images/ingredient_img6.jpg",
      "assets/ingredient_images/ingredient_img7.jpg",
    ],
    "ingredientsName": ["Pasta", "Tomato", "Garlic", "Oil"],
    "ingredientsAmounts": [200, 20, 10, 10],
  },
  {
    "id": 3,
    "cal": 350,
    "category": "Dinner",
    "img": "assets/recipe_images/recipe_img8.jpg",
    "name": "Spicy Chicken Curry",
    "rating": "4.7",
    "review": "15",
    "time": "35 mins",
    "ingredientsImage": [
      "assets/ingredient_images/ingredient_img12.jpg",
      "assets/ingredient_images/ingredient_img5.jpg",
      "assets/ingredient_images/ingredient_img7.jpg",
      "assets/ingredient_images/ingredient_img13.jpg",
      "assets/ingredient_images/ingredient_img3.jpg",
    ],
    "ingredientsName": ["Chicken", "Tomatoes", "Oil", "Garlics", "Onion"],
    "ingredientsAmounts": [150, 30, 10, 10, 50],
  },
  {
    "id": 4,
    "cal": 350,
    "category": "Lunch",
    "img": "assets/recipe_images/recipe_img2.jpg",
    "name": "Chole bhature",
    "rating": "4.8",
    "review": "50",
    "time": "40 mins",
    "ingredientsImage": [
      "assets/ingredient_images/ingredient_img1.jpg",
      "assets/ingredient_images/ingredient_img2.jpg",
      "assets/ingredient_images/ingredient_img3.jpg",
    ],
    "ingredientsName": ["chickpea ", "Flour", "Onion"],
    "ingredientsAmounts": [180, 100, 150],
  },
  {
    "id": 8,
    "cal": 350,
    "category": "Lunch",
    "img": "assets/recipe_images/recipe_img3.jpg",
    "name": "Masala Dosa",
    "rating": "4.8",
    "review": "50",
    "time": "40 mins",
    "ingredientsImage": [
      "assets/ingredient_images/ingredient_img1.jpg",
      "assets/ingredient_images/ingredient_img2.jpg",
      "assets/ingredient_images/ingredient_img3.jpg",
    ],
    "ingredientsName": ["Rice", "Urad Dal", "Potato"],
    "ingredientsAmounts": [100, 100, 150],
  },

  {
    "id": 5,
    "cal": 200,
    "category": "Breakfast",
    "img": "assets/recipe_images/recipe_img5.jpg",
    "name": "Grits and Eggs",
    "rating": "5",
    "review": "30",
    "time": "15 mins",
    "ingredientsImage": [
      "assets/ingredient_images/ingredient_img9.jpg",
      "assets/ingredient_images/ingredient_img7.jpg",
      "assets/ingredient_images/ingredient_img10.jpg",
    ],
    "ingredientsName": ["Egg", "Oil", "Cheese"],
    "ingredientsAmounts": [4, 20, 30],
  },
  {
    "id": 6,
    "cal": 180,
    "category": "Breakfast",
    "img": "assets/recipe_images/recipe_img6.jpg",
    "name": "Aloo Paratha",
    "rating": "99",
    "review": "30",
    "time": "40 mins",
    "ingredientsImage": [
      "assets/ingredient_images/ingredient_img7.jpg",
      "assets/ingredient_images/ingredient_img2.jpg",
      "assets/ingredient_images/ingredient_img3.jpg",
    ],
    "ingredientsName": ["Oil", "Flour", "Onion"],
    "ingredientsAmounts": [20, 100, 10],
  },

  {
    "id": 7,
    "cal": 450,
    "category": "Dinner",
    "img": "assets/recipe_images/recipe_img7.jpg",
    "name": "Butter Paneer",
    "rating": "5",
    "review": "30",
    "time": "40 mins",
    "ingredientsImage": [
      "assets/ingredient_images/ingredient_img11.jpg",
      "assets/ingredient_images/ingredient_img7.jpg",
      "assets/ingredient_images/ingredient_img10.jpg",
    ],
    "ingredientsName": ["Paneer", "Oil", "Butter"],
    "ingredientsAmounts": [100, 20, 50],
  },

  {
    "id": 9,
    "cal": 280,
    "category": "Breakfast",
    "img": "assets/recipe_images/recipe_img9.jpg",
    "name": "Avocado Toast",
    "rating": "4.8",
    "review": "22",
    "time": "10 mins",
    "ingredientsImage": [
      "assets/ingredient_images/ingredient_img14.jpg",
      "assets/ingredient_images/ingredient_img15.jpg",
    ],
    "ingredientsName": ["Bread", "Avocado"],
    "ingredientsAmounts": [2, 1],
  },
];

List<Recipe> getRecipes() {
  return recipesJson.map((json) => Recipe.fromJson(json)).toList();
}
