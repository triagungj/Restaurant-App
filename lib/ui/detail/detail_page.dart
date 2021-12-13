import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/detail_restaurant_result.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    Key? key,
    required this.restaurantId,
  }) : super(key: key);

  final String restaurantId;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late Future<DetailRestaurantsResult> _restaurant;

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  Future<void> _refresh() async {
    setState(() {
      _restaurant = ApiService().fetchDetailRestaurant(widget.restaurantId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _restaurant,
        builder: (context, AsyncSnapshot<DetailRestaurantsResult> snapshot) {
          var state = snapshot.connectionState;
          if (state != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasData) {
              var restaurant = snapshot.data?.detailRestaurant;
              return RefreshIndicator(
                  onRefresh: _refresh,
                  child: SingleChildScrollView(
                    child: SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _detailPicture(restaurant!.pictureId),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _detailRestaurantName(restaurant.name),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    _detailRating(restaurant.rating),
                                    const SizedBox(width: 15),
                                    _detailCity(restaurant.city),
                                  ],
                                ),
                                _detailDeskripsi(restaurant.description),
                                if (restaurant.menus.foods.isNotEmpty)
                                  _detailFood(restaurant.menus.foods),
                                const SizedBox(height: 18),
                                if (restaurant.menus.drinks.isNotEmpty)
                                  _detailDrinks(restaurant.menus.drinks),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ));
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else {
              return const Text('');
            }
          }
        },
      ),
    );
  }

  Widget _detailPicture(String pictureId) {
    return Stack(
      children: [
        Hero(
          tag: pictureId,
          child: Image.network(
            'https://restaurant-api.dicoding.dev/images/medium/$pictureId',
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.black12,
            ),
            height: 40,
            width: 40,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).colorScheme.primary,
                // size: 32,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ],
    );
  }

  Widget _detailRestaurantName(String restaurantName) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.background,
          ),
        ),
      ),
      child: Text(
        restaurantName,
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }

  Widget _detailRating(double rating) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Icon(
            Icons.star,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          const SizedBox(width: 3),
          Text(
            "$rating/5",
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      ),
    );
  }

  Widget _detailCity(String city) {
    return Row(
      children: [
        Icon(
          Icons.location_pin,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
        const SizedBox(width: 3),
        Text(
          city,
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ],
    );
  }

  Widget _detailDeskripsi(String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        description,
        style: Theme.of(context).textTheme.bodyText2,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _detailFood(List<Category> foods) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).colorScheme.background,
                ),
              ),
            ),
            child: Text(
              "Foods",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              foods.length,
              (index) {
                int number = index + 1;
                return Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    '$number. ${foods[index].name}',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _detailDrinks(List<Category> drinks) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).colorScheme.background,
                ),
              ),
            ),
            child: Text(
              "Drinks",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              drinks.length,
              (index) {
                int number = index + 1;
                return Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    '$number. ${drinks[index].name}',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
