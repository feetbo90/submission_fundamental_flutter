import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:submission1_fund_flutter/components/restaurant_list.dart';

import '../components/custom_appbar.dart';
import '../components/header_title.dart';
import '../components/subtitle_text.dart';
import '../widget/platform_widget.dart';

class HomeScreens extends StatelessWidget {
  static const routeName = '/home_list';

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: CustomAppBar(),
        preferredSize: Size(MediaQuery.of(context).size.width, 60),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              HeaderTitle(),
              SubtitleText(title: "Top Restaurants"),
              const RestaurantList(),
            ],
          ),
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
            children: <Widget>[
              HeaderTitle(),
              SubtitleText(title: "Top Restaurants"),
              const RestaurantList(),
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
