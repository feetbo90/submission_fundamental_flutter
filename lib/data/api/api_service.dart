import 'package:submission1_fund_flutter/utils/const_sentences.dart';
import '../model/response/restaurants.dart';
import 'package:http/http.dart' as http;

import '../model/response/search_restaurants.dart';

class ApiService {
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev/';

  Future<Restaurants> getRestaurants() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl + 'list'));
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
      print("ini query " + Uri.parse(_baseUrl + 'search?q=' + query).toString());
      final response = await http.get(Uri.parse(_baseUrl + 'search?q=' + query));
      print("response : " + response.body.toString());
      if (response.statusCode == 200) {
        return searchRestaurantsFromJson(response.body);
      } else {
        throw Exception(ConstSentences.failedData);
      }
    } catch (e) {
      print("ini error " + e.toString());
      throw Exception(e.toString());
    }
  }
}