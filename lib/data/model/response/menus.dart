import 'categories.dart';

class Menus {
  Menus({
    required this.foods,
    required this.drinks,
  });

  List<Categories> foods;
  List<Categories> drinks;

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
    foods: List<Categories>.from(json["foods"].map((x) => Categories.fromJson(x))),
    drinks: List<Categories>.from(json["drinks"].map((x) => Categories.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
    "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
  };
}