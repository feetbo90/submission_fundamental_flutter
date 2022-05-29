// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'restaurant.dart';

SearchRestaurants searchRestaurantsFromJson(String str) => SearchRestaurants.fromJson(json.decode(str));

String searchRestaurantsToJson(SearchRestaurants data) => json.encode(data.toJson());

class SearchRestaurants {
  SearchRestaurants({
    required this.error,
    required this.founded,
    required this.restaurants,
  });

  bool error;
  int founded;
  List<Restaurant> restaurants;

  factory SearchRestaurants.fromJson(Map<String, dynamic> json) => SearchRestaurants(
    error: json["error"],
    founded: json["founded"],
    restaurants: List<Restaurant>.from(json["restaurants"].map((x) => Restaurant.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "founded": founded,
    "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
  };
}
