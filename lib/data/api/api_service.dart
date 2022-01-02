import 'dart:convert';

import 'package:restaurant_app/data/model/detail_restaurant_result.dart';
import 'package:restaurant_app/data/model/restaurant_result.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev/';
  static const String basePictureUrl =
      'https://restaurant-api.dicoding.dev/images/medium/';

  Future<RestaurantsResult> fetchRestaurants() async {
    final response = await http.get(Uri.parse(_baseUrl + "list"));
    if (response.statusCode == 200) {
      return RestaurantsResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load restaurants');
    }
  }

  Future<DetailRestaurantsResult> fetchDetailRestaurant(
      String _idRestaurant) async {
    final response =
        await http.get(Uri.parse(_baseUrl + 'detail/' + _idRestaurant));
    if (response.statusCode == 200) {
      return DetailRestaurantsResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load restaurants');
    }
  }

  Future<SearchRestaurantsResult> searchRestaurant(String _query) async {
    final response = await http.get(Uri.parse(_baseUrl + 'search?q=' + _query));
    if (response.statusCode == 200) {
      return SearchRestaurantsResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load restaurants');
    }
  }
}
