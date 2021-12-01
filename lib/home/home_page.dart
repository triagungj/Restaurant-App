import 'package:flutter/material.dart';
import 'package:restaurant_app/detail/detail_page.dart';
import 'package:restaurant_app/home/restaurant_card.dart';
import 'package:restaurant_app/model/restaurant.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
              SliverAppBar(
                pinned: false,
                snap: true,
                floating: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    'RESTAURANT',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                  ),
                ),
                centerTitle: true,
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
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Find A Restaurant",
                        style: Theme.of(context).textTheme.bodyText2,
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
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
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
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
