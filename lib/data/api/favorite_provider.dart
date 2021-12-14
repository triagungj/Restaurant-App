import 'package:flutter/foundation.dart';
import 'package:restaurant_app/data/model/restaurant_result.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<Restaurant> _favoriteRestaurants = [];
  List<Restaurant> get favoriteRestaurants => _favoriteRestaurants;

  void favorite(Restaurant favoriteRestaurant) {
    _favoriteRestaurants.add(favoriteRestaurant);
    notifyListeners();
  }
}
