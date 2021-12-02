import 'package:flutter/material.dart';
import 'package:restaurant_app/detail/detail_page.dart';
import 'package:restaurant_app/home/restaurant_card.dart';
import 'package:restaurant_app/model/restaurant.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/local_restaurant.json'),
        builder: (context, snapshot) {
          final List<Restaurant> restaurants = parseRestaurants(snapshot.data);
          return CustomScrollView(
            slivers: <Widget>[
              _sliverAppBar(),
              SliverToBoxAdapter(
                child: _searchField(),
              ),
              SliverList(
                delegate: _sliverChildBuilderDelegate(restaurants),
              ),
            ],
          );
        },
      ),
    );
  }

  SliverAppBar _sliverAppBar() {
    return SliverAppBar(
      pinned: false,
      snap: true,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          'RESTAURANT APP',
          style: Theme.of(context).textTheme.caption!.copyWith(
                fontSize: 20,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
      ),
      leading: const Icon(
        Icons.menu,
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.favorite,
          ),
          tooltip: 'Your Favorite',
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _searchField() {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Find Restaurant",
            style: Theme.of(context).textTheme.caption!.copyWith(
                  fontSize: 16,
                ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                flex: 7,
                child: TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                      hintText: 'Search Restaurant'),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                flex: 3,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Search',
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  SliverChildBuilderDelegate _sliverChildBuilderDelegate(
      List<Restaurant> restaurants) {
    return SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  DetailPage(restaurant: restaurants[index]),
            ),
          ),
          child: RestaurantCard(restaurant: restaurants[index]),
        );
      },
      childCount: restaurants.length,
    );
  }
}
