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
              Image.network(widget.restaurant.pictureId),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
                        widget.restaurant.name,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
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
                        const SizedBox(width: 15),
                        Row(
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
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      widget.restaurant.description,
                      style: Theme.of(context).textTheme.bodyText2,
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 16),
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
                    // Container(
                    //   child: ListView.builder(
                    //     itemCount: widget.restaurant.menu!.foods.length,
                    //     itemBuilder: (context, index) {
                    //       return Container();
                    //     },
                    //   ),
                    // )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
