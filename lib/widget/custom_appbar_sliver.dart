import 'package:flutter/material.dart';
import 'package:submission1_fund_flutter/data/provider/restaurants_provider.dart';
import '../components/header_title.dart';
import '../components/search_widget_home.dart';
import '../components/subtitle_text.dart';

class CustomAppbarSliver extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final RestaurantsProvider provider;

  CustomAppbarSliver({required this.expandedHeight, required this.provider});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        const HeaderTitle(),
        Positioned(
          bottom: -1,
          left: 16,
          right: 16,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: SearchWidgetHome(provider: provider)
            ),
          ),
        ),
         Positioned(
          child: Container(
            margin: const EdgeInsets.fromLTRB(1.0, 5.0, 3.0, 4.0),
            child: const SubtitleText(title: "Top Restaurants and Menus"),
          ),
          bottom: -75,
          left: 16,
        )
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
