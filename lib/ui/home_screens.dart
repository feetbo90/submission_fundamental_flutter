import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission1_fund_flutter/components/restaurant_list.dart';
import 'package:submission1_fund_flutter/data/api/api_service.dart';
import 'package:submission1_fund_flutter/data/provider/restaurants_provider.dart';
import 'package:submission1_fund_flutter/widget/custom_appbar_sliver.dart';
import '../../components/custom_appbar.dart';

class HomeScreens extends StatelessWidget {
  static const routeName = '/home_list';

  const HomeScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: const CustomAppBar(),
        preferredSize: Size(MediaQuery.of(context).size.width, 60),
      ),
      body: ChangeNotifierProvider(
        create: (_) => RestaurantsProvider(apiService: ApiService()),
        child: CustomScrollView(
          slivers: [
            Consumer<RestaurantsProvider>(
              builder: (context, provider, _) {
                return SliverPersistentHeader(
                  delegate: CustomAppbarSliver(
                      expandedHeight: 150, provider: provider),
                );
              },
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 70,
              ),
            ),
            Consumer<RestaurantsProvider>(
              builder: (context, state, _) {
                if (state.state == ResultState.loading) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if (state.state == ResultState.hasData) {
                  return SliverList(
                      delegate: SliverChildListDelegate(state.result.restaurants
                          .map((restaurant) =>
                              RestaurantList(restaurants: restaurant))
                          .toList()));
                } else if (state.state == ResultState.hasDataSearch) {
                  return SliverList(
                      delegate: SliverChildListDelegate(state
                          .searchResult.restaurants
                          .map((restaurant) =>
                              RestaurantList(restaurants: restaurant))
                          .toList()));
                } else if (state.state == ResultState.error) {
                  return SliverFillRemaining(
                    child: Center(
                      child: Text(state.message),
                    ),
                  );
                } else {
                  return SliverFillRemaining(
                    child: Center(
                      child: Text(state.message),
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }

}
