import 'dart:convert';

import 'restaurant.dart';

DetailRestaurant detailRestaurantFromJson(String str) => DetailRestaurant.fromJson(json.decode(str));

String detailRestaurantToJson(DetailRestaurant data) => json.encode(data.toJson());

class DetailRestaurant {
  DetailRestaurant({
    required this.error,
    required this.message,
    required this.restaurant,
  });

  bool error;
  String message;
  Restaurant restaurant;

  factory DetailRestaurant.fromJson(Map<String, dynamic> json) => DetailRestaurant(
    error: json["error"],
    message: json["message"],
    restaurant: Restaurant.fromJson(json["restaurant"]),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "restaurant": restaurant.toJson(),
  };
}


