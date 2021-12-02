import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restaurant.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.restaurant}) : super(key: key);

  final Restaurant restaurant;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _detailPicture(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _detailRestaurantName(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _detailRating(),
                        const SizedBox(width: 15),
                        _detailCity(),
                      ],
                    ),
                    _detailDeskripsi(),
                    if (widget.restaurant.menu!.foods.isNotEmpty) _detailFood(),
                    const SizedBox(height: 18),
                    if (widget.restaurant.menu!.drinks.isNotEmpty)
                      _detailDrinks(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _detailPicture() {
    return Stack(
      children: [
        Hero(
          tag: widget.restaurant.pictureId,
          child: Image.network(
            widget.restaurant.pictureId,
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.primary,
            size: 32,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }

  Widget _detailRestaurantName() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.background,
          ),
        ),
      ),
      child: Text(
        widget.restaurant.name,
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }

  Widget _detailRating() {
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
            "${widget.restaurant.rating}/5",
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      ),
    );
  }

  Widget _detailCity() {
    return Row(
      children: [
        Icon(
          Icons.location_pin,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
        const SizedBox(width: 3),
        Text(
          widget.restaurant.city,
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ],
    );
  }

  Widget _detailDeskripsi() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        widget.restaurant.description,
        style: Theme.of(context).textTheme.bodyText2,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _detailFood() {
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
              "Food",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              widget.restaurant.menu!.foods.length,
              (index) {
                int number = index + 1;
                return Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    '$number. ${widget.restaurant.menu!.foods[index].name}',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _detailDrinks() {
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
              widget.restaurant.menu!.drinks.length,
              (index) {
                int number = index + 1;
                return Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    '$number. ${widget.restaurant.menu!.drinks[index].name}',
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
