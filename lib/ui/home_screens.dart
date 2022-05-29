import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission1_fund_flutter/components/restaurant_list.dart';
import 'package:submission1_fund_flutter/data/api/api_service.dart';
import 'package:submission1_fund_flutter/data/provider/restaurants_provider.dart';
import 'package:submission1_fund_flutter/widget/custom_appbar_sliver.dart';

import '../../components/custom_appbar.dart';
import '../../components/header_title.dart';
import '../../components/subtitle_text.dart';
import '../../widget/platform_widget.dart';

class HomeScreens extends StatelessWidget {
  static const routeName = '/home_list';

  const HomeScreens({Key? key}) : super(key: key);

  Widget _buildAndroid(BuildContext context) {
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

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Restaurant App'),
        transitionBetweenRoutes: false,
        padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: Colors.white),
        margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const <Widget>[
              HeaderTitle(),
              SubtitleText(title: "Top Restaurants"),
              // RestaurantList(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
