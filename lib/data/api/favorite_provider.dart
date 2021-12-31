import 'package:flutter/foundation.dart';
import 'package:restaurant_app/data/model/restaurant_result.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<Restaurant> _favoriteRestaurants = [];
  List<Restaurant> get favoriteRestaurants => _favoriteRestaurants;

  void favorite(Restaurant restaurant) {
    if (!favoriteRestaurants.contains(restaurant)) {
      _favoriteRestaurants.add(restaurant);
    }
    notifyListeners();
  }

  void removeFavorite(Restaurant restaurant) {
    _favoriteRestaurants
        .removeWhere((element) => (element.id == restaurant.id));
    notifyListeners();
  }
}
