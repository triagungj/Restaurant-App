import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/restaurant_result.dart';

class RestaurantCard extends StatefulWidget {
  const RestaurantCard(
      {Key? key,
      required this.restaurant,
      required this.onFavorite,
      required this.isFavorite})
      : super(key: key);

  final Restaurant restaurant;
  final Function() onFavorite;
  final bool isFavorite;

  @override
  State<RestaurantCard> createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primary,
      shadowColor: Theme.of(context).colorScheme.secondary,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(48),
                  bottomRight: Radius.circular(48)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Hero(
                        tag: widget.restaurant.pictureId!,
                        child: Image.network(
                          '${ApiService.basePictureUrl}${widget.restaurant.pictureId!}',
                          fit: BoxFit.fill,
                          height: 120,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(8, 8, 12, 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.restaurant.name,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                              ),
                        ),
                        Text(
                          widget.restaurant.description!,
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    fontStyle: FontStyle.italic,
                                  ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.location_pin,
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  widget.restaurant.city!,
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  "${widget.restaurant.rating} / 5",
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: IconButton(
                icon: Icon(widget.isFavorite
                    ? Icons.favorite_outlined
                    : Icons.favorite_outline),
                padding: EdgeInsets.zero,
                onPressed: widget.onFavorite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
