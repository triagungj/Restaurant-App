import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/api/favorite_provider.dart';
import 'package:restaurant_app/ui/detail/detail_page.dart';
import 'package:restaurant_app/widgets/restaurant_card.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Favorite'),
      ),
      body: Consumer<FavoriteProvider>(
          builder: (context, FavoriteProvider data, widget) {
        return ListView.builder(
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => DetailPage(
                      restaurantId: data.favoriteRestaurants[index].id),
                ),
              ),
              child: RestaurantCard(
                restaurant: data.favoriteRestaurants[index],
                isFavorite: data.favoriteRestaurants
                    .contains(data.favoriteRestaurants[index]),
                onFavorite: () {
                  setState(() {
                    if (!data.favoriteRestaurants
                        .contains(data.favoriteRestaurants[index])) {
                      data.favorite(data.favoriteRestaurants[index]);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        duration: Duration(milliseconds: 1),
                        content: Text("Added from Favorite"),
                      ));
                    } else {
                      data.removeFavorite(data.favoriteRestaurants[index]);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Removed to Favorite"),
                        duration: Duration(seconds: 1),
                      ));
                    }
                  });
                },
              ),
            );
          },
          itemCount: data.favoriteRestaurants.length,
        );
      }),
    );
  }
}
