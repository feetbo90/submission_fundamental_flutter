import 'package:flutter/material.dart';
import 'package:submission1_fund_flutter/data/model/response/detail_restaurant.dart';
import 'package:submission1_fund_flutter/data/model/response/restaurants.dart';
import 'package:submission1_fund_flutter/data/model/response/search_restaurants.dart';
import '../api/api_service.dart';

enum ResultState { loading, noData, hasData, hasDataSearch, error }

class RestaurantsProvider extends ChangeNotifier {
  final ApiService apiService;

  RestaurantsProvider({required this.apiService}) {
    _fetchAllRestaurants();
  }

  late Restaurants _restaurantsResult;
  late SearchRestaurants _searchRestaurantsResult;
  late DetailRestaurant _restaurantDetail;

  late ResultState _state;
  String _message = '';
  String _query = "";

  String get message => _message;

  Restaurants get result => _restaurantsResult;

  ResultState get state => _state;

  SearchRestaurants get searchResult => _searchRestaurantsResult;

  DetailRestaurant get detailRestaurant => _restaurantDetail;
  Future<dynamic> _fetchAllRestaurants() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final restaurant = await apiService.getRestaurants();
      if (restaurant.restaurants.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _restaurantsResult = restaurant;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }

  Future<dynamic> _fetchRestaurants() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final response = await apiService.search(query: _query);
      if (response.restaurants.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'No data';
      } else {
        _state = ResultState.hasDataSearch;
        notifyListeners();
        return _searchRestaurantsResult = response;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }

  Future<dynamic> _fetchRestaurant(String id) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final response = await apiService.getDetail(id);
      if (!response.error) {
        _state = ResultState.hasData;
        notifyListeners();
        return _restaurantDetail = response;
      } else {
        _state = ResultState.noData;
        notifyListeners();
        return _message = "No data found";
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }

  RestaurantsProvider getRestaurant(String id) {
    _fetchRestaurant(id);
    return this;
  }

  void onSearch(String query) {
    _query = query;
    if (_query.isEmpty) {
      _fetchAllRestaurants();
    } else {
      _fetchRestaurants();
    }
  }
}