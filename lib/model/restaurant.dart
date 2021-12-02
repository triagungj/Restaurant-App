import 'dart:convert';

class Restaurant {
  late String id;
  late String name;
  late String description;
  late String pictureId;
  late String city;
  late String rating;
  late Menu? menu;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menu,
  });

  Restaurant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    pictureId = json['pictureId'];
    city = json['city'];
    rating = json['rating'].toString();
    if (json['menus'] != null) {
      menu = Menu.fromJson(json['menus']);
    } else {
      menu = null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['pictureId'] = pictureId;
    data['city'] = city;
    data['rating'] = rating;
    data['menus'] = menu!.toJson();
    return data;
  }
}

class Menu {
  late List<Foods> foods;
  late List<Drinks> drinks;

  Menu({required this.foods, required this.drinks});

  Menu.fromJson(Map<String, dynamic> json) {
    if (json['foods'] != null) {
      foods = [];
      json['foods'].forEach((v) {
        foods.add(Foods.fromJson(v));
      });
    }
    if (json['drinks'] != null) {
      drinks = [];
      json['drinks'].forEach((v) {
        drinks.add(Drinks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['foods'] = foods.map((v) => v.toJson()).toList();
    data['drinks'] = drinks.map((v) => v.toJson()).toList();
    return data;
  }
}

class Foods {
  late String name;

  Foods({required this.name});

  Foods.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}

class Drinks {
  late String name;

  Drinks({required this.name});

  Drinks.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}

List<Restaurant> parseRestaurants(String? json) {
  if (json == null) {
    return [];
  }

  final List parsed = jsonDecode(json);
  return parsed.map((json) => Restaurant.fromJson(json)).toList();
}
