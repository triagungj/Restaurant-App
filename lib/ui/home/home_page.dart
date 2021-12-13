import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/restaurant_result.dart';
import 'package:restaurant_app/ui/detail/detail_page.dart';
import 'package:restaurant_app/widgets/restaurant_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<RestaurantsResult> _restaurants;
  late Future<SearchRestaurantsResult> _searchRestaurantsResult;
  TextEditingController textSearchController = TextEditingController();
  bool _onSearch = false;

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  Future<void> _refresh() async {
    setState(() {
      _restaurants = ApiService().fetchRestaurants();
    });
  }

  // Future<void> _search(String query) async {
  //   setState(() {
  //     _searchRestaurantsResult = ApiService().searchRestaurant(query);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _restaurants,
        builder: (context, AsyncSnapshot<RestaurantsResult> snapshot) {
          var state = snapshot.connectionState;
          if (state != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            );
          } else {
            if (snapshot.hasData) {
              var restaurants = snapshot.data?.restaurants;
              return RefreshIndicator(
                color: Theme.of(context).colorScheme.onSecondary,
                onRefresh: _refresh,
                child: CustomScrollView(
                  slivers: <Widget>[
                    _sliverAppBar(),
                    SliverToBoxAdapter(
                      child: _searchField(),
                    ),
                    if (!_onSearch)
                      SliverList(
                        delegate: _sliverChildBuilderDelegate(restaurants!),
                      ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('No Connection'),
                    ElevatedButton(
                        onPressed: _refresh, child: const Text('Try again'))
                  ],
                ),
              );
            } else {
              return const Text('');
            }
          }
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
                  controller: textSearchController,
                  // onTap: () {
                  //   setState(() {
                  //     _onSearch = true;
                  //   });
                  // },
                  onFieldSubmitted: (value) {},
                  onChanged: (value) {
                    setState(() {
                      if (value == '') {
                        _onSearch = false;
                      } else {
                        _onSearch = true;
                      }
                      // _onSearch = false;
                    });
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    hintText: 'Search Restaurant',
                  ),
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
                  DetailPage(restaurantId: restaurants[index].id),
            ),
          ),
          child: RestaurantCard(restaurant: restaurants[index]),
        );
      },
      childCount: restaurants.length,
    );
  }
}
