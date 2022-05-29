import 'package:flutter/foundation.dart';
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
    required this.categories,
    required this.menus,
    required this.customerReviews
  });

  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;
  List<Categories> categories;
  Menus menus;
  List<CustomerReview> customerReviews;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    pictureId: json["pictureId"],
    city: json["city"],
    rating: json["rating"].toDouble(),
    menus: json['menus'] == null ? null : Menus.fromJson(json['menus']),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "pictureId": pictureId,
    "city": city,
    "rating": rating,
  };

  String getSmallPicture() => Config.IMG_SMALL_URL + this.pictureId;

}