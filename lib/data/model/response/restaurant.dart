import 'package:submission1_fund_flutter/data/model/response/categories.dart';
import 'package:submission1_fund_flutter/data/model/response/customer_review.dart';

import '../../../utils/config.dart';
import 'menus.dart';

class Restaurant {
  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    this.categories,
    this.menus,
    this.customerReviews
  });

  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;
  List<Categories>? categories;
  Menus? menus;
  List<CustomerReview>? customerReviews;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        pictureId: json["pictureId"],
        city: json["city"],
        rating: json["rating"].toDouble(),
        categories: json["categories"] == null
            ? null
            : List<Categories>.from(
                json['categories'].map((x) => Categories.fromJson(x))),
        menus: json["menus"] == null ? null : Menus.fromJson(json["menus"]),
      customerReviews: json["customerReviews"] == null
          ? null
          : List<CustomerReview>.from((json["customerReviews"] as List)
          .map((x) => CustomerReview.fromJson(x))
          .where((review) => review.name.isNotEmpty)));

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "pictureId": pictureId,
        "city": city,
        "rating": rating,
      };

  String getSmallPicture() => Config.IMG_SMALL_URL + this.pictureId;

  String getMediumPicture() => Config.IMG_MEDIUM_URL + this.pictureId;
}
