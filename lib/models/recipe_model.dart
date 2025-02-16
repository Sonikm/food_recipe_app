class Recipe {
  final int id;
  final int cal;
  final String category;
  final String img;
  final String name;
  final String rating;
  final String review;
  final String time;
  final List<String> ingredientsImage;
  final List<String> ingredientsName;
  final List<int> ingredientsAmounts;

  Recipe({
    required this.id,
    required this.cal,
    required this.category,
    required this.img,
    required this.name,
    required this.rating,
    required this.review,
    required this.time,
    required this.ingredientsImage,
    required this.ingredientsName,
    required this.ingredientsAmounts,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      cal: json['cal'],
      category: json['category'],
      img: json['img'],
      name: json['name'],
      rating: json['rating'],
      review: json['review'],
      time: json['time'],
      ingredientsImage: List<String>.from(json['ingredientsImage']),
      ingredientsName: List<String>.from(json['ingredientsName']),
      ingredientsAmounts: List<int>.from(json['ingredientsAmounts']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cal': cal,
      'category': category,
      'img': img,
      'name': name,
      'rating': rating,
      'review': review,
      'time': time,
      'ingredientsImage': ingredientsImage,
      'ingredientsName': ingredientsName,
      'ingredientsAmounts': ingredientsAmounts,
    };
  }
}
