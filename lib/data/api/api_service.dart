import 'package:submission1_fund_flutter/data/model/response/detail_restaurant.dart';
import 'package:submission1_fund_flutter/utils/const_sentences.dart';
import '../../utils/config.dart';
import '../model/response/restaurants.dart';
import 'package:http/http.dart' as http;

import '../model/response/search_restaurants.dart';

class ApiService {

  Future<Restaurants> getRestaurants() async {
    try {
      final response = await http.get(Uri.parse(Config.BASE_URL + 'list'));
      if (response.statusCode == 200) {
        return restaurantsFromJson(response.body);
      } else {
        throw Exception(ConstSentences.failedData);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<SearchRestaurants> search({String query = ""}) async {
    try {
      final response = await http.get(Uri.parse(Config.BASE_URL + 'search?q=' + query));
      if (response.statusCode == 200) {
        return searchRestaurantsFromJson(response.body);
      } else {
        throw Exception(ConstSentences.failedData);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<DetailRestaurant> getDetail(String id) async {
    final response = await http.get(Uri.parse(Config.BASE_URL + 'detail/$id'));
    if (response.statusCode == 200) {
      return detailRestaurantFromJson(response.body);
    } else {
      throw Exception(ConstSentences.failedData);
    }
  }
}